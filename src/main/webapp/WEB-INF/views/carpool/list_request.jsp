<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<style>
    .input-group .form-control.form-control-selectpicker {padding: 0; }
    .input-group .form-control.form-control-selectpicker > .btn-group.bootstrap-select { width: 100%;}
    .input-group .form-control-6 { width: 50%;}    
    .input-group .form-control.form-control-selectpicker .btn-group .btn { border: 0;}
    .input-group .form-control.form-control-selectpicker .btn-group.open .btn { border-radius: 0;}
    .mt10 {margin-top: 10px;}
    .carpool-info {}
    .carpool-info th { text-align: center;}
    .carpool-info img {width:60px; height:60px;}
    .carpool-info .user-name {display: block; text-align: center;}
    .carpool-info .start-point, .carpool-info .end-point {display: inline-block; width:45%; font-size: 16px;
    	text-overflow: ellipsis; white-space: nowrap; word-wrap:normal; overflow:hidden;}
    .carpool-info .arrow {display: inline-block; width: 8%; text-align: center; font-size:16px; color: #a1a1a1;}
    .carpool-info .start-time {display: block; margin-top: 1em; font-size: 16px; color:#2c3e50;}
    .carpool-info .seat-num, .carpool-info .charge {font-size:20px; font-weight: bold; color:#2c3e50; line-height:80px;}
    .carpool-info .seat-num>small { font-size: 14px; font-weight:normal; color:#7f8c8d; padding-left:4px;}
</style>
<!-- 컨텐츠 시작  -->
<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1><i class="fa fa-slideshare" aria-hidden="true"></i> 
				카풀 요청<small>태워주세요</small></h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
				<li><a href="<c:url value='/carpool/request/list'/>"> 카풀 요청</a></li>
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
							<table class="carpool-info table table-hover table-striped">
								<thead>
									<tr class="bg-primary">								
										<th style="width:10%">동승자</th>
										<th>출발지 
											<i class="fa fa-long-arrow-right" ria-hidden="true"></i> 
											도착지 / 출발시간
										</th>
										<th>자리</th>
										<th>금액</th>
									</tr>
								<thead>
								<tbody>
								<c:forEach var="cpinfo" items="${list}">
									<tr>
										<td class="text-center"><c:choose><%-- 프로필 사진 처리 --%>
											<c:when test="${!empty cpinfo.user.photo}">
												<img src="<c:url value="/img/user3-128x128.jpg"/>"
													alt="profile" class="img-circle" /> 
											</c:when>
											<c:when test="${cpinfo.user.gender.string eq 'MALE'}">
												<img src="<c:url value="/img/avatar_male_3.png"/>"
													alt="male" class="img-circle" /> 
											</c:when>
											<c:when test="${cpinfo.user.gender.string eq 'FEMALE'}">
												<img src="<c:url value="/img/avatar_female_1.png"/>"
													alt="male" class="img-circle"/> 
											</c:when>
											<c:otherwise>
												<img src="<c:url value="/img/avatar_female_6.png"/>"
													alt="male" class="img-circle"/> 
											</c:otherwise>
											</c:choose>
											<span class="user-name">${cpinfo.user.name}</span>
										</td>
										<td><a href="detail?cpno=${cpinfo.cpno}">
											<span class="start-point">${cpinfo.startPoint}</span> 
											<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
											<span class="end-point">${cpinfo.endPoint}</span></a>
											<span class="start-time"><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;
												<fmt:formatDate value="${cpinfo.startDateTime}" pattern="yyyy-MM-dd HH시 mm분"/></span>
										</td>
										<td><span class="seat-num">
												${cpinfo.seatNum}<small>좌석</small></span></td>
										<td><span class="charge">
												<fmt:formatNumber value="${cpinfo.charge}" pattern="#,###"/>원</span>/인</td>
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
									<i class="fa fa-plus"></i> 카풀 요청 등록
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
</div>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
