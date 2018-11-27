<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
	<div class="content-wrapper">
		<div class="container">
			<!-- 컨텐츠 헤더 부분(Page header) -->
			<section class="content-header">
				<h1><i class="fa fa-car" aria-hidden="true"></i>
						카풀 제공<small>카풀 등록 폼</small></h1>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>			
					<li><a href="<c:url value='/carpool/provide/list'/>"><i class="fa fa-car"></i>카풀 제공</a></li>
					<li class="active">카풀 등록 폼</li>
				</ol>
			</section>	
			<!-- 메인 컨텐츠 부분 -->
			<section class="content container-fluid">
				<div class="box box-danger">
	              	<form role="form" action="regist" method="post" class="form-horizontal">
	              		<input type="hidden" name="mno" value="${login.mno}" />
	              		<input type="hidden" name="cptype" value="2" />
	            	<div class="box-body">
	                	<div class="form-group">
	                		<label for="startPoint" class="col-sm-2 control-label">출발지</label>
	                		<div class="col-sm-10">
	                			<div class="input-group">
		                			<input type="text" id="startPoint" name="startPoint" class="form-control" 
		                				placeholder="출발지 입력.." readonly="readonly"/>
		                			<input type="hidden" name="startLong" value="0"/>
		                			<input type="hidden" name="startLat"  value="0"/>
		                			<div class="input-group-btn">
		                				<button type="button" class="btn btn-info" title="주소로 검색" onclick="searchAddress('start');">
		                					<i class="fa fa-location-arrow" aria-hidden="true"></i></button>
		                			</div>	                			
	                			</div>
	                		</div>
	                	</div>
	                	<div class="form-group">
	                		<label for="endPoint" class="col-sm-2 control-label">도착지</label>
	                		<div class="col-sm-10">
	                			<div class="input-group">
		                			<input type="text" id="endPoint" name="endPoint" class="form-control" 
		                				placeholder="도착지 입력.." readonly="readonly"/>
		                			<input type="hidden" name="endLong"  value="0"/>
		                			<input type="hidden" name="endLat"  value="0"/>
		                			<div class="input-group-btn">
		                				<button type="button" class="btn btn-info" title="주소로 검색" onclick="searchAddress('end');">
		                					<i class="fa fa-location-arrow" aria-hidden="true"></i></button>
		                				<!-- <button type="button" class="btn btn-success btnMap" title="지도로 검색">
		                					<i class="fa fa-map" aria-hidden="true"></i></button> -->
		                			</div>	                			
	                			</div>
	                		</div>
	                	</div>
	                	<div class="form-group">
	                		<label for="startDate" class="col-sm-2 control-label">출발시간</label>
	                		<div class="col-sm-4">
	                			<div class="input-group">   
	            					<span class="input-group-addon"><span class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
	            					<input type="text" name="startDateTime" class="form-control form_datetime">	            					
	            				</div>
	                		</div>
	                	</div>
	                	<div class="form-group">
	                  		<label for="charge" class="col-sm-2 control-label">금액</label>
						    <div class="col-sm-3">
						   		<div class="input-group">
	                    			<input type="text" class="form-control" name="charge" id="charge" placeholder="금액입력..">
						    		<span class="input-group-addon">원/인</span>
						    	</div>
	                  		</div>               
	                	</div>
	                	<div class="form-group">
	                  		<label for="seatNum" class="col-sm-2 control-label">카풀 인원</label>
						    <div class="col-sm-3">
						   		<select  name="seatNum" class="form-control">
				                <c:forEach var="val" begin="1" end="10">
				                	<option value="${val}">${val} 명</option>
				                </c:forEach>
				                </select>
	                  		</div>               
	                	</div>
	                	<div class="form-group">
	                		<label class="col-sm-2 control-label">탑승조건 조건</label>
	                		<div class="col-sm-10">
	                			<div>
		                			<label class="radio-inline">
										<input type="radio" name="seatOpt" id="inlineRadio1" value="1"> 
										운전자와 함께 앞자리(조수석)
									</label>
									<label class="radio-inline">
										<input type="radio" name="seatOpt" id="inlineRadio2" value="2" checked="checked">
										편안한 뒷자리
									</label>				
								</div>
	                			<div>
		                			<label class="radio-inline">
										<input type="radio" name="driveOpt" id="driveOpt1" value="1"> 
										대화형 카풀
									</label>
									<label class="radio-inline">
										<input type="radio" name="driveOpt" id="driveOpt2" value="2">
										조용한 카풀 
									</label>
									<label class="radio-inline">
										<input type="radio" name="driveOpt" id="driveOpt3" value="3">
										음악을 들으며 카풀
									</label>
									<label class="radio-inline">
										<input type="radio" name="driveOpt" id="driveOpt4" value="4" checked="checked">
										정주행
									</label>
								</div>
								<div>
		                			<label class="radio-inline">
										<input type="radio" name="trunkUse" id="trunkUseTrue" value="true"> 
										트렁크 사용
									</label>
									<label class="radio-inline">
										<input type="radio" name="trunkUse" id="trunkUseFalse" value="false" checked="checked">
										트렁크 비사용
									</label>
								</div>
								<div>
									<label class="radio-inline">
										<input type="radio" name="smokeUse" id="smokeUseFalse" value="false" checked="checked">
										비흡연
									</label>
									<label class="radio-inline">
										<input type="radio" name="smokeUse" id="smokeUseTrue" value="true">
										흡연
									</label>
								</div>
	                		</div>
	                	</div>
	            		<div id="map"  style="width:90%;height:400px; margin: 10px auto;">
	            		
	            		</div>
	            		<div class="form-group">
	            			<label for="reqMsg" class="col-sm-2 control-label">기타요구사항</label>
	            			<div class="col-sm-10">
	            				<textarea name="reqMsg" id="reqMsg" rows="3" class="form-control"></textarea>
	            			</div>
	            		</div>
	            	</div><!-- /.box-body -->
	            	<div class="box-footer">
	            		<button type="submit" class="btn btn-primary pull-right"><i class="fa fa-check"></i> 등록하기</button>
	            		<button class="btn btn-default">취소</button>
	            	</div>
	            	</form>
	          </div>
			</section><!-- /.content -->
		</div>
	</div>
<!-- 컨텐츠 끝  -->
<script src="<c:url value='/'/>vendor/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="<c:url value='/'/>vendor/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=696a80bf76359ec5e09adde78a569f4f"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//  지도 표시 부분 -----------------------------------------------------------------------------------------
	var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
	var mapOptions = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 8 //지도의 레벨(확대, 축소 정도)
	};
	var map = new daum.maps.Map(mapContainer, mapOptions); //지도 생성 및 객체 리턴

	function setCenter(latitude, longitude) {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng( latitude, longitude);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}

	function panTo(latitude, longitude) {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng( latitude, longitude);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}        
	
	function displayMaker(target, latitude, longitude) {
		// 출발 마커
		var startSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
	    startSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
	    startOption = { 
	        offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
	    };
		
		// 출발 마커 이미지를 생성합니다
		var startImage = new daum.maps.MarkerImage(startSrc, startSize, startOption);
		
		// 도착 마커
		var arriveSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
		arriveSize = new daum.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
		arriveOption = { 
		    offset: new daum.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};
		// 도착 마커 이미지를 생성합니다
		var arriveImage = new daum.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
		
		switch(target) {
		case 'start' :
			// 출발 마커가 표시될 위치입니다 
			var startPosition = new daum.maps.LatLng(latitude, longitude); 

			// 출발 마커를 생성합니다
			var startMarker = new daum.maps.Marker({
			    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
			    position: startPosition,
			    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
			    image: startImage // 출발 마커이미지를 설정합니다
			});
			break
		case 'end' : 
			var arrivePosition = new daum.maps.LatLng(latitude, longitude);
			// 도착 마커를 생성합니다 
			var arriveMarker = new daum.maps.Marker({  
			    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
			    position: arrivePosition,
			    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
			    image: arriveImage // 도착 마커이미지를 설정합니다
			});
			break;
		}
		panTo(latitude, longitude);
	}
	
	
	// 우편번호 검색  ------------------------------------------------------------------------------------------
	function searchAddress(target) {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById(target + 'Point').value = fullAddr;
				
                // 주소를 좌표로 변환하여 필드에 넣는다.
                addrToLoc(fullAddr, target);
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById(target + 'Point').focus();
            }
        }).open();
	}
	
	function addrToLoc(address, target) {
		$.ajax({
			url: "https://dapi.kakao.com/v2/local/search/address.json",
			type: "GET",
			data: "query=" + address,
			dataType: "json",
			beforeSend: function(xhr) {
				xhr.setRequestHeader("Authorization", "KakaoAK 696a80bf76359ec5e09adde78a569f4f");
			},
			success: function(data) {
				// console.log(data.documents[0]);
				var longitude = data.documents[0].x;
				var latitude = data.documents[0].y;
				console.log(longitude, latitude);
				$("input[name="+target+ "Long]").val(longitude);
				$("input[name="+target+ "Lat]").val(latitude);
				displayMaker(target, latitude, longitude);
			}
		});
	}
	
	$(function(){
		$(".form_datetime").datetimepicker({
			language: 'ko',
			format: 'yyyy-mm-dd - P HH:ii',
			showMeridian: true,
		    autoclose: true,
		    todayBtn: true
		});
		
		$("form[role=form]").submit(function(e) {
			e.preventDefault();
			
			this.submit();
		});
	});
	
</script>
<%@ include file="../includes/footer.jsp"%>
