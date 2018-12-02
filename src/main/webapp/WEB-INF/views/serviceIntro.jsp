<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./includes/header.jsp"%>
<!-- 컨텐츠 시작  -->

<%-- 	<img src="<c:url value='/img/'/>carpool1.jpg" alt="Third slide">
	<img src="<c:url value='/img/'/>carpool2.jpg" alt="Third slide">
	<img src="<c:url value='/img/'/>carpool3.jpg" alt="Third slide"> --%>

<div class="img1"
	style="background-image: '<c:url value='/img/'/>carpool1.jpg'">
	<div class="content">
		<h1>언제 어디서나 이용가능합니다.</h1>
		<h2>자동차 2천만대 시대. 치솟는 기름값과 인구집중화로 인한 교통불편 등을 해결하는 가장 지혜로운 방법은
			카풀입니다. CarTO은 PC와 모바일 모두 이용 가능하며 이용자들의 불편을 지속적으로 개선해 보다 편리하게 카풀이용을 할
			수 있도록 항상 고민하여 빠르게 적용하고 있습니다.</h2>
	</div>
	<div class="img-cover"></div>
</div>
<div class="img2"
	style="background-image: '<c:url value='/img/'/>carpool2.jpg'">
	<div class="content">
		<h1>국내최대 카풀정보가 있습니다.</h1>
		<h2>CarTO을 통해 카풀을 등록하시는 분들이 지금도 계속 늘어나고 있습니다. 출퇴근, 주말카풀은 물론, 각
			지역별 카풀이 활발하게 등록되며, 스키카풀, 명절연휴 귀성, 귀경카풀 등도 다양하게 등록되어 있습니다. 운전자에게는 기름값을
			보전하고, 탑승자에게는 편안함과 편리함을 제공하는 카풀로 더욱 풍요로운 생활을 즐기세요. 카풀은 카풀정보가 많은 곳에서
			매칭될 확률이 높답니다.</h2>
	</div>
	<div class="img-cover"></div>
</div>
<div class="img3"
	style="background-image: '<c:url value='/img/'/>carpool3.jpg'">
	<div class="content">
		<h1>믿을 수 있습니다.</h1>
		<h2>CarTO은 이용자들에게 다양한 판단 기준과 안전장치를 마련하고 있습니다. 이용자들의 프로필 정보를 공개해
			상대방을 확인할 수 있고 메시지로 정확한 정보를 알 수 있습니다. 또한 이용자들은 스스로 직장과 대학 인증 등을 거쳐 본인의
			신뢰도를 높일 수 있도록 하였으며, 카풀을 선택하는 중요한 판단기준이 될 수 있습니다. 보다 안전하고 안심할 수 있는
			기능들은 추가적으로 계속 업데이트될 예정입니다.</h2>
	</div>
	<div class="img-cover"></div>
</div>


<style>
.img1 {
	position: relative;
	background-image: url(./img/carpool1.jpg);
	height: 100vh;
	background-size: cover;
}
.img2 {
	position: relative;
	background-image: url(./img/carpool2.jpg);
	height: 100vh;
	background-size: cover;
}
.img3 {
	position: relative;
	background-image: url(./img/carpool3.jpg);
	height: 100vh;
	background-size: cover;
}

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 1;
}

.content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 5rem;
	color: white;
	z-index: 2;
	text-align: center;
}
</style>

<!-- 컨텐츠 끝  -->
<%@ include file="./includes/footer.jsp"%>