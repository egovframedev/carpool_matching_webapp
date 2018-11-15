<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>
	<!-- 콘텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 콘텐츠 헤더 부문(Page header) -->
		<section class="content-header">
			<h1>EXTENSION BOARD <small>Article List</small></h1>
			<ol class="breadcrumb">
				<li><a href="/"><i class="fa fa-home"></i> Home</a></li>
				<li><a href="/xboard/list">확장 게시판</a></li>
				<li class="active">목록 보기</li>
			</ol>
		</section> <!-- //.content-header -->	
		<!-- 메인 콘텐츠 부분 -->
		<section class="content">
			<!-- BOX UI 컴포넌트 -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">게시글 목록 보기</h3>	
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-6"></div>
						<div class="col-sm-6 text-right">
							<!-- 게시글 검색 폼 -->
							<form action="list" method="get" class="navbar-form" style="padding:10px 0px;">
								<input type="hidden" name="page" value="1" />				
								<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />				
								<div class="form-group">			
									<select name="searchType" class="form-control" style="width: 140px;">
									 	<option value="n" <c:out value="${cri.searchType == null? 'selected' : ''}"/>>검색조건선택</option>
									 	<option value="t" <c:out value="${cri.searchType eq 't'? 'selected' : ''}"/>>제목</option>
									 	<option value="c" <c:out value="${cri.searchType eq 'c'? 'selected' : ''}"/>>내용</option>
									 	<option value="w" <c:out value="${cri.searchType eq 'w'? 'selected' : ''}"/>>작성자</option>
									 	<option value="tc" <c:out value="${cri.searchType eq 'tc'? 'selected' : ''}"/>>제목+내용</option>
									 	<option value="cw" <c:out value="${cri.searchType eq 'cw'? 'selected' : ''}"/>>내용+작성자</option>
									 	<option value="tcw" <c:out value="${cri.searchType eq 'tcw'? 'selected' : ''}"/>>제목+내용+작성자</option>
									</select>
								</div>
								<div class="form-group">
			                  		<input type="text" name="keyword" id="inputKeyword" class="form-control" value="${cri.keyword}" placeholder="Search"  style="width: 240px;">							
								</div>
			                    <button type="submit" class="btn btn-warning" id="btnSearch"><i class="fa fa-search"></i> 검색</button>&nbsp;&nbsp;
			                    <a href="/xboard/write" class="btn btn-primary" id="btnWrite"><i class="fa fa-pencil"></i> 글쓰기</a>							
							</form>
						</div>
					</div>
					<!-- 게시글 목록 부분 -->	
	            	<table class="table table-hover">
	              		<thead>
	                	<tr>
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
							<td><c:forEach begin="1" end="${board.bIndent}">&nbsp;&nbsp;</c:forEach>
								<c:if test="${board.bno ne board.bGroup}"><small class="label label-danger">RE:</small> </c:if>
								<a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${board.bno}">${board.title} 
									<strong>[${board.replycnt}]</strong></a></td>
							<td>${board.writer}</td>
							<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
							<td><span class="badge bg-red">${board.viewcnt}</span></td>
	                	</tr>
	            	</c:forEach>	                
	               </tbody>
	               </table>
	            </div><!-- /.box-body -->
				<div class="box-footer text-center">
					<ul class="pagination">
					<c:if test="${pageMaker.prev}">	
	                  <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}" title="이전">&laquo;</a></li>
	                </c:if>
	                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	                  <li<c:if test="${pageMaker.cri.page == idx}"> class="active"</c:if>>
	                  	<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>                
	                </c:forEach>
	                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	                  <li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}" title="다음">&raquo</a></li>
	                </c:if>
	                </ul>
				</div><!-- /.box-footer-->
			</div><!-- /.box -->
			
		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->
	
	<script>
		$(document).ready(function(){
		<c:if test="${! empty msg}">
			var result = '${msg}';
			alert(result);
		</c:if>		
			$("#btnSearch").on("click", function(evt){
				evt.preventDefault();
				console.log("btnSearch Click......");
				self.location = "list"
					+ '${pageMaker.makeQuery(1)}'
					+ '&searchType='
					+ $("select[name='searchType'] option:selected").val()
					+ "&keyword=" + $('#inputKeyword').val();
			});
			
			$("#btnNew").on("click", function(evt){
				evt.preventDefault();
				console.log("btnNew Click......");
				self.location = "write";
			});
		});
	</script>
	
<%@ include file="../includes/footer.jsp"%>