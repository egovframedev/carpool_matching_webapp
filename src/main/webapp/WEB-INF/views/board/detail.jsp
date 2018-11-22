<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<%@ include file=".././includes/header.jsp"%>
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
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">글 상세보기</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<div class="mailbox-read-info">

									<form role="form" action="" method="post">
										<input type=hidden name="bno" value="${boardDTO.bno}" /> <input
											type="hidden" name="page" value="${cri.page}" /> <input
											type="hidden" name="perPageNum" value="${cri.perPageNum}" />
										<input type="hidden" name="searchType"
											value="${cri.searchType}" /> <input type="hidden"
											name="keyword" value="${cri.keyword}" />
										<input type="hidden" name="grpno" value="${boardDTO.grpno }">
										<input type="hidden" name="step" value="${boardDTO.step }"/>
									<input type="hidden" name="depth" value="${boardDTO.depth }"/>
									</form>

									<h3>${boardDTO.title }
										<span class="mailbox-read-time pull-right"> 조회수
											${boardDTO.hit }</span>
									</h3>
									<h5>
										${boardDTO.writer }<span class="mailbox-read-time pull-right">
											<fmt:formatDate value="${boardDTO.reg_date}"
												pattern="yyyy년 M월 d일 HH시 mm분" />
										</span>
									</h5>
								</div>
								<!-- /.mailbox-read-info -->

								<div class="mailbox-read-message">
									<%-- 	${boardDTO.files} --%>
									${boardDTO.content }
								</div>
								<!-- /.mailbox-read-message -->
							</div>


							<div class="box-footer">
								<div class="pull-right">
									<button type="button" class="btn btn-default" id="btnList">
										<i class="fa fa-list"></i> 목록
									</button>
								</div>
								<button type="button" class="btn btn-default" id="btnRemove">
									<i class="fa fa-trash-o"></i> 삭제
								</button>
								<button type="button" class="btn btn-default" id="btnModify"
									>
									<i class="fa fa-edit"></i> 수정
								</button>
								<button type="button" class="btn btn-default" id="btnReply">
									<i class="fa fa-pencil"></i> 답글 작성
								</button>
							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /. box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</section>
		<!-- /.content -->
	</div>
</div>
<!-- /.content-wrapper -->

<script type="text/javascript">
$(document).ready(function(){
	//var bno=${boardDTO.bno};
	var formObj = $("form[role='form']");
	var rootPath = '<c:url value="/"/>';
	var boardPath = rootPath + 'board/${cri.btype.small}';
	
	//게시물 목록으로 이동
	$("#btnList").on("click", function(){
		self.location = boardPath + "/list?page=${cri.page}";
	});

	// 수정 페이지로 이동
	$("#btnModify").on("click", function(){
		formObj.attr("action", boardPath + "/modify");
		formObj.attr("method", "get");
		formObj.submit();
	});	
	
	// 답글 작성 페이지로 이동
	$("#btnReply").on("click", function(){
		formObj.attr("action", boardPath + "/reply");
		formObj.attr("method", "get");
		formObj.submit();
	});

	// 삭제 페이지로 이동
	$("#btnRemove").on("click", function(){
		var arr = [];
		var delConfirm = confirm('해당 게시글을 삭제합니까?');
		if(delConfirm) { 
			$(".uploadedList li").each(function(index){
				arr.push($(this).attr("data-src"));
			});
			if(arr.length > 0) {
				$.post("/deleteAllFiles", {files:arr}, function(){
					// 첨부 파일 삭제 처리.
				});
			}
			formObj.attr("action", boardPath + "/delete");
			formObj.submit();
		}
	});
});
</script>
<%@ include file=".././includes/footer.jsp"%>