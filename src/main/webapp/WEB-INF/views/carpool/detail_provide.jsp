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
					카풀 요청<small>상세 보기</small></h1>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/carpool/request/list'/>"><i class="fa fa-dashboard"></i> 카풀 요청</a></li>
					<li class="active">카풀 상세 보기</li>
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
							<th><c:out value="${cpinfo.startPoint}" /></th>
							<th class="bg-info" style="witdh:100px;">
								출발지</th>
							<th><c:out value="${cpinfo.endPoint}" /></th>
						</tr>
						<tr>
							<th class="bg-danger">출발일시</th>
							<th><fmt:formatDate value="${cpinfo.startDateTime}" pattern="yyyy년 MM월 dd일 HH시 mm분" /></th>
							<th class="bg-info">동승인원</th>
							<th><c:out value="${cpinfo.seatNum}" />명</th>
						</tr>
						<tr>
							<th class="bg-danger">비용</th>
							<th><c:out value="${cpinfo.charge}" />원/인</th>
							<th class="bg-info">동승조건</th>
							<th><!-- 카풀 조건 -->
								<c:choose>
									<c:when test="${cpinfo.seatOpt == 1}">
										<span class="label label-success">조수석</span>
									</c:when>
									<c:otherwise>
										<span class="label label-success">뒷자리</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${cpinfo.driveOpt == 1}">
										<span class="label label-warning">대화가능</span>
									</c:when>
									<c:when test="${cpinfo.driveOpt == 2}">
										<span class="label label-warning">조용하게</span>
									</c:when>
									<c:when test="${cpinfo.driveOpt == 3}">
										<span class="label label-warning">음악을 들으며</span>
									</c:when>
									<c:otherwise>
										<span class="label label-warning">정주행</span>
									</c:otherwise>
								</c:choose>
								<c:if test="${cpinfo.trunkUse}">
									<span class="label label-primary">트렁크사용</span>
								</c:if>
								<c:if test="${!cpinfo.smokeUse}">
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
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">추가 내용</h3>
			</div>
			<div class="box-body">
				<p><c:out value="${cpinfo.reqMsg}"></c:out></p>
				<ul>
					<li>차량 번호: ${cpinfo.driver.car_no}</li>
					<li>차량 색상: ${cpinfo.driver.car_color}</li>
					<li>차량 모델: ${cpinfo.driver.car_model}</li>
					<li>차량 년식: ${cpinfo.driver.car_year}년</li>
				</ul>
			</div>
			<div class="box-footer text-center">
				<button type="button" class="btn btn-default" onclick="location.href='list';">
					<i class="fa fa-list"></i> 목록 가기
				</button>
			</div>
		</div>
		<!-- 동승 제의 목록 -->
		<div class="box box-danger">
			<div class="box-header with-border" style="padding-bottom: 20px;">
				<h3 class="box-title">동승 제의</h3>
				
				<div class="box-tools">
					<ul class="list-inline" style="margin-top: 4px;">
						<li>
							<select id="seatNum" class="form-control">
							<c:forEach var="num" begin="1" end="${cpinfo.seatNum}">
								<option value="${num}">${num} 명</option>
							</c:forEach>
							</select>
						</li>
						<li>
							<button type="button" id="btnMatch" class="btn btn-success" style="margin-top: -8px;">
								<i class="fa fa-user-plus"></i> 동승 제의</button>
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
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=696a80bf76359ec5e09adde78a569f4f"></script>
<script>
	!(function($){
		var ctxPath = '<c:url value="/carpool/provide/"/>';
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
	       		center: new daum.maps.LatLng(${cpinfo.startLat}, ${cpinfo.startLong}),
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
		var startPosition = new daum.maps.LatLng(${cpinfo.startLat}, ${cpinfo.startLong});
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
		var arrivePosition = new daum.maps.LatLng(${cpinfo.endLat}, ${cpinfo.endLong});
		// 도착 마커를 생성합니다 
		var arriveMarker = new daum.maps.Marker({  
		    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
		    position: arrivePosition,
		    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
		    image: arriveImage // 도착 마커이미지를 설정합니다
		});
		
		var cpno = ${cpinfo.cpno};
		// 동승제의 목록 가져오기.
		function getCarpoolMatching(cpno) {
			$.get( 
				"getMatching?cpno=" + cpno,
				function(data) {
					//console.log(data);
					$("#resultList").html(data);
			});
		}
		getCarpoolMatching(cpno);
		
		$("#btnMatch").on("click", function(e){
			var cpno = ${cpinfo.cpno},
				charge = ${cpinfo.charge},
				cpnum = $("#seatNum").val();
			console.log(cpno + ", " +  charge + ", " + cpnum);
			$.ajax({
				type: 'post',
				url: 'requestMatching',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType: 'text',
				data: JSON.stringify({cpno: cpno, cpnum: cpnum, charge: charge }),
				success: function(result) {
					if(result.trim() == "SUCCESS") {
						alert("해당 카풀에 동승을 요청하였습니다.");
						getCarpoolMatching(cpno);
					}
				},
				error: function(jqXHR, textStatus) {
					// alert( "Request failed: " + textStatus );
					alert("로그인인 필요한 기능입니다.");
				}
			});
		});
	
	})(window.jQuery);
</script>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
