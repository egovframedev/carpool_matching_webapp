<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>카풀 요청<small>Carpool Request Page</small></h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/carpool/request/list'/>"><i class="fa fa-dashboard"></i> 카풀 요청</a></li>
				<li class="active">카풀 요청 보기</li>
			</ol>
		</section>
	</section>
	<!-- 메인 컨텐츠 부분 -->
	<section class="content container-fluid">
		<!-- 검색 부분 -->
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">카풀 요청 정보</h3>
			</div>
			
			<div class="box-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="bg-danger" style="witdh:100px;">
								출발지</th>
							<th>서울시 종로구 삼일대로 더조은아카데미</th>
							<th class="bg-info" style="witdh:100px;">
								출발지</th>
							<th>인천시 연수구 송도신도시 </th>
						</tr>
						<tr>
							<th class="bg-default">출발일시</th>
							<th>2018년 11월 17일 오전 9시 30분</th>
							<th class="bg-info">좌석수</th>
							<th>1/4</th>
						</tr>
						<tr>
							<th class="bg-danger">비용</th>
							<th>5,000원</th>
							<th class="bg-info">동승조건</th>
							<th>비흡연, 조수석 탑승, 트렁크사용, 대화가능</th>
						</tr>
					</tbody>
				</table>
			</div><!-- /.box-body -->
		</div>
		<!-- 지도 부분 -->
		<div class="box">
			<div class="box-body">
			<div id="map" style="width:100%;height:400px;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=696a80bf76359ec5e09adde78a569f4f"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new daum.maps.LatLng(33.450701, 126.570667),
						level: 3
					};			
					var map = new daum.maps.Map(container, options);
				</script>
			</div>
		</div><!-- // 지도 부분 -->
		<!-- 추가내용 부분  -->
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">추가 내용</h3>
			</div>
			
			<div class="box-body">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed iure ducimus vitae doloremque alias incidunt aspernatur velit 
				vel natus minima aliquid vero harum beatae assumenda perferendis adipisci saepe recusandae quos?</p>
			</div>
		</div>
		<!-- // 추가내용 -->
		<div class="margin pull-right">
			<button type="button" class="btn btn-warning btn-lg">수정</button>
			<button type="button" class="btn btn-danger btn-lg">삭제</button>
			<button type="button" class="btn btn-info btn-lg">목록 가기</button>
		</div>
		
		<!-- 동승 제의 목록 -->
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">동승 제의 목록</h3>
			</div>
			
			<div class="box-body">
				<table class="table table-striped">
					<thead>
					<tr>
						<th>column1</th>
						<th>column2</th>
						<th>column3</th>
						<th>column4</th>
						<th>column5</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>item1</td>
						<td>item2</td>
						<td>item3</td>
						<td>item4</td>
						<td>item5</td>
					</tr>
					<tr>
						<td>item1</td>
						<td>item2</td>
						<td>item3</td>
						<td>item4</td>
						<td>item5</td>
					</tr>
					<tr>
						<td>item1</td>
						<td>item2</td>
						<td>item3</td>
						<td>item4</td>
						<td>item5</td>
					</tr>
					<tr>
						<td>item1</td>
						<td>item2</td>
						<td>item3</td>
						<td>item4</td>
						<td>item5</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
		
	</section><!-- /.content -->
</div>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
