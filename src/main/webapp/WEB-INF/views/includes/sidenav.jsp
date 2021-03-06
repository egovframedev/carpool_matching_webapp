<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<aside class="main-sidebar">
		<!-- 사이드바 부분 -->
		<section class="sidebar">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel">
				<div class="pull-left image">
					<img src="<c:url value="/"/>img/user2-160x160.jpg"
						class="img-circle" alt="User Image">
				</div>
				<div class="pull-left info">
					<p>${login.name}[${login.userid}]</p>
					<!-- Status -->
					<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
				</div>
			</div>
	
			<!-- search form (Optional) -->
			<form action="#" method="get" class="sidebar-form">
				<div class="input-group">
					<input type="text" name="q" class="form-control" placeholder="검색어 입력..."> 
					<span class="input-group-btn">
						<button type="submit" name="search" id="search-btn"	class="btn btn-flat">
							<i class="fa fa-search"></i></button>
					</span>
				</div>
			</form>	
			<!-- /.search form -->
	
			<!-- 사이드 메뉴 -->
			<ul class="sidebar-menu" data-widget="tree">
				<!-- <li class="header"><a href=""><i class="fa fa-home"></i> HOME</a></li> -->
				<li class="active">
					<a href="<c:url value='/'/>"><i class="fa fa-home"></i><span>HOME</span></a>
				</li>
				<li>
					<a href="<c:url value='/carpool/request/list'/>"><i class="fa fa-user-circle"></i><span>카풀요청</span></a>
				</li>
				<li>
					<a href="<c:url value='/carpool/provide/list'/>"><i class="fa fa-car"></i><span>카플제공</span></a>
				</li>
				<li>
					<a href="<c:url value='/carpool/riding'/>"><i class="fa fa-users"></i><span>카풀동승</span></a>
				</li>
				<li>
					<a href="<c:url value='/carpool/riding/log'/>"><i class="fa fa-user-circle"></i><span>카플내역</span></a>
				</li>
				<li class="treeview">
					<a href="#"><i class="fa fa-fax"></i> 
						<span>고객센터</span>
						<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i></span> </a>
					<ul class="treeview-menu">
						<li><a href="<c:url value='/board/notice/list'/>">공지사항</a></li>
						<li><a href="<c:url value='/board/faq/list'/>">자주하는 질문</a></li>
						<li><a href="<c:url value='/board/qna/list'/>">묻고답하기</a></li>
					</ul></li>
			</ul>
			<!-- /.sidebar-menu -->
		</section>
		<!-- /.sidebar -->
	</aside>