<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
<div class="content-wrapper">
	<div class="col-sm-offset-1 col-sm-10">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>
				결제 정산 관리<small>목록보기</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href=" <c:url value='/'/>"><i class="fa fa-home"></i>
						Home</a></li>
				<li><a href="<c:url value='/admin/pay/list'/>">결제 정산 관리</a></li>
				<li class="active">목록보기</li>
			</ol>
		</section>
		<!-- 메인 컨텐츠 부분 -->
		<section class="content container-fluid">
			<!-- serch 부분 -->
			<div class="box-body">
				<div id="example1_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap">
					<div class="row">
						<form action="list" method="get" class="navbar-form"
							style="padding: 10px 0px;" name="frm">
							<div class="col-sm-6">
								<div class="form-group">

									<select id="year" name="year" class="form-control">

										<%
											Date today = new Date();
											int year = today.getYear() + 1900;
											ArrayList<Integer> arr = new ArrayList();

											for (int i = year; i > year - 30; i--) {
												arr.add(i);
											}
										%>

										<option value="">- 연도 -</option>
										<c:forEach var="i" items="<%=arr%>">
											<c:set var="sss" value="" />
											<c:if test="${i==param.year }">
												<c:set var="sss" value="selected" />
											</c:if>
											<option value="${i }" ${sss }>${i }</option>

										</c:forEach>
									</select> <select id="month" name="month" class="form-control">
										<option value="">- 월 -</option>

										<c:forEach var="i" begin="01" end="12">
											<c:set var="sss" value="" />
											<c:if test="${i==param.month }">
												<c:set var="sss" value="selected" />
											</c:if>
											<option value="${i }" ${sss }>${i }</option>
										</c:forEach>

									</select>
								</div>
							</div>

							<div class="col-sm-6 text-right">
								<input type="hidden" name="page" value="1" /> <input
									type="hidden" name="perPageNum" value="${cri.perPageNum}" />
								<div class="form-group">
									<select name="searchType" class="form-control"
										style="width: 140px;">
										<option value="n"
											<c:out value="${cri.searchType == null? 'selected' : ''}"/>>검색조건선택</option>
										<option value="start"
											<c:out value="${cri.searchType eq 'start'? 'selected' : ''}"/>>출발지</option>
										<option value="end"
											<c:out value="${cri.searchType eq 'end'? 'selected' : ''}"/>>도착지</option>
										<option value="dirver"
											<c:out value="${cri.searchType eq 'dirver'? 'selected' : ''}"/>>운전자</option>
										<option value="rider"
											<c:out value="${cri.searchType eq 'rider'? 'selected' : ''}"/>>동승자</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" name="keyword" id="inputKeyword"
										class="form-control" value="${cri.keyword}"
										placeholder="Search" style="width: 240px;">
								</div>
								<button type="submit" class="btn btn-warning" id="btnSearch"
									title="검색">
									<i class="fa fa-search"></i>
								</button>
								&nbsp;&nbsp;
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 리스트 테이블  -->
			<div class="row">
				<div class="col-sm-12">
					<table id="example1"
						class="table table-bordered table-striped dataTable" role="grid"
						aria-describedby="example1_info">

						<thead>
							<tr role="row">
								<th style="width: 4%;">체결ID</th>
								<th style="width: 8%;">운전자</th>
								<th style="width: 8%;">동승자</th>
								<th style="width: 25%;">출발지 / 출발시간</th>
								<th style="width: 25%;">도착지</th>
								<th style="width: 10%;">인원 / 요금</th>
								<th style="width: 10%;">결제 일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="history" items="${list}" varStatus="status">
								<tr role="row">
									<td>${history.matchno }</td>
									<td>${history.dname }</td>
									<td>${history.rname }</td>
									<td>${history.start_point }<br>${history.start_datetime }</td>
									<td>${history.end_point }</td>
									<td>${history.seat_num }명<br>${history.amount } 원
									</td>
									<td>${history.pay_date }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="box-footer text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}"
								title="이전">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:if test="${pageMaker.cri.page == idx}"> class="active"</c:if>>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}"
								title="다음">&raquo</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</section>
	</div>
	<!-- /.content -->
</div>
<!-- 컨텐츠 끝  -->

<script>
	$(document).ready(function() {
		$('#year').change(function() {
			var selectedText = $("#year option:selected").text();
			//$("option:selected").text();
			//$(":selected").text();  // 드롭다운리스트가 하나밖에 없다면 이렇게 써도 됨
		});

		$('#month').change(function() {
			var selectedText = $("#month option:selected").text();
			//$("option:selected").text();
			//$(":selected").text();  // 드롭다운리스트가 하나밖에 없다면 이렇게 써도 됨
			frm.submit();
		});
		
		$("#btnSearch").on("click",	function(evt) {
			evt.preventDefault();
			console.log("btnSearch Click......");
			self.location = "list"
							+ '${pageMaker.makeQuery(1)}'
							+ '&searchType='
							+ $("select[name='searchType'] option:selected").val()
							+ "&keyword="
							+ $('#inputKeyword').val()
							+ "&year="
							+ $('#year option:selected').val()
							+ "&month="
							+ $('#month option:selected').val();
		});
	});
</script>
<%@ include file="../includes/footer.jsp"%>
