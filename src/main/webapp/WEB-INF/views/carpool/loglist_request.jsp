<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<!-- 컨텐츠 헤더 부분(Page header) -->
			<section class="content-header">
				<h1><i class="fa fa-car" aria-hidden="true"></i>
					카풀 내역<small>목록 보기</small></h1>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/carpool/request/loglist'/>"><i class="fa fa-dashboard"></i> 카풀 내역</a></li>
					<li class="active">목록보기</li>
				</ol>
			</section>
		</section>
	<!-- 메인 컨텐츠 부분 -->
	<section class="content container-fluid">
		<!-- 검색 부분 -->
		<div class="box box-primary">
			<div class="box-header with-border">
				<!-- <h3 class="box-title">카풀 내역 목록</h3> -->
				<div class="row">
					<form method="get" class="navbar-form">
					<div class="col-md-6">
						<div class="form-group">
							<select id="year" name="year" class="form-control">
								<option value="">- 년도 -</option>
								<option value="2018">2018년</option>
								<option value="2018">2018년</option>
								<option value="2019">2019년</option>
							</select>
							<select id="month" name="month" class="form-control">
								<option value="">- 월 -</option>
								<c:forEach var="i" begin="1" end="12">
									<fmt:formatNumber var="m" minIntegerDigits="2" value="${i}" type="number"/>
									<option value="${m}">${i}월</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<select name="searchType" class="form-control" style="width: 140px;">
								<option value="">- 검색 옵션 -</option>
								<option value="START">출발지</option>
								<option value="END">도착시간</option>
								<option value="DRIVER">운전자</option>								
							</select>
						</div>
						<div class="form-group">
							<input type="text" name="keyword" id="inputKeyword" class="form-control"
										placeholder="Search.." style="width: 260px;">
						</div>
						<button type="submit" class="btn btn-warning" id="btnSearch" title="검색">
							<i class="fa fa-search"></i> 검색</button>
					</div>
					</form>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>체결ID</th>
							<th>운전자</th>
							<th>출발지 -&gt; 도착지 / 출발시간</th>
							<th>인원/결제금액</th>
							<th>결제일자</th>
							<th>진행상황</th>							
							<th>처리버튼</th>							
						</tr>
					</tbody>
					<tbody>
					<c:forEach var="log" items="${logList}">
						<tr>
							<td>${log.matchno}</td>
							<td>${log.driverName}</td>
							<td>${log.startPoint} -&gt;
								${log.endPoint} <br /> 
								/ <fmt:formatDate value="${log.startDatetime}" pattern="yyyy-MM-dd a KK:mm" /> </td>
							<td>${log.cpnum} 인/ <br/> 
								<fmt:formatNumber value="${log.amount}" pattern="#,###원" /></td>
							<td><fmt:formatDate value="${log.payDate}" pattern="yyyy-MM-dd" /></td>
							<td><c:choose>
								<c:when test="${log.progress == 1 }">
									<span class="label label-primary">동승수락</span>
								</c:when>
								<c:when test="${log.progress == 2 }">
									<span class="label label-success">결제완료</span>
								</c:when>
								<c:when test="${log.progress == 3 }">
									<span class="label label-warning">결제취소</span>
								</c:when>
								<c:otherwise>
									<span class="label label-defatult">대기</span>
								</c:otherwise>			
							</c:choose></td>
							<td><a href="#" class="btn btn-default btn-sm">결제내역</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div><!-- /.box-body -->
			<div class="box-footer clearfix  text-center">
              <ul class="pagination no-margin">
                <li><a href="#">«</a></li>
                <li class="active"><a href="#">1</a></li>              
                <li><a href="#">»</a></li>
              </ul>
            </div>
		</div> <!-- /.box -->
	</section><!-- /.content -->
	</div>
</div>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
