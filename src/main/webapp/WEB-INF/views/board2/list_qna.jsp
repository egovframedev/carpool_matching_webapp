<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp"%>
	<!-- 콘텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 콘텐츠 헤더 부문(Page header) -->
		<section class="content-header">
			<h1>${pageMaker.cri.btitle} <small>목록 보기</small></h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
				<li><a href="<c:url value='/board/list'/>${pageMaker.cri.btype}">고객센터</a></li>
				<li class="active">${pageMaker.cri.btitle}</li>
			</ol>
		</section><!-- //.content-header -->	
		<!-- 메인 콘텐츠 부분 -->
		<section class="content container-fluid">
			<!-- BOX UI 컴포넌트 -->
			<div class="box box-primary">
				<!-- 박스 헤더 -->
				<div class="box-header" style="height:60px;">
				 	<div class="box-tools">
				 		<form id="searchForm" action="list" method="get" class="navbar-form">
							<input type="hidden" name="page" value="${pageMaker.cri.page}"/>				
							<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}" />				
							<div class="form-group">			
								<select name="searchType" class="form-control" style="width: 140px;">
								 	<option value="n"   <c:out value="${pageMaker.cri.searchType == null? 'selected' : ''}"/>>검색조건선택</option>
								 	<option value="T"   <c:out value="${pageMaker.cri.searchType eq 'T'? 'selected' : ''}"/>>제목</option>
								 	<option value="C"   <c:out value="${pageMaker.cri.searchType eq 'C'? 'selected' : ''}"/>>내용</option>
								 	<option value="W"   <c:out value="${pageMaker.cri.searchType eq 'W'? 'selected' : ''}"/>>작성자</option>
								 	<option value="TC"  <c:out value="${pageMaker.cri.searchType eq 'TC'? 'selected' : ''}"/>>제목+내용</option>
								 	<option value="TW"  <c:out value="${pageMaker.cri.searchType eq 'TW'? 'selected' : ''}"/>>제목+작성자</option>
								 	<option value="TCW" <c:out value="${pageMaker.cri.searchType eq 'TCW'? 'selected' : ''}"/>>제목+내용+작성자</option>
								</select>
							</div>
							<div class="form-group">
		                  		<input type="text" name="keyword" class="form-control" value="${pageMaker.cri.keyword}" placeholder="검색어..."  style="width: 240px;">							
							</div>
		                    <button type="submit" class="btn btn-warning" id="btnSearch"><i class="fa fa-search"></i> 검색</button>&nbsp;&nbsp;		                    
						</form>
				 	</div>
				</div> <!-- //.box-header -->
				 <!-- 박스 본문 -->
				<div class="box-body">
					<!-- 게시글 목록 부분 -->	
	            	<table class="table table-hover table-striped">
	              	<thead>
	                	<tr class="bg-primary">
	                		<th style="width:60px">No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						    <th style="width:60px">조회수</th>
	                	</tr>
	              		</thead>
	                <tbody>
	            	<c:forEach var="board" items="${list}" varStatus="status">
	                	<tr>
							<td>${board.bno}</td>
							<td><a class="move" href="<c:out value='${board.bno}'/>">
									<c:out value="${board.title}" /></td>
							<td><c:out value="${board.writer}"/></td>
							<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
							<td>${board.viewcnt}</td>
	                	</tr>
	            	</c:forEach>	                
	               </tbody>
	               </table>
	            </div><!-- /.box-body --> 
	            <!-- 페이지네이션 -->
				<div class="box-footer text-center">
					<ul class="pagination">
					<c:if test="${pageMaker.prev}">	
	                  <li class="paginate_button previous">
	                  	<a href="${pageMaker.startPage -1}" title="이전">&laquo;</a></li>
	                </c:if>
	                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                  <li class="paginate_button ${pageMaker.cri.page == numm ? 'active':''}">
	                  	<a href="${num}">${num}</a></li>                
	                </c:forEach>
	                <c:if test="${pageMaker.next}">
	                  <li class="paginate_button next">
	                  	<a href="${pageMaker.endPage + 1}" title="다음">&raquo</a></li>
	                </c:if>
	                </ul>
	                <form id="actionForm" ation="list" method='get'>
	                	<input type="hidden" name="page" value="${pageMaker.cri.page}"/>				
						<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}" />		
						<input type="hidden" name="searchType" value="${pageMaker.cri.searchType}" />		
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />		
	                </form>
					<div class="pull-right">
						<button type="button" class="btn btn-primary" id="btnNew"><i class="fa fa-pencil"></i>&nbsp; 글쓰기</button>	
					</div>
				</div><!-- //.box-footer-->
			</div><!-- //.box -->			
		</section><!-- //.content -->
	</div><!-- //.content-wrapper -->
	<!-- 모달창 추가 -->
	<div class="modal fade" id="resModal" tabindex="-1" role="dialog"
		aria-labelledby="resModalLebel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            	<div class="modal-header">
                	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                		<span aria-hidden="true">&times;</span></button>
                	<h4 class="modal-title"><i class="fa fa-check test-success"></i> Success</h4>
            	</div>
            	<div class="modal-body">처리가 완료되었습니다.</div>
            	<div class="modal-footer">
                	<button type="button" class="btn btn-default pull-left">닫기</button>
                	<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
            	</div>
            </div><!-- //.modal-content -->
        </div><!-- //.modal-dialog -->
    </div><!-- //.modal -->
<script>
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result) {
			if(result === '' || history.state) {
				return;
			}
			if(parseInt(result) > 0) {
				$(".modal-body").html(
					"게시글 " + parseInt(result) + "번이 등록되었습니다.");
			}
			$("#resModal").modal("show");
		}
				
		$("#btnNew").on("click", function(evt){
			self.location = "write";
		});
		
		var searchForm = $("#searchForm");
		
		$("#btnSearch").on("click", function(e){
			if(!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='page']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			//console.log("click");
			actionForm.find("input[name='page']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='" + 
					$(this).attr("href") + "'>");
			actionForm.attr("action", "read");
			actionForm.submit();
		});
		
	});
</script>	
<%@ include file="../includes/footer.jsp"%>

