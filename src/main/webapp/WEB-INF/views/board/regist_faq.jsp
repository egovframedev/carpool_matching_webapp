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
					<div class="col-md-10 col-md-offset-1">
						<!-- form -->
						<form method="post" role="form">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">글 작성</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<div class="form-group">
										<label>제목</label><input class="form-control" name="title"
											placeholder="제목을 입력해주세요" />
									</div>
									<div class="form-group">
										<label>작성자</label><input class="form-control" name="writer"
											type="text" placeholder="작성자를 입력해주세요" />
									</div>
									<div class="form-group">
										<label>내용</label>
										<textarea id="taContent" class="form-control" name="content"
											style="height: 300px"></textarea>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="submit" class="btn btn-success">
											<i class="fa fa-pencil"></i> 글 작성
										</button>
									</div>
									<button type="button" class="btn btn-default"
										onclick="location='list_faq'">
										<i class="fa fa-list"></i> 목록
									</button>
								</div>
								<!-- /.box-footer -->
								<!-- /. box -->
							</div>
						</form>
						<!-- /. form -->
					</div>
					<!-- /.col -->
				</div>
			</section>
		</section>
		<!-- /.content -->
	</div>
</div>
<!-- /.content-wrapper -->
<script src="<c:url value='/'/>vendor/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//CKEDITOR.replace('#taContent');
		//var bno = ${boardDTO.bno};
		var formObj = $("form[role='form']");
		var rootPath = '<c:url value="/"/>';
		var boardPath = rootPath + 'board/${cri.btype}';
		//게시물 목록으로 이동
		$("#btnList").on("click", function() {
			formObj.attr("action", boardPath + "/list");
			formObj.attr("method", "get");
			formObj.submit();
		});
	});
</script>
<%@ include file="../includes/footer.jsp"%>