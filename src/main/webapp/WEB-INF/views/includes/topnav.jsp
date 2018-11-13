<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="main-header">
	<!-- 로고 부분 -->
	<a href="index2.html" class="logo"> 
		<!-- 작은 로고 50x50 pixels -->
		<span class="logo-mini"><b>CTO</b></span>
		<span class="logo-lg"><b>CAR</b>POOL</span>
	</a>
	<!-- 헤더 상위 메뉴 -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- 사이드바 토글 버튼 -->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> 
			<span class="sr-only">사이드바 토글</span></a>
		<!-- 상위 메뉴 오른쪽 -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
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
				<!-- 알림 메뉴 -->
				<li class="dropdown notifications-menu">
					<!-- 토글 버튼 --> 
					<a href="#" class="dropdown-toggle"	data-toggle="dropdown"> 
						<i class="fa fa-bell-o"></i> <span class="label label-warning">10</span></a>
					<ul class="dropdown-menu">
						<li class="header">새 알림 10 개</li>
						<li>
							<ul class="menu">
								<li><a href="#"> 
									<i	class="fa fa-users text-aqua"></i> 오늘 5명의 회원이 가입</a>
								</li>
							</ul>
						</li>
						<li class="footer"><a href="#">알림 전체 보기</a></li>
					</ul>
				</li>
				<!-- 작업 일정 메뉴 -->
				<li class="dropdown tasks-menu">
					<!-- 토글 버튼 --> 
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
						<i class="fa fa-flag-o"></i> <span class="label label-danger">9</span></a>
					<ul class="dropdown-menu">
						<li class="header">새 작업 9개</li>
						<li>
							<ul class="menu">
								<li><a href="#">
									<h3>드라이버 승인 처리 <small class="pull-right">20%</small></h3>
									<div class="progress xs">
										<div class="progress-bar progress-bar-aqua"	style="width: 20%" 
											role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
											<span class="sr-only">20% 완료</span>
										</div>
									</div>
									</a>
								</li>
							</ul>
						</li>
						<li class="footer"><a href="#">전체 보기</a></li>
					</ul>
				</li>
				<!-- 사용자 계정 메뉴 -->
				<li class="dropdown user user-menu">
					<a href="#" class="dropdown-toggle"	data-toggle="dropdown"> 
						<img src="<c:url value="/"/>img/user2-160x160.jpg" class="user-image" alt="User Image">
						<span class="hidden-xs">카풀관리자</span>
					</a>
					<ul class="dropdown-menu">
						<li class="user-header">
							<img src="<c:url value="/"/>img/user2-160x160.jpg" class="img-circle" alt="User Image">
							<p>카풀 관리자 - 웹 개발자 <small>2018년11월</small></p>
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
								<a href="#" class="btn btn-default btn-flat">로그아웃</a>
							</div>
						</li>
					</ul>
				</li>
				<li><a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a></li>
			</ul>
		</div>
	</nav>
</header>
<!-- 상단 메인 헤더 끝 -->