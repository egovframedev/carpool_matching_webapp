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
				카풀 정보 관리<small>목록보기</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href=" <c:url value='/'/>"><i class="fa fa-home"></i>
						Home</a></li>
				<li><a href="<c:url value='/admin/carpool/list'/>">카풀 정보 관리</a></li>
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
											<c:out value="${cri.searchType eq 'id'? 'selected' : ''}"/>>출발지</option>
										<option value="end"
											<c:out value="${cri.searchType eq 'nm'? 'selected' : ''}"/>>도착지</option>
										<option value="dirver"
											<c:out value="${cri.searchType eq 'type'? 'selected' : ''}"/>>운전자</option>
										<option value="rider"
											<c:out value="${cri.searchType eq 'email'? 'selected' : ''}"/>>동승자</option>
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
								<th style="width: 5%;">체결ID</th>
								<th style="width: 10%;">운전자</th>
								<th style="width: 10%;">동승자</th>
								<th style="width: 20%;">출발지 / 출발시간</th>
								<th style="width: 20%;">도착지</th>
								<th style="width: 10%;">인원 / 요금</th>
								<th style="width: 10%;">진행상황</th>
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
									<td>${history.seat_num } 명<br>${history.amount } 원
									</td>
									<td>${history.pay_date }</td>
									<td><c:if test="${history.progress eq 0 }">
									카풀 대기
									</c:if> <c:if test="${history.progress eq 1 }">
									승인
									</c:if> <c:if test="${history.progress eq 2 }">
									탑승
									</c:if> <c:if test="${history.progress eq 3 }">
									결제 완료
									</c:if>
									<c:if test="${history.progress eq 9 }">
									취소
									</c:if>
									</td>
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
	</div>
	</section>
	<!-- /.content -->
</div>
</div>
<!-- 컨텐츠 끝  -->

<script>
	$(document).ready(function() {
		//appendYear();
		//appendMonth();

		$('#year').change(function() {
			// 드롭다운리스트에서 선택된 값을 텍스트박스에 출력
			var selectedText = $("#year option:selected").text();
			//$("option:selected").text();
			//$(":selected").text();  // 드롭다운리스트가 하나밖에 없다면 이렇게 써도 됨

		});

		$('#month').change(function() {
			// 드롭다운리스트에서 선택된 값을 텍스트박스에 출력
			var selectedText = $("#month option:selected").text();
			//$("option:selected").text();
			//$(":selected").text();  // 드롭다운리스트가 하나밖에 없다면 이렇게 써도 됨
			frm.submit();
		});
	});

	function appendYear() {
		var date = new Date();
		var year = date.getFullYear();
		var selectValue = document.getElementById("year");
		var optionIndex = 0;

		/* for (var i = year; i >= year - 30; i--) {
			var sss = '';
			if(i==${param.year}){
				
				sss = "selected='selected'";
			}
			selectValue.add(new Option(i , i, sss), optionIndex++);
		} */
	}

	function appendMonth() {
		var selectValue = document.getElementById("month");
		var optionIndex = 0;

		for (var i = 1; i <= 12; i++) {
			selectValue.add(new Option(i, i), optionIndex++);
		}
	}
</script>
<%@ include file="../includes/footer.jsp"%>
