<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<!-- 컨텐츠 헤더 부분(Page header) -->
			<section class="content-header">
				<h1><i class="fa fa-slideshare" aria-hidden="true"></i>
					카풀 결제<small>결제 화면</small></h1>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/carpool/riding'/>"><i class="fa fa-dashboard"></i> 카풀 동승</a></li>
					<li class="active">결제 하기</li>
				</ol>
			</section>
		</section>
		<div class="pad margin no-print">
      		<div class="callout callout-info" style="margin-bottom: 0!important;">
        		<h4><i class="fa fa-info"></i> CarTO:</h4>
        		<p>즐거운 카풀 되셨나요?</p> 
      		</div>
    	</div>
    	<!-- Main content -->
    	<section class="invoice">
      		<div class="row">
        		<div class="col-xs-12">
          			<h2 class="page-header">
            			<i class="fa fa-globe"></i> CarTO, Inc.
            			<small class="pull-right">Date: ${cpjoin.matchDateFmt}</small>
          			</h2>
        		</div><!-- /.col -->
    	  	</div><!-- info row -->
	      	<div class="row invoice-info">
	        	<div class="col-sm-4 invoice-col">
	        		<ul class="list driver">
	        			<li><span class="tit">드라이버</span><strong>${driver.name}</strong></li>
	        			<li><span class="tit">전화번호</span>${driver.phone}</li>
	        			<li><span class="tit">이메일</span>${driver.email}</li>
	        		</ul>
	        	</div>
	         	<div class="col-sm-4 invoice-col">
	         		<ul class="list rider">
	        			<li><span class="tit">동승자</span><strong>${member.name}</strong></li>
	        			<li><span class="tit">전화번호</span>${member.phone}</li>
	        			<li><span class="tit">이메일</span>${member.email}</li>
	        		</ul>       	       
	        	</div>
	    	</div><!-- /.row -->
	    	<div class="row">
	      		<div class="col-xs-12 table-responsive">
		        	<table class="table table-striped">
		            <thead>
			            <tr class="bg-primary">
			            	<th>주행 내역</th>
			            	<th>인원</th>
			            	<th>결제 금액</th>
			            </tr>
		            </thead>
		            <tbody>
			            <tr>
			            	<td>${cpjoin.carpool.startPoint} -> ${cpjoin.carpool.endPoint}</td>
			            	<td>${cpjoin.cpnum}명</td>
			            	<td>${cpjoin.paysum}원</td>
			            </tr>
		            </tbody>
		          	</table>
	        	</div><!-- /.col -->
	      	</div><!-- /.row -->
	      	<div class="row">
	            <div class="col-xs-6">
		        	<p class="lead">결제 수단:</p>
	        		<img src="<c:url value='/img'/>/credit/visa.png" alt="Visa">
	        		<img src="<c:url value='/img'/>/credit/mastercard.png" alt="Mastercard">
	         		<p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
	            		신용카드,체크카드로만 결제해주시기 바랍니다.
	         		</p>
	        	</div><!-- /.col -->
	        	<div class="col-xs-6">
	          		<p class="lead">Amount Due ${cpjoin.matchDateFmt}</p>
	          		<div class="table-responsive">
	            		<table class="table">
	            		<tr>
			                <th style="width:50%">Total:</th>
			                <td>${cpjoin.paysum}원 </td>            		
	            		</tr>      
	            		</table>
	          		</div>
	        	</div><!-- /.col -->
	    	</div><!-- /.row -->
    		<div class="row no-print">
        		<div class="col-xs-12">
          			<a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
          			<button type="button"  id="check_module" class="btn btn-success pull-right">
          				<i class="fa fa-credit-card"></i> 결제하기</button>
        		</div>
    		</div>
    	</section><!-- /.content -->
 	</div>
</div> 
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
    $("#check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp47387021'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'inicis', // version 1.1.0부터 지원.
            /* 
                'kakao':카카오페이, 
                html5_inicis':이니시스(웹표준결제)
                    'nice':나이스페이
                    'jtnet':제이티넷
                    'uplus':LG유플러스
                    'danal':다날
                    'payco':페이코
                    'syrup':시럽페이
                    'paypal':페이팔
                */
            pay_method: 'card',
            /* 
                'samsung':삼성페이, 
                'card':신용카드, 
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제 
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
            /* 
                merchant_uid에 경우 
                https://docs.iamport.kr/implementation/payment
             */
            name: '카풀 결제 승인',
            //결제창에서 보여질 이름
            amount: ${cpjoin.paysum}, //가격
          	buyer_email:'${member.email}',
            buyer_name: '${member.name}',
            buyer_tel: '${member.phone}',  // 세션합친후 사용
            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
         }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
            	 //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                  url: "<c:url value='/'/>pay/insertReg", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
                  type: "POST",
                  headers: { "Content-Type": "application/json" },
                  data:JSON.stringify( {
                    payno : rsp.imp_uid,
                    amount : rsp.paid_amount, 
                    apply_num : rsp.apply_num, 
                	pay_date : rsp.paid_at,
                	driverNo : ${driver.mno}
                	//payno 아임포트 모듈 거래고유벊
                	//amount 결제 금액
                	//apply_num 카드사 승인번호
                	//pay_date  결제승인 시각
                    //기타 필요한 데이터가 있으면 추가 전달
                  })
                }).done(function(data) {
                	console.log("결제 성공 fail");
                   console.log('호출끝남');
                  //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                  if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\n결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    alert(msg);
                    window.location = getContextPath()+'/pay/complete?id=' + rsp.imp_uid  //완료페이지로 이동
                  } else {
                    console.log('결제실패함');
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                  } 
                }).fail(function (data) {
                	console.log("결제 실패 fail");
                	 var msg = '결제에 실패하였습니다.'+data;
                    msg += '에러내용 : ' + rsp.error_msg;
                    alert(msg);
                   console.log("결제 fail data:"+data+'rsp:'+rsp);
                  /*  window.location =  getContextPath()+'/pay/payment'   */
                  });
              } else {
                console.log('결제취소');
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
                  alert(msg);
                  window.history.go(-4); //실패
              }
                    }); 
                 });
    function getContextPath(){
        var offset=location.href.indexOf(location.host)+location.host.length;
        var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
        return ctxPath;
    }
</script>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>