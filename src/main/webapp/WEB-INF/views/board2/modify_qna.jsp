<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includes/header.jsp"%>
<style type="text/css">
	.uploadResult { width: 100%; background-color: #eee;}
	.uploadResult ul {display:flex; flex-flow: row; justify-content:center; align-items: center;}
	.uploadResult ul li {list-style: none; padding: 10px; align-content: center; text-align: center; }
	.uploadResult ul li img { width:120px; height: 100px;}
	.uploadResult ul li span {display: block; color: #333; width:120px; word-break:break-all; }
	.uploadResult li div {position: relative;}
	.uploadResult li button {position: absolute; top: 14px; right: -10px;}
	.bigPictureWrapper {position: absolute; display: none; justify-content: center; align-items: center;top: 0%;
		width: 100%;height: 100%; background-color: gray; z-index: 100;	background: rgba(255,255,255,0.5);}
	.bigPicture { position: relative; display: flex;; justify-content: center; align-item: center;}
	.bigPicture img { width: 600px;}
</style>
	<!-- Content Wrapper. Containes page content -->
	<div class="content-wrapper">
		<!-- 콘텐츠 헤더 부문(Page header) -->
		<section class="content-header">
			<h1>${cri.btitle} <small>글 수정</small></h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
				<li><a href="<c:url value='/board/list'/>${cri.btype}">고객센터</a></li>
				<li class="active">${cri.btitle}</li>
			</ol>
		</section><!-- //.content-header -->	
	
		<!-- Main Content -->
		<section class="content">
			<div class="box box-primary">
            	<!-- form start -->
            	<form role="form" name="modForm" action="modify" method="post">
           		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
           		<input type="hidden" name="page" value="${cri.page}" />
           		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
           		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
				<input type="hidden" name="searchType" value="${cri.searchType}"/>
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<input type="hidden" name="bno" value="${board.bno}" />
				<%-- <input type="hidden" name="btype" value="${fn:toUpperCase(cri.btype)}" /> --%>
				
            	<div class="box-body">
                	<div class="form-group">
                  		<label for="inputTitle">글 제목</label>
                  		<input type="text" class="form-control" name="title" id="inputTitle" placeholder="제목 입력" 
                  			value="${board.title}" />
                	</div>
                	<div class="form-group">
	                	<label for="inputContent">글 내용</label>
	                	<textarea class="form-control" name="content"  id="inputContent" rows="8" placeholder="내용 입력">${board.content}</textarea>
	                </div>
                	<div class="form-group">
                  		<label>작성자</label>
                  		<input type="text" class="form-control" name="writer" value="${board.writer}" readonly="readonly"/>
                	</div>
                	<div class="form-group">
                  		<label>작성일</label>
                  		<input type="text" class="form-control" readonly="readonly"
                  			value="<fmt:formatDate pattern='yyyy-MM-dd' value='${board.regdate}'/>" />
                	</div>
                </div><!-- /.box-body -->
				<div class="box-footer text-right">
				    <button type="submit" class="btn btn-primary" id="btnSubmit">
                		<i class="fa fa-pencil"></i>&nbsp;글 수정</button>&nbsp;&nbsp;
                	<button type="button" class="btn btn-danger" id="btnRemove">
                		<i class="fa fa-trash"></i>&nbsp;글 삭제</button>&nbsp;&nbsp;
                	<button type="button" class="btn btn-default" id="btnCancel">
					<i class="fa fa-mail-reply"></i>&nbsp;취 소</button>
              	</div>
            </form>
          </div><!-- /.box -->
          <div class="box box-solid">
         	<div class="box-header with-border">
         		<div class="form-group uploadDiv" style="margin-bottom:0;">
           			<input type="file" name="uploadFile" multiple="multiple"/>         		
         		</div>
         	</div>
         	<div class="box-body clearfix" style="min-height:120px;">
         		<div class="uploadResult">
         			<ul></ul>
         		</div>
         	</div>
         </div>			
		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->
<script src="${pageContext.request.contextPath}/vendor/ckeditor/ckeditor.js"></script>

<script>
	$(document).ready(function(){
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; // 5MB
		var boardPath = '<c:url value="/board/${cri.btype}/"/>'; 
		var ctxPath = '<c:url value="/"/>';
		var formObj = $("form[name='modForm']");
		var bno = '<c:out value="${board.bno}"/>';
		//var csrfHeaderName = "${_csrf.headerName}";
		//var csrfTokenValue = "${_csrf.token}";
		
		
		$.getJSON( boardPath + "getAttachList", {bno: bno}, function(arr){
			// console.log(arr);
			var str = "";
			$(arr).each(function(i, attach){
				// image type
				if(attach.fileType) {
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
					str += '<li data-path="'+attach.uploadPath + '" data-uuid="' + attach.uuid 
						+ '" data-filename="'+ attach.fileName +'" data-type="'+ attach.fileType +'"><div>';	
					str += '<button type="button" data-file="'+ fileCallPath +'" data-type="image" class="btn btn-warning btn-sm"><i class="fa fa-times"></i></button><br/>';
					str += '<img src="<c:url value="/"/>display?fileName=' + fileCallPath + '" class="img-thumbnail" />';
					str += '<span>'+ attach.fileName +'</span>';
					str += "</div></li>";
				} else  {
					str += '<li data-path="'+attach.uploadPath + '" data-uuid="' + attach.uuid 
						+ '" data-filename="'+ attach.fileName +'" data-type="'+ attach.fileType +'"><div>';
					str += '<button type="button" data-file="'+ fileCallPath +'" data-type="file" class="btn btn-warning btn-sm"><i class="fa fa-times"></i></button><br/>';
					str += '<img src="<c:url value="/"/>img/attach.png" class="img-thumbnail"></a>';
					str += '<span>'+ attach.fileName +'</span>';
					str += '</div></li>';
				}
			});
			$(".uploadResult ul").html(str);
		});
		function checkExtension(fileName, fileSize) {
			
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("input[type='file']").change(function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			console.log("파일 변경 됨.");
			console.log(files);
			
			for(var i = 0; i < files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: ctxPath + 'uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType: 'json',
				//beforeSend: function(xhr) {
				//	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				//},
				success: function(result) {
					console.log(result);
					showUploadResult(result); // 업로드 처리 함수
				}
			}); // $.ajax
		}); // input[type='file']
		
		function showUploadResult(uploadResultArr) {
			if(!uploadResultArr || uploadResultArr.length == 0) {
				return; 
			}
			var uploadUL = $(".uploadResult ul");
			var str = "";
			$(uploadResultArr).each(function(i, obj){
				// image type
				if(obj.image) {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					str += '<li data-path="'+obj.uploadPath + '" data-uuid="' + obj.uuid 
						+ '" data-filename="'+ obj.fileName +'" data-type="'+ obj.image +'"><div>';
					str += '<span>'+ obj.fileName +'</span>';
					str += '<button type="button" data-file="'+ fileCallPath +'" data-type="image" class="btn btn-warning btn-circle"><i class="fa fa-times"></i></button><br/>';
					str += '<img src="'+ ctxPath + 'display?fileName=' + fileCallPath + '" alt="' + obj.fileName + '" />';
					str += "</div></li>";
				} else  {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/_" + obj.uuid + "_" + obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					str += '<li data-path="'+obj.uploadPath + '" data-uuid="' + obj.uuid 
						+ '" data-filename="'+ obj.fileName +'" data-type="'+ obj.image +'"><div>';
					str += '<span>'+ obj.fileName +'</span>';
					str += '<button type="button" data-file="'+ fileCallPath +'" data-type="file" class="btn btn-warning btn-circle"><i class="fa fa-times"></i></button><br/>';
					str += '<img src="' + ctxPath + 'img/attach.png"></a>';
					str += '</div></li>';				}
			});
			uploadUL.append(str);
		}
		
		$(".uploadResult").on("click", "button", function(e){
			console.log("delete file");
			if(confirm("파일을 삭제하시겠습니까?")) {
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
		
		// CK 에디터 추가
		CKEDITOR.replace('inputContent');
		
		// 수정을 취소하고 게시글 목록으로 이동
		$("#btnCancel").on("click", function(){
		<c:if test="${!empty cri.keyword}">
			self.location = baordPath + "/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		</c:if>
		<c:if test="${empty cri.keyword}">
			self.location = baordPath + "/list?page=${cri.page}&perPageNum=${cri.perPageNum}";
		</c:if>
		});
		
		// 게시글 수정 처리 하기
		$("#btnSubmit").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");
			var str ="";
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);				
				str += '<input type="hidden" name="attachList[' + i + '].fileName" value="'+ jobj.data("filename") +'"/>';
				str += '<input type="hidden" name="attachList[' + i + '].uuid" value="'+ jobj.data("uuid") +'"/>';
				str += '<input type="hidden" name="attachList[' + i + '].uploadPath" value="'+ jobj.data("path") +'"/>';
				str += '<input type="hidden" name="attachList[' + i + '].fileType" value="'+ jobj.data("type") +'"/>';
			});
			fromObj.append(str).submit();
		});
		
		$("#btnRemove").on("click", function(e){
			e.preventDefault();
			if(confirm("삭제하시겠습니까?")) {
				formObj.attr("action", boardPath + "/remove");
			} else {
				return false;
			}
			formObj.submit();
		});
	});
</script>
<%@ include file="../includes/footer.jsp"%>