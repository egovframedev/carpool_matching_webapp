<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="col-sm-offset-1 col-sm-10">
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
					<div class="col-md-8 col-md-offset-2">
						<!-- form -->
						<form method="post" role="form" action="modify" id="modifyForm">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">글 수정</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">

									<!-- bno 값 가져가기 -->
									<input type="hidden" name="bno" value="${boardDTO.bno}" /> <input
										type="hidden" name="page" value="${cri.page}" /> <input
										type="hidden" name="perPageNum" value="${cri.perPageNum}" />
									<input type="hidden" name="searchType"
										value="${cri.searchType}" /> <input type="hidden"
										name="keyword" value="${cri.keyword}" />

									<div class="form-group">
										제목<input class="form-control" name="title"
											value="${boardDTO.title }" />
									</div>
									<c:if test="${cri.btype eq FAQ}">
										<div class="form-group">
											<input class="form-control" name="writer" type="hidden"
												value="${boardDTO.writer }" /><label>
												${boardDTO.writer }</label>
										</div>
									</c:if>
									<div class="form-group">
										내용
										<textarea id="compose-textarea" class="form-control"
											name="content" style="height: 300px">${boardDTO.content }</textarea>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="button" class="btn btn-success" id="btnSubmit">
									<!-- onclick="modifyGo()" -->
											<i class="fa fa-pencil"></i> 글 수정
										</button>
									</div>
									<button type="button" class="btn btn-default" onclick="back()">
										<i class="fa fa-chevron-left"></i> 뒤로가기
									</button>
								</div>
								<!-- /.box-footer -->
							</div>
							<!-- /. box -->
						</form>
						<!-- /. form -->
						<div class="box box-solid">
							<div class="box-header with-border">
								<div class="form-group uploadDiv" style="margin-bottom: 0;">
									<input type="file" name="uploadFile" multiple="multiple" />
								</div>
							</div>
							<div class="box-body clearfix" style="min-height: 120px;">
								<div class="uploadResult">
									<ul></ul>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
			</section>
		</section>
		<!-- /.content -->
	</div>
</div>
<!-- /.content-wrapper -->

<script type="text/javascript">

	//뒤로가기
	function back() {
		//var formObj = $("form[role='form']");
		var rootPath = '<c:url value="/"/>';
		var boardPath = rootPath + 'board/${cri.btype.small}';
		var btype = ${cri.btype.ordinal()};
		
		if (btype == 1) { //faq 일 경우 상세보기 페이지 없음/ 리스트로 보내줌
			self.location = boardPath + "/list";
		}
		if (btype != 1) {
			self.location = boardPath
					+ "/detail?bno=${boardDTO.bno}&page=${cri.page}";
		}
	}
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5MB
	var ctxPath = '<c:url value="/"/>';
	var bno=${boardDTO.bno};
	var rootPath = '<c:url value="/"/>';
	var boardPath = rootPath + 'board/${cri.btype.small}';

	 $(document).ready(function() {
		 var formObj = $("#modifyForm");
		 
		//게시글 수정 처리 하기
		 $("#btnSubmit").on("click", function(e){
		 	e.preventDefault();
		 	console.log("submit clicked");
		 	var str ="";
		 	$(".uploadResult ul li").each(function(i, obj){
		 		var jobj = $(obj);
		 		console.dir(jobj);				
		 		str += '<input type="hidden" name="attachList[' + i + '].filename" value="'+ jobj.data("filename") +'"/>';
		 		str += '<input type="hidden" name="attachList[' + i + '].uuid" value="'+ jobj.data("uuid") +'"/>';
		 		str += '<input type="hidden" name="attachList[' + i + '].uploadpath" value="'+ jobj.data("path") +'"/>';
		 		str += '<input type="hidden" name="attachList[' + i + '].fileType" value="'+ jobj.data("type") +'"/>';
		 	});
		 	console.log(str);
		 	formObj.append(str).submit();
		 });
		 
	$.getJSON( boardPath + "/getAttachList", {bno: bno}, function(arr){
		// console.log(arr);
		var str = "";
		$(arr).each(function(i, attach){
			// image type
			if(attach.fileType) {
				var fileCallPath = encodeURIComponent(attach.uploadpath + "/s_" + attach.uuid + "_" + attach.filename);
				str += '<li data-path="'+attach.uploadpath + '" data-uuid="' + attach.uuid 
					+ '" data-filename="'+ attach.filename +'" data-type="'+ attach.fileType +'"><div>';	
				str += '<button type="button" data-file="'+ fileCallPath +'" data-type="image" class="btn btn-warning btn-sm"><i class="fa fa-times"></i></button><br/>';
				str += '<img src="<c:url value="/"/>display?filename=' + fileCallPath + '" class="img-thumbnail" />';
				str += '<span>'+ attach.filename +'</span>';
				str += "</div></li>";
			} else  {
				str += '<li data-path="'+attach.uploadpath + '" data-uuid="' + attach.uuid 
					+ '" data-filename="'+ attach.filename +'" data-type="'+ attach.fileType +'"><div>';
				str += '<button type="button" data-file="'+ fileCallPath +'" data-type="file" class="btn btn-warning btn-sm"><i class="fa fa-times"></i></button><br/>';
				str += '<img src="<c:url value="/"/>img/attach.png" class="img-thumbnail"></a>';
				str += '<span>'+ attach.filename +'</span>';
				str += '</div></li>';
			}
		});
		$(".uploadResult ul").html(str);
	});
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
				var fileCallPath = encodeURIComponent(obj.uploadpath + "/s_" + obj.uuid + "_" + obj.filename);
				str += '<li data-path="'+obj.uploadpath + '" data-uuid="' + obj.uuid 
					+ '" data-filename="'+ obj.filename +'" data-type="'+ obj.image +'"><div>';
				str += '<span>'+ obj.filname +'</span>';
				str += '<button type="button" data-file="'+ fileCallPath +'" data-type="image" class="btn btn-warning btn-circle"><i class="fa fa-times"></i></button><br/>';
				str += '<img src="'+ ctxPath + 'display?filename=' + fileCallPath + '" alt="' + obj.filename + '" />';
				str += "</div></li>";
			} else  {
				var fileCallPath = encodeURIComponent(obj.uploadpath + "/_" + obj.uuid + "_" + obj.filename);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
				str += '<li data-path="'+obj.uploadpath + '" data-uuid="' + obj.uuid 
					+ '" data-filename="'+ obj.filename +'" data-type="'+ obj.image +'"><div>';
				str += '<span>'+ obj.filename +'</span>';
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
	});
	
	
</script>
<%@ include file="../includes/footer.jsp"%>