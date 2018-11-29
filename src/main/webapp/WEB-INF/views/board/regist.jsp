<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="container">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>${cri.btype.btitle}
				<small>목록보기 </small>
			</h1>
			<ol class="breadcrumb">
				<li><a href=" <c:url value='/'/>"><i class="fa fa-home"></i>
						Home</a></li>
				<li><a href="<c:url value='/board/notice/list'/>">고객센터</a></li>
				<li class="active">${cri.btype.btitle}</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content container-fluid">
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<!-- form -->
						<form method="post" role="form" action="regist" name="writeForm"
							id="writeForm">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">글 작성</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<!-- 게시판 타입 넘겨주기 -->
									<input type="hidden" name="btype" value="${cri.btype }">
									<div class="form-group">
										<label>제목</label><input class="form-control" name="title"
											placeholder="제목을 입력해주세요" />
									</div>
									<div class="form-group">
										<label>작성자</label><input class="form-control" name="writer"
											type="text" value="${member.userid }" readonly />
									</div>
									<div class="form-group">
										<label>내용</label>
										<textarea id="content-editor" class="form-control"
											name="content" style="height: 400px"></textarea>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="submit" class="btn btn-success" id="btnSubmit">
											<i class="fa fa-pencil"></i> 글 작성
										</button>
									</div>
									<button type="button" class="btn btn-default" id="btnList"
										onclick="location='list'">
										<i class="fa fa-list"></i> 목록
									</button>
								</div>
								<!-- /.box-footer -->
								<!-- /. box -->
							</div>
						</form>
						<!-- /. form -->
						<c:if test="${cri.btype ne 'FAQ' }">
							<div class="box box-solid">
								<div class="box-header with-border">
									<div class="form-group uploadDiv" style="margin-bottom: 0;">
										<input type="file" name="uploadFile" multiple="multiple" />
									</div>
								</div>
								<div class="box-body clearfix" style="min-height: 120px;">
									<div class="uploadResult">
										<ul>
										</ul>
									</div>
								</div>
							</div>
						</c:if>
					</div>
					<!-- /.col -->
				</div>
			</section>
		</section>
		<!-- /.content -->
	</div>
</div>
<script src="<c:url value='/vendor'/>/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; // 5MB
		var ctxPath = '<c:url value="/"/>';
		
		// CK 에디터 추가
		CKEDITOR.replace('content-editor');
		
		function checkExtension(filename, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(filename)) {
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
					var fileCallPath = encodeURIComponent(obj.uploadpath + "/" + obj.uuid + "_" + obj.filename);
					str += '<li data-path="'+obj.uploadpath + '" data-uuid="' + obj.uuid 
						+ '" data-filename="'+ obj.filename +'" data-type="'+ obj.image +'"><div>';
					str += '<span>'+ obj.filename +'</span>';
					str += '<button type="button" data-file="'+ fileCallPath +'" data-type="image" class="btn btn-warning btn-xs btn-circle"><i class="fa fa-times"></i></button><br/>';
					str += '<img src="'+ ctxPath + 'display?filename=' + fileCallPath + '" alt="' + obj.filename + '" />';
					str += "</div></li>";
				} else  {
					var fileCallPath = encodeURIComponent(obj.uploadpath + "/_" + obj.uuid + "_" + obj.filename);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					str += '<li data-path="'+obj.uploadpath + '" data-uuid="' + obj.uuid 
						+ '" data-filename="'+ obj.filename +'" data-type="'+ obj.image +'"><div>';
					str += '<span>'+ obj.filename +' </span>';
					str += '<button type="button" data-file="'+ fileCallPath +'" data-type="file" class="btn btn-warning btn-xs btn-circle"><i class="fa fa-times"></i></button><br/>';
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
				console.dir("jobj");
				console.dir(jobj);
				
				str += '<input type="hidden" name="attachList[' + i + '].filename" value="'+ jobj.data("filename") +'"/>';
				str += '<input type="hidden" name="attachList[' + i + '].uuid" value="'+ jobj.data("uuid") +'"/>';
				str += '<input type="hidden" name="attachList[' + i + '].uploadpath" value="'+ jobj.data("path") +'"/>';
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
				data: {filename: targetFile, type: type},
				dataType: 'text',
				type: 'POST',				
				success: function(result) {
					alert(result);
					targetLi.remove();
				}
			}); //$.ajax
			
		});
		
		//게시물 목록으로 이동
		$("#btnList").on("click", function() {
			//var bno = ${boardDTO.bno};
			var formObj = $("form[role='form']");
			var rootPath = '<c:url value="/"/>';
			var boardPath = rootPath + 'board/${cri.btype.small}';
			
			formObj.attr("action", boardPath + "/list");
			formObj.attr("method", "get");
			formObj.submit();
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>