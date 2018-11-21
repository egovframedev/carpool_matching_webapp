<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
	.uploadResult { width: 100%; background-color: #eee;}
	.uploadResult ul {display:flex; flex-flow: row; justify-content:center; align-items: center;}
	.uploadResult ul li { position: relative; list-style: none; padding: 10px; align-content: center; text-align: center; }
	.uploadResult ul li img {height: 80px;}
	.uploadResult ul li span {color: white;}
	.uploadResult .del {display: block; position: absolute; top: 0; right: 0; font-size: 20px; font-weight: bold;
		line-height: 24px;width: 24px; background-color: #e1e1e1;border-radius: 50%;color: red; cursor:pointer;}
	.bigPictureWrapper {position: absolute; display: none; justify-content: center; align-items: center;top: 0%;
		width: 100%;height: 100%; background-color: gray; z-index: 100;	background: rgba(255,255,255,0.5);}
	.bigPicture { position: relative; display: flex;; justify-content: center; align-item: center;}
	.bigPicture img { width: 600px;}
</style>
	<!-- 콘텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 콘텐츠 헤더 부문(Page header) -->
		<section class="content-header">
			<h1>${cri.btitle} <small>새 글쓰기</small></h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
				<li><a href="<c:url value='/board/list'/>${cri.btype}">고객센터</a></li>
				<li class="active">${cri.btitle}</li>
			</ol>
		</section><!-- //.content-header -->	
		<!-- 메인 콘텐츠 부분 -->
		<section class="content">
			<div class="box box-primary">
            	<form  id="writeForm" name="writeForm" action="write" role="form" method="post">      
            	<input type="hidden" name="btype" value="${cri.btype}" />
            	<div class="box-body">
                	<div class="form-group">
                  		<label for="inputTitle">글 제목</label>
                  		<input type="text" class="form-control" name="title" id="inputTitle" placeholder="제목 입력" required="required">
                	</div>
                	<div class="form-group">
	                	<label for="inputContent">글 내용</label>
	                	<textarea class="form-control" name="content"  id="inputContent" rows="10" placeholder="내용 입력" required="required"></textarea>
	                </div>
                	<div class="form-group">
                  		<label for="inputWriter">작성자</label>
                  		<input type="text" class="form-control" name="writer" id="inputWriter" 
                  			value='admin001' readonly="readonly">
                	</div>         
                </div><!-- /.box-body -->
				<div class="box-footer text-right">
                	<button type="submit" class="btn btn-primary">
                		<i class="fa fa-check"></i>&nbsp;완 료</button>
                	&nbsp;&nbsp;&nbsp;
                	<button type="reset" class="btn btn-default">취 소</button>
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
	$(document).ready(function() {
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; // 5MB
		var ctxPath = '<c:url value="/"/>';
		
		// CK 에디터 추가
		CKEDITOR.replace('inputContent');
		
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
			console.log("------------------");
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
		
		var formObj = $("#writeForm");
		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");
			var str = "";
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += '<input type="hidden" name="attachList[' + i + '].fileName" value="'+ jobj.data("filename") +'"/>';
				str += '<input type="hidden" name="attachList[' + i + '].uuid" value="'+ jobj.data("uuid") +'"/>';
				str += '<input type="hidden" name="attachList[' + i + '].uploadPath" value="'+ jobj.data("path") +'"/>';
				str += '<input type="hidden" name="attachList[' + i + '].fileType" value="'+ jobj.data("type") +'"/>';
			});
			formObj.append(str).submit();
		});
		
		$(".uploadResult").on("click", "button", function(e){
			console.log("delete file .......");
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: ctxPath + 'deleteFile',
				data: {fileName: targetFile, type: type},
				dataType: 'text',
				type: 'POST',				
				success: function(result) {
					alert(result);
					targetLi.remove();
				}
			}); //$.ajax
			
		});
	});
</script>
<%@ include file="../includes/footer.jsp"%>