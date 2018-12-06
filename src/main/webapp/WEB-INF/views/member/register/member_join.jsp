<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
	<div class="content-wrapper">
		<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1><i class="fa fa-user-plus"></i>
				회원 가입 <small>이메일 인증 요청</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
				<li><a href="<c:url value='/member/join/step3'/>">회원가입</a></li>
				<li class="active">가입완료</li>
			</ol>
		</section>
		<section class="content container-fluid">
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1">
					<div class="box box-success">
						<div class="box-header with-border">
							<h2 class="box-title">가입완료</h2>
						</div>
						<div class="box-body">
							<h2 align="center">축하드립니다, 성공적으로 회원가입이 되었습니다!</h2>
							<h2 align="center"> 입력하신 e-mail로 인증 후 로그인 가능합니다.</h2>
						</div>
					</div>
				</div>
			</div>
		</section><!-- /.content -->
		</div>
	</div>

<%@ include file="../../includes/footer.jsp"%>