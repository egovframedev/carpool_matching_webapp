<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<style type="text/css">
  .carpool-info {list-style: none; margin: 0; padding: 0;}
  .carpool-info li { height:40px; border-bottom: 1px solid #ddd; line-height:38px; font-size: 16px; color: #333; margin-top: 8px;}
  .carpool-info .fa {margin-right: 10px; width: 28px; text-align: center; color:#95a5a6; }
  .carpool-info .tlt {display: inline-block; width: 20%; padding-left: 10px;}
  .carpool-info .desc {display: inline-block;}
  .carpool-info .start-loc span,
  .carpool-info .end-loc span {font-size: 1.2em;}
  .carpool-info .start-loc .fa {color:#e74c3c;}
  .carpool-info .end-loc .fa {color:#2980b9;}
  
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
			<div class="box">
				<div class="box-header with-border">
			    	<h3 class="box-title">오늘의 카풀</h3>
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
			    					<span class="desc">	경기도 고양시 후남읍 후남리...</span>
			    				</li>
			    				<li class="end-loc">
			    					<span class="tlt"><i class="fa fa-map-marker" aria-hidden="true"></i> 목적지</span>
			    					<span class="desc">	경기도 고양시 후남읍 후남리...</span>
			    				</li>
			    				<li class="start-date">
			    					<span class="tlt"><i class="fa fa-clock-o" aria-hidden="true"></i> 출발시간</span>
			    					<span class="desc">	2018년 12월 12일 오전 07시 30분</span>
			    				</li>
			    				<li class="seat-num">
			    					<span class="tlt"><i class="fa fa-users" aria-hidden="true"></i> 좌석수</span>
			    					<span class="desc">2 / 4</span>
			    				</li>
			    				<li class="charge">
			    					<span class="tlt"><i class="fa fa-money" aria-hidden="true"></i> 비용</span>
			    					<span class="desc">5,0000 원</span>
			    				</li>
			    				<li class="cp-option">
			    					<span class="tlt"><i class="fa fa-car" aria-hidden="true"></i> 동승조건</span>
			    					<span class="label label-success">뒷자리</span>
			    					<span class="label label-primary">트렁크 사용</span>
			    					<span class="label label-danger">비흡연</span>
			    					<span class="label label-warning">음악을 들으며 동승</span>
			    				</li>
			    			</ul>
			    		</div>
			    		<div class="col-md-5">
			    			<div class="carpool-map" id="map" style="height:500px">
			    				
			    			</div>
			    		</div>
			    	</div>
				</div><!-- /.box-body -->
			  	<div class="box-footer">
			    The footer of the box
				</div><!-- box-footer -->
			</div><!-- /.box -->
		</section><!-- /.content -->
	</div>
</div>
<!-- 컨텐츠 끝  -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=696a80bf76359ec5e09adde78a569f4f"></script>
<script>
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

</script>
<%@ include file="../includes/footer.jsp"%>
