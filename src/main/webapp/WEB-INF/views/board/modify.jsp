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
						<form method="post" role="form" action="modify">
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
										<button type="submit" class="btn btn-success">
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
	var formObj = $("form[role='form']");
	var rootPath = '<c:url value="/"/>';
	var boardPath = rootPath + 'board/${cri.btype.small}';

	function back() {
		var btype = ${cri.btype.ordinal()};
		if (btype == 1) { //faq 일 경우 상세보기 페이지 없음/ 리스트로 보내줌
			self.location = boardPath + "/list";
		}
		if (btype != 1) {
			self.location = boardPath
					+ "/detail?bno=${boardDTO.bno}&page=${cri.page}";
		}
	}
</script>
<%@ include file="../includes/footer.jsp"%>