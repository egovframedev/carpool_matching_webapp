<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- 메인 푸터 부분 -->
	<footer class="main-footer">
		<!-- To the right -->
		<div class="pull-right hidden-xs">카풀 매칭 웹서비스 - 개발바닥 팀 프로젝트</div>
		<!-- Default to the left -->
		<strong>Copyright &copy; 2016 <a href="#">CarTo</a>.
		</strong> All rights reserved.
	</footer>
	<!-- 오른쪽 사이드 제어판 부분 -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active"><a href="#control-sidebar-home-tab"
				data-toggle="tab"><i class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
					class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane active" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">최근 활동</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:;"> 
							<i class="menu-icon fa fa-birthday-cake bg-red"></i>
							<div class="menu-info">
								<h4 class="control-sidebar-subheading">홍길동의 생일</h4>
								<p>오는 2018년 12월 23일</p>
							</div>
					</a></li>
				</ul><!-- /.control-sidebar-menu -->
				<h3 class="control-sidebar-heading">작업 진행 상황</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:;">
							<h4 class="control-sidebar-subheading">
								사용자 템플릿 디자인 <span class="pull-right-container">
									<span class="label label-danger pull-right">70%</span>
								</span>
							</h4>	
							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							</div>
					</a></li>
				</ul><!-- /.control-sidebar-menu -->
			</div><!-- /.tab-pane -->
			<!-- Stats tab content -->
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">일반 설정</h3>
					<div class="form-group">
						<label class="control-sidebar-subheading"> 보고서 패널 사용 
							<input type="checkbox" class="pull-right" checked>
						</label>
						<p>일반 설정 옵션에 대한 정보</p>
					</div><!-- /.form-group -->
				</form>
			</div><!-- /.tab-pane -->
		</div>
	</aside><!-- /.control-sidebar -->
	<div class="control-sidebar-bg"></div>
</div><!-- ./wrapper -->
<script src="<c:url value="/"/>js/adminlte.min.js"></script>
</body>
</html>