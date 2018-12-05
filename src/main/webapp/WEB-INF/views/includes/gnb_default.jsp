<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header class="main-header">
		<nav class="navbar navbar-static-top">
			<div class="container">
				<a href="<c:url value='/'/>" class="navbar-brand">
					<b class="text-danger">Car</b><b>TO</b></a>
				<button type="button" class="navbar-toggle collapsed" 
					data-toggle="collapse" data-target="#navbar-collapse"><i class="fa fa-bars"></i></button>
				<!-- 상위 메뉴 왼쪽 -->
				<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
					<ul class="nav navbar-nav">
		            	<li class="active">
		            		<a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</span></a></li>
		            	<li><a href="<c:url value='/introduction'/>">서비스 소개</a></li>
						<c:if test="${!empty login and login.authority == 'ROLE_RIDER'}">
						<li class="dropdown">
		              		<a href="<c:url value='/carpool/request/list'/>" class="dropdown-toggle" 
		              			data-toggle="dropdown">동승자 : Rider <span class="caret"></span></a>
		              		<ul class="dropdown-menu" role="menu">
				                <li><a href="<c:url value='/carpool/request/list'/>">카풀요청</a></li>
				                <li><a href="<c:url value='/carpool/provide/list'/>">카풀제공</a></li>
				                <li><a href="<c:url value='/carpool/riding'/>">카풀동승</a></li>
				                <li><a href="<c:url value='/carpool/request/loglist'/>">카풀내역</a></li>				                
		              		</ul>
		              	</li>
						</c:if>
						<c:if test="${!empty login and login.authority == 'ROLE_DRIVER'}">
						<li class="dropdown">
		              		<a href="<c:url value='/carpool/request/list'/>" class="dropdown-toggle" 
		              			data-toggle="dropdown">운전자 : Driver <span class="caret"></span></a>
		              		<ul class="dropdown-menu" role="menu">
				                <li><a href="<c:url value='/carpool/request/list'/>">카풀요청</a></li>
				                <li><a href="<c:url value='/carpool/provide/list'/>">카풀제공</a></li>
				                <li><a href="<c:url value='/carpool/driving'/>">카풀운행</a></li>
				                <li><a href="<c:url value='/carpool/provide/loglist'/>">카풀내역</a></li>				                
		              		</ul>
		              	</li>
						</c:if>
		            	<li class="dropdown">
		              		<a href="#" class="dropdown-toggle" 
		              			data-toggle="dropdown">고객센터 <span class="caret"></span></a>
		              		<ul class="dropdown-menu" role="menu">
				                <li><a href="<c:url value='/board/notice/list'/>">공지사항</a></li>
				                <li><a href="<c:url value='/board/faq/list'/>">자주묻는질문</a></li>
				                <li><a href="<c:url value='/board/qna/list'/>">묻고답하기</a></li>
		              		</ul>
		              	</li>
		          	</ul>
				</div>
				<!-- 상위 메뉴 오른쪽 -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<c:if test="${empty login}">
						<li><a href="<c:url value='/login'/>"><i class="fa fa-sign-in"></i> 로그인</a></li>
						<li><a href="<c:url value='/member/join/step1'/>"><i class="fa fa-user-plus"></i> 회원가입</a></li>
						</c:if>
						<c:if test="${!empty login}">
						<!-- 메세지 메뉴 -->			
						<li class="dropdown messages-menu">
							<!-- 토글 버튼 --> 
							<a href="#" class="dropdown-toggle"	data-toggle="dropdown"> 
								<i class="fa fa-envelope-o"></i> <span class="label label-success">4</span></a>
							<!-- 메세지 알림창 -->	
							<ul class="dropdown-menu">
								<li class="header">새 메세지 4 개</li>
								<li>							
									<ul class="menu">
										<li><a href="#">
											<div class="pull-left">
												<img src="<c:url value="/"/>img/user2-160x160.jpg" class="img-circle" alt="User Image">
											</div> <!-- Message title and timestamp -->
											<h4>카풀요청 인천-&gt;서울<small><i class="fa fa-clock-o"></i> 5 분전</small></h4>
											<p>홍길동님이 동승을 제의 합니다.</p>
										</a>
										</li>
									</ul>
								</li>
								<li class="footer"><a href="#">내 메세지 전체보기</a></li>
							</ul>
						</li>
						<!-- 사용자 계정 메뉴 -->
						<li class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle"	data-toggle="dropdown"> 
								<img src="<c:url value="/"/>img/user2-160x160.jpg" class="user-image" alt="User Image">
								<span class="hidden-xs">${login.name}[${login.userid}]</span>
							</a>
							<ul class="dropdown-menu" role="menu">				             
				                 <li><a href="<c:url value='/member/myprofile'/>">
				                	<i class="fa fa-id-card-o" aria-hidden="true"></i> 내프로필</a></li>
				                <li><a href="<c:url value='/logout'/>">
				                	<i class="fa fa-sign-out" aria-hidden="true"></i> 로그아웃</a></li>
				                <c:if test="${login.authority == 'ROLE_RIDER'}">
				                <li><a href="<c:url value='/member/driver/certify'/>">
				                	<i class="fa fa-id-card" aria-hidden="true"></i> 운전자인증</a></li>
				                </c:if>
		              		</ul>
						</li>
						<!-- 관리자 링크 -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-gears"></i></a>
							<ul class="dropdown-menu" role="menu">
				                <li><a href="<c:url value='/admin/member/list'/>">회원관리</a></li>
				                <li><a href="<c:url value='/admin/carpool/list'/>">카풀정보관리</a></li>
				                <li><a href="<c:url value='/admin/pay/list'/>">결제정산관리</a></li>
		              		</ul>	
						</li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- 상단 메인 헤더 끝 -->