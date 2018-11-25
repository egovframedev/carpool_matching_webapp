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
							<th><c:out value="${cpinfo.carpool.startPoint}" /></th>
							<th class="bg-info" style="witdh:100px;">
								출발지</th>
							<th><c:out value="${cpinfo.carpool.endPoint}" /></th>
						</tr>
						<tr>
							<th class="bg-default">출발일시</th>
							<th><c:out value="${cpinfo.carpool.startDateTime}" /></th>
							<th class="bg-info">좌석수</th>
							<th><c:out value="${cpinfo.carpool.seatNum}" /></th>
						</tr>
						<tr>
							<th class="bg-danger">비용</th>
							<th><c:out value="${cpinfo.carpool.charge}" />원</th>
							<th class="bg-info">동승조건</th>
							<th><!-- 카풀 조건 -->
								<c:choose>
									<c:when test="${cpinfo.carpool.seatOpt == 1}">
										<span class="label label-success">조수석</span>
									</c:when>
									<c:otherwise>
										<span class="label label-success">뒷자리</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${cpinfo.carpool.driveOpt == 1}">
										<span class="label label-warning">대화가능</span>
									</c:when>
									<c:when test="${cpinfo.carpool.driveOpt == 2}">
										<span class="label label-warning">조용하게</span>
									</c:when>
									<c:when test="${cpinfo.carpool.driveOpt == 3}">
										<span class="label label-warning">음악을 들으며</span>
									</c:when>
									<c:otherwise>
										<span class="label label-warning">정주행</span>
									</c:otherwise>
								</c:choose>
								<c:if test="${cpinfo.carpool.trunkUse}">
									<span class="label label-primary">트렁크사용</span>
								</c:if>
								<c:if test="${!cpinfo.carpool.smokeUse}">
									<span class="label label-danger">비흡연</span>
								</c:if>
							</th>
						</tr>
					</tbody>
				</table>
			</div><!-- /.box-body -->
		</div>
		<!-- 지도 부분 -->
		<div class="box">
			<div class="box-body">
				<div id="map" style="width:100%;height:400px;"></div>
			</div>
		</div><!-- // 지도 부분 -->
		<!-- 추가내용 부분  -->
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title">추가 내용</h3>
			</div>
			<div class="box-body">
				<p><c:out value="${cpinfo.carpool.reqMsg}"></c:out> </p>
			</div>
			<div class="box-footer">
				<button type="button" class="btn btn-default pull-left" onclick="location.href='list';">
					<i class="fa fa-list"></i> 목록 가기
				</button>
				<button type="button" class="btn btn-success pull-right">동승제의</button>
			</div>
		</div>
		<!-- // 추가내용 -->
		<div class="margin pull-right">
			<button type="button" class="btn btn-warning btn-lg">수정</button>
			<button type="button" class="btn btn-danger btn-lg">삭제</button>
			<button type="button" class="btn btn-info btn-lg">목록 가기</button>
		</div>
		
		<!-- 동승 제의 목록 -->
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">동승 제의</h3>
				<div class="box-tools">
					<ul class="list-inline">
						<li>
							<select id="seatNum" class="form-control">
							<c:forEach var="num" begin="1" end="${cpinfo.carpool.seatNum}">
								<option value="${num}">${num} 명</option>
							</c:forEach>
							</select>
							<input type="hidden" id="mno" value="${login.mno}" />
						</li>
						<li>
							<button type="button" id="btnMatch" class="btn btn-success">동승제의</button>
						</li>
					</ul>
				</div>
			</div>			
			<div id="resultList" class="box-body">
				<div class="overlay">
	              <i class="fa fa-refresh fa-spin"></i>
	            </div>
			</div>
		</div>
		
	</section><!-- /.content -->
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=696a80bf76359ec5e09adde78a569f4f"></script>
<script>
	!(function($){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
	       		center: new daum.maps.LatLng(${cpinfo.carpool.startLat}, ${cpinfo.carpool.startLong}),
				       level: 3 // 지도의 확대 레벨
			};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var startSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
	    startSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
	    startOption = { 
	        offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
	    };
		// 출발 마커 이미지를 생성합니다
		var startImage = new daum.maps.MarkerImage(startSrc, startSize, startOption);
		// 출발 마커가 표시될 위치입니다 
		var startPosition = new daum.maps.LatLng(${cpinfo.carpool.startLat}, ${cpinfo.carpool.startLong});
		// 출발 마커를 생성합니다
		var startMarker = new daum.maps.Marker({
		    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
		    position: startPosition,
		    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
		    image: startImage // 출발 마커이미지를 설정합니다
		});
		
		var arriveSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
		arriveSize = new daum.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
		arriveOption = { 
		    offset: new daum.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};
		// 도착 마커 이미지를 생성합니다
		var arriveImage = new daum.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);	
		// 도착 마커가 표시될 위치입니다 
		var arrivePosition = new daum.maps.LatLng(${cpinfo.carpool.endLat}, ${cpinfo.carpool.endLong});
		// 도착 마커를 생성합니다 
		var arriveMarker = new daum.maps.Marker({  
		    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
		    position: arrivePosition,
		    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
		    image: arriveImage // 도착 마커이미지를 설정합니다
		});
		
		var cpno = ${cpinfo.carpool.cpno};
		// 동승제의 목록 가져오기.
		function getCarpoolMatching(cpno) {
			$.get( 
				"<c:url value='/carpool/request'/>/getMatching?cpno=" + cpno,
				function(data) {
					console.log(data);
					$("#resultList").html(data);
			});
		}
		getCarpoolMatching(cpno);
	
	})(window.jQuery);
</script>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
