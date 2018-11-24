<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
    .input-group .form-control.form-control-selectpicker {padding: 0; }
    .input-group .form-control.form-control-selectpicker > .btn-group.bootstrap-select { width: 100%;}
    .input-group .form-control-6 { width: 50%;}    
    .input-group .form-control.form-control-selectpicker .btn-group .btn { border: 0;}
    .input-group .form-control.form-control-selectpicker .btn-group.open .btn { border-radius: 0;}
    .mt10 {margin-top: 1em;}
</style>
<!-- 컨텐츠 시작  -->
<div class="content-wrapper">
	<!-- 컨텐츠 헤더 부분(Page header) -->
	<section class="content-header">
		<h1>카풀 요청<small>Carpool Request Page</small></h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> 카풀 요청</a></li>
			<li class="active">카풀 요청 조회</li>
		</ol>
	</section>
	<!-- 메인 컨텐츠 부분 -->
	<section class="content container-fluid">
		<!-- 검색 부분 -->
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">카풀 요청 조회</h3>
			</div>
			<div class="box-body">
				<form action="${request.requestURI}" method="get">
				<div class="row">
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-map-marker text-danger" aria-hidden="true"></i> 출발지</span>
									<input type="text" class="form-control" name="searchStart" placeholder="출발지 입력...">							
								</div>
							</div>
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-map-marker text-primary" aria-hidden="true"></i> 도착지</span>
									<input type="text" class="form-control" name="searchEnd" placeholder="도착지 입력...">							
								</div>
							</div>
						</div>
						<div class="row mt10">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i> 출발일자</span>
									<input type="date" class="form-control" name="searchDate" placeholder="출발일자" />
									<span class="input-group-addon"><i class="fa fa-clock-o" aria-hidden="true"></i> 출발시간</span>
									<input type="text" class="form-control" name="searchTime" placeholder="출발시간 예 9:00" />
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<button type="submit" id="btnSearch" class="btn btn-lg btn-success btn-block" >
							<i class="fa fa-search"></i> 검색
						</button>						
					</div>
				</div>
				</form>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- // 검색 부분 -->
		<!-- 결과 리스트 부분 -->
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">카풀 요청 목록</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover table-striped">
							<thead>
								<tr class="bg-primary">
									<th>번호</th>
									<th>작성자</th>
									<th>출발지 <i class="fa fa-long-arrow-right"
										aria-hidden="true"></i> 도착지
									</th>
									<th>카풀조건</th>
									<th>인원(좌석)</th>
									<th>금액(1인당)</th>
								</tr>
							<thead>
							<tbody>
							<c:forEach var="cpinfo" items="${list}" varStatus="num">
								<tr>
									<td>${num.index + 1}</td>
									<td><c:choose><%-- 프로필 사진 처리 --%>
										<c:when test="${!empty cpinfo.user.photo}">
											<img src="<c:url value="/img/user3-128x128.jpg"/>"
												alt="profile" class="img-circle" style="width: 50px" /> 
										</c:when>
										<c:when test="${cpinfo.user.gender.string eq 'MALE'}">
											<img src="<c:url value="/img/avatar_male_3.png"/>"
												alt="male" class="img-circle" style="width: 50px" /> 
										</c:when>
										<c:when test="${cpinfo.user.gender.string eq 'FEMALE'}">
											<img src="<c:url value="/img/avatar_female_1.png"/>"
												alt="male" class="img-circle" style="width: 50px" /> 
										</c:when>
										<c:otherwise>
											<img src="<c:url value="/img/avatar_female_6.png"/>"
												alt="male" class="img-circle" style="width: 50px" /> 
										</c:otherwise>
										</c:choose>
										<span class="user-name">${cpinfo.user.name}</span></td>
									<td><a href="detail?cpno=${cpinfo.carpool.cpno}">
										<span class="start-point">${cpinfo.carpool.startPoint}</span> 
										<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
										<span class="end-point">${cpinfo.carpool.endPoint}</span></a>
									</td>
									<td>
										<span class="label label-success">요청중</span>
									</td>
									<td>${cpinfo.carpool.seatNum}</td>
									<td>${cpinfo.carpool.charge}원</td>
								</tr>
							</c:forEach>							
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
					<!-- 페이지네이션 -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin">
							<li><a href="#">«</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">»</a></li>
						</ul>
						<div class="btn-group pull-right">
							<button type="button" class="btn btn-primary pull-right" onclick="location.href='regist'">
								<i class="fa fa-plus"></i> 카풀 등록
							</button>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
