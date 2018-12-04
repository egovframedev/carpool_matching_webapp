<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<style type="text/css">
  .carpool-info {list-style: none; margin: 0; padding: 0;}
  .carpool-info li { height:38px; border-bottom: 1px solid #ddd; line-height:36px; font-size: 16px; color: #333; margin-top: 6px;}
  .carpool-info .fa {margin-right: 10px; width: 28px; text-align: center; color:#95a5a6; }
  .carpool-info .tlt {display: inline-block; width: 20%; padding-left: 10px;}
  .carpool-info .desc {display: inline-block;}
  .carpool-info .start-loc span,
  .carpool-info .end-loc span {font-size: 1.2em;}
  .carpool-info .start-loc .fa {color:#e74c3c;}
  .carpool-info .end-loc .fa {color:#2980b9;}
  .driver-box { margin-top: 10px;}
  .driver-img {text-align: center;}
  .driver-img span{display: block; font-size: 1.4em;padding: 10px;}
  .driver-car img {height: 100%; width: 100%;}
  .driver-info ul {list-style-type: none; margin: 0; padding:0 10px;}
  .driver-info li {height: 30px;}
  .driver-info h4 {text-align: center; margin-top: 0; border-bottom: 1px solid #ddd; padding-bottom: 10px;}
  .driver-info span {display: inline-block; width: 80px; text-align: right; padding-right: 10px;}
  .driver-info p { width: 100%; background-color: #e1e1e1; min-height:60px; padding: 10px; border-radius: 5px; margin-top: 8px; font-size: 14px;}
  
</style>
<!-- 컨텐츠 시작  -->
<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1><i class="fa fa-slideshare" aria-hidden="true"></i> 
				마이 카풀<small>카풀 동승</small></h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
				<li><a href="<c:url value='/carpool/request/list'/>"> 마이 카풀</a></li>
				<li class="active">카풀 동승</li>
			</ol>
		</section>
		<!-- 메인 컨텐츠 부분 -->
		<section class="content">
		<form action="<c:url value='/pay/payment'/>" id="cpForm" method="POST">
			<input type="hidden" name="driver" id="driverNo"/>
			<input type="hidden" name="matchno" id="matchNo"/>
		</form>
		<c:forEach var="cp" items="${list}">
			<div class="box">
				<div class="box-header with-border">
			    	<div class="box-tools pull-right">
			    	    <button type="button" class="btn btn-box-tool" data-widget="collapse">
			       			<i class="fa fa-minus"></i>
			   			</button>
			   		</div><!-- /.box-tools -->
			  	</div><!-- /.box-header -->
				<div class="box-body">
			    	<div class="row">
			    		<div class="col-md-7">
			    			<ul class="carpool-info">
			    				<li class="start-loc">
			    					<span class="tlt"><i class="fa fa-map-marker" aria-hidden="true"></i> 출발지</span>
			    					<span class="desc">${cp.cpMatch.carpool.startPoint}</span>
			    				</li>
			    				<li class="end-loc">
			    					<span class="tlt"><i class="fa fa-map-marker" aria-hidden="true"></i> 목적지</span>
			    					<span class="desc">${cp.cpMatch.carpool.endPoint}</span>
			    				</li>
			    				<li class="start-date">
			    					<span class="tlt"><i class="fa fa-clock-o" aria-hidden="true"></i> 출발시간</span>
			    					<span class="desc">
			    						<fmt:formatDate value="${cp.cpMatch.carpool.startDateTime}" pattern="yyyy년 MM월 dd일 a KK시 mm분"/>
			    					</span>
			    				</li>
			    				<li class="seat-num">
			    					<span class="tlt"><i class="fa fa-users" aria-hidden="true"></i> 좌석수</span>
			    					<span class="desc">${cp.cpMatch.cpnum}</span>
			    				</li>
			    				<li class="charge">
			    					<span class="tlt"><i class="fa fa-money" aria-hidden="true"></i> 비용</span>
			    					<span class="desc">
			    						<fmt:formatNumber value="${cp.cpMatch.paysum}" pattern="#,###"/>원</span>
			    				</li>
			    				<li class="cp-option">
			    					<span class="tlt"><i class="fa fa-car" aria-hidden="true"></i> 동승조건</span>
			    					<c:choose>
									<c:when test="${cp.cpMatch.carpool.seatOpt == 1}">
										<span class="label label-success">조수석</span>
									</c:when>
									<c:otherwise>
										<span class="label label-success">뒷자리</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${cp.cpMatch.carpool.driveOpt == 1}">
										<span class="label label-warning">대화가능</span>
									</c:when>
									<c:when test="${cp.cpMatch.carpool.driveOpt == 2}">
										<span class="label label-warning">조용하게</span>
									</c:when>
									<c:when test="${cp.cpMatch.carpool.driveOpt == 3}">
										<span class="label label-warning">음악을 들으며</span>
									</c:when>
									<c:otherwise>
										<span class="label label-warning">정주행</span>
									</c:otherwise>
								</c:choose>
								<c:if test="${cp.cpMatch.carpool.trunkUse}">
									<span class="label label-primary">트렁크사용</span>
								</c:if>
								<c:if test="${!cp.cpMatch.carpool.smokeUse}">
									<span class="label label-danger">비흡연</span>
								</c:if>				
			    				</li>
			    			</ul>
			    			<div class="driver-box">
			    				<div class="driver-img col-md-3">
			    							<c:choose><%-- 프로필 사진 처리 --%>
											<c:when test="${!empty cp.driver.photo}">
												<img src="<c:url value="/img/user8-128x128.jpg"/>"
													alt="profile" class="img-circle" /> 
											</c:when>
											<c:when test="${cp.driver.gender.string eq 'MALE'}">
												<img src="<c:url value="/img/avatar_male_3.png"/>"
													alt="male" class="img-circle" /> 
											</c:when>
											<c:when test="${cp.driver.gender.string eq 'FEMALE'}">
												<img src="<c:url value="/img/avatar_female_1.png"/>"
													alt="male" class="img-circle"/> 
											</c:when>
											<c:otherwise>
												<img src="<c:url value="/img/avatar_female_6.png"/>"
													alt="male" class="img-circle"/> 
											</c:otherwise>
											</c:choose>			    			
			    					<span>${cp.driver.name}</span>
			    					<a href="#" class="btn btn-default send-msg">
			    						<i class="fa fa-envelope-o"></i>${cp.driver.userid}</a>
			    				</div>
			    				<div class="driver-info col-md-5">
			    					<h4>운전자 정보</h4>
			    					<ul>
			    						<li><span>차종:</span>${cp.driver.car_prod} ${cp.driver.car_model}</li>
			    						<li><span>차량번호:</span>${cp.driver.car_no}</li>
			    						<li><span>연락처:</span>010-3345-5678</li>			    						
			    						<li><span>기타내용: </span><p>${cp.cpMatch.carpool.reqMsg}</p></li>			    						
			    					</ul>
			    				</div>
			    				<div class="driver-car col-md-4">
			    					<img src="https://source.unsplash.com/1R63taCoSnM/300x380" alt="자동차사진"  class="img-rounded"/>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="col-md-5">
			    			<div class="carpool-map" id="map" style="height:500px">
			    				
			    			</div>
			    		</div>
			    	</div>
				</div><!-- /.box-body -->
			  	<div class="box-footer">
			    	<button class="btn btn-default pull-left">취소하기</button>
			    	<button class="btn btn-primary pull-right btnPayment"
			    		data-driver="${cp.driver.mno}" data-matchno="${cp.cpMatch.matchno}"><i class="fa fa-credit-card"></i>&nbsp; 결제하기</button>
			    	<!-- <button class="btn btn-success pull-right" style="margin-right: 10px;"><i class="fa fa-check"></i>&nbsp; 탑승완료</button> -->
				</div><!-- box-footer -->
			</div><!-- /.box -->
		</c:forEach>
		</section><!-- /.content -->
	</div>
</div>
<!-- 컨텐츠 끝  -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=696a80bf76359ec5e09adde78a569f4f"></script>
<script>
	!(function($){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.56693, 126.97881), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
	
		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 
	
		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new daum.maps.MapTypeControl();
	
		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
	
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();
	
		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.56693, 126.97881), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
		var formObj = $("#cpForm");
		$(".btnPayment").on("click", function(e){
			var driverNo = $(this).data("driver");
			var matchNo  = $(this).data("matchno");
			$("#driverNo").val(driverNo);
			$("#matchNo").val(matchNo);
			formObj.attr("action", "<c:url value='/pay/payment'/>");
			formObj.submit();
		});
	})(window.jQuery);
</script>
<%@ include file="../includes/footer.jsp"%>
