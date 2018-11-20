<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="../includes/header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script> <!--ê²°ì  import cdn -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
	<button id="check_module" type="button">payment</button>
	
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
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
            amount: 1000, 
            //가격 
            buyer_email: 'iamport@siot.do',
            buyer_name: '함이준',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',
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
                  data: {
                    payno : rsp.imp_uid,
                    amount : rsp.paid_amount, 
                    apply_num : rsp.apply_num, 
                	pay_date : rsp.paid_at
                	//payno 아임포트 모듈 거래고유벊
                	//amount 결제 금액
                	//apply_num 카드사 승인번호
                	//pay_date  결제승인 시각
                    //기타 필요한 데이터가 있으면 추가 전달
                  }
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
                    window.location = '/'; //완료페이지로 이동
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
                   window.location = '/payments/complete?id=' + rsp.imp_uid */  
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
</script>
<%@ include file="../includes/footer.jsp" %>


