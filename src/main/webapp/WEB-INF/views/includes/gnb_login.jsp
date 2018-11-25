<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="main-header">
	<!-- 로고 부분 -->
	<a href="<c:url value='/'/>" class="logo"> 
		<!-- 작은 로고 50x50 pixels -->
		<span class="logo-mini"><b>CTO</b></span>
		<span class="logo-lg"><b>CAR</b>POOL</span>
	</a>
	<!-- 헤더 상위 메뉴 -->
	<nav class="navbar navbar-static-top" role="navigation">
		<c:if test="${!empty login}"> 
		<!-- 사이드바 토글 버튼 -->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> 
			<span class="sr-only">사이드바 토글</span></a>
		</c:if>
		<div class="collapse navbar-collapse pull-left">
			<ul class="nav navbar-nav">
            	<li class="active"><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME <span class="sr-only">(current)</span></a></li>
            	<li><a href="<c:url value='/board/introduction'/>">서비스 소개</a></li>
            	<li class="dropdown">
              		<a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터 <span class="caret"></span></a>
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
					<ul class="dropdown-menu">
						<li class="user-header">
							<img src="<c:url value="/"/>img/user2-160x160.jpg" class="img-circle" alt="User Image">
							<p>${login.name} <small>2018년11월</small></p>
						</li>
						<li class="user-body">
							<div class="row">
								<div class="col-xs-4 text-center">
									<a href="#">팔로우</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">구매</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">친구</a>
								</div>
							</div> <!-- /.row -->
						</li>
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">내프로필</a>
							</div>
							<div class="pull-right">
								<a href="<c:url value='/logout'/>" class="btn btn-default btn-flat">로그아웃</a>
							</div>
						</li>
					</ul>
				</li>
				<!-- 관리자 링크 -->
				<li><a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a></li>
				</c:if>
			</ul>
		</div>
	</nav>
</header>
<!-- 상단 메인 헤더 끝 -->