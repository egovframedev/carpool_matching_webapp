<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page session="false"%>
<%@ include file="../includes/header.jsp"%>
<!-- Content Wrapper. Containes page content -->
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
		<section class="content">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<label>FAQ</label>
					</h3>
					<div class="pull-right">
						<button type="button" class="btn btn-primary" id="btnNew">
							<i class="fa fa-pencil"></i> 글쓰기
						</button>
					</div>
				</div>

				<form role="form" action="" method="post">
					<input type="hidden" id="bno" name="bno" />


					<div class="box-body">
						<c:forEach var="board" items="${list}" varStatus="status">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title" id="-collapsible-group-item-#1-">

										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseOne${board.bno}" aria-expanded="false"
											aria-controls="collapseOne" class=""> Q. ${board.title }
										</a> <a class="anchorjs-link" href="#-collapsible-group-item-#1-"><span
											class="anchorjs-icon"></span></a>
										<button type="button" class="btn btn-default btn-sm"
											onclick="modifyGo(${board.bno })">수정</button>
										<button type="button" class="btn btn-default btn-sm"
											onclick="removeGo(${board.bno })">삭제</button>
									</h4>
								</div>
								<div id="collapseOne${board.bno}"
									class="panel-collapse collapse" role="tabpanel"
									aria-labelledby="headingOne" aria-expanded="false" style="">
									<div class="panel-body">A. ${board.content }</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</form>
			</div>
			<!-- /.box -->

		</section>
		<!-- /.content -->
	</div>
</div>
<!-- /.content-wrapper -->
<script type="text/javascript">
var formObj = $("form[role='form']");
var rootPath = '<c:url value="/"/>';
var boardPath = rootPath + 'board/${cri.btype.small}';

//글 수정
	function modifyGo(bno){
		formObj.attr("action", boardPath + "/modify");
		formObj.attr("method", "get");
		$("#bno").val(bno);
		formObj.submit();
	} 
	
	//글 삭제
	function removeGo(bno) {
		var arr = [];
		var delConfirm = confirm('해당 게시글을 삭제합니까?');
		if (delConfirm) {
			$(".uploadedList li").each(function(index) {
				arr.push($(this).attr("data-src"));
			});
			if (arr.length > 0) {
				$.post("/deleteAllFiles", {
					files : arr
				}, function() {
					// 첨부 파일 삭제 처리.
				});
			}
			formObj.attr("action", boardPath + "/delete");
			$("#bno").val(bno);
			formObj.submit();
		}
	}
	
	$(document).ready(function() {
		//var bno = ${boardDTO.bno};
		 if (test = "${! empty msg}") {
			var result = '${msg}';
		}
		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		} 

		// 글작성 부분 
		$("#btnNew").on("click", function(evt) {
			evt.preventDefault();
			console.log("btnNew Click......");
			self.location = "regist";
		});

	});
</script>

<%@ include file="../includes/footer.jsp"%>