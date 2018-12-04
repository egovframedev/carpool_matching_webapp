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
				<h3 class="box-title">카풀 내역 목록</h3>
			</div>
			<div class="box-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>체결ID</th>
							<th>운전자</th>
							<th>출발지 -&gt; 도착지</th>
							<th>출발시간</th>
							<th>인원/결제금액</th>
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
								${log.endPoint}</td>
							<td><fmt:formatDate value="${log.startDatetime}" pattern="yyyy-MM-dd" /></td>
							<td>${log.cpnum} / <br/> 
								<fmt:formatNumber value="${log.amount}" pattern="#,###원" /></td>
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
		</div> <!-- /.box -->
	</section><!-- /.content -->
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=696a80bf76359ec5e09adde78a569f4f"></script>
<script>

</script>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
