<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CarTO | Log in</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/iCheck/square/blue.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script>
	var error = "${error}";
	
	if(error != "") {
		alert(error);
	}
	function loginChk() {
		var userid = $("#userid").val();
		var userpw = $("#userpw").val();

		if (userid.length < 1) {
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return;
		}
		if (userpw.length < 1) {
			alert("비밀번호를 입력하세요.");
			$("#userpw").focus();
			return;
		}
	}
</script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html"><b>CarTO</b> Login</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">Sign in to start your session</p>

			<form id="loginForm" action="<c:url value='/loginPost'/>" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디.." required="required">
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="userpw" name="userpw" placeholder="비밀번호.." required="required">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<input type="checkbox" name="useCookie"/>&nbsp;  로그인 상태 유지
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat" onclick="loginChk()">로그인</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

			<div class="social-auth-links text-center">
				<p>- OR -</p>
				<a href="<c:url value='member/join/step1'/>" class="btn btn-block btn-social btn-facebook btn-flat">
					<i class="fa fa-user-plus"></i> 회원가입</a> 
				<a href="<c:url value='member/find/idpw'/>" class="btn btn-block btn-social btn-google btn-flat">
					<i class="fa fa-key"></i> 아이디/비밀번호 찾기</a>
			</div>			
		</div><!-- /.login-box-body -->
	</div><!-- /.login-box -->
	<script src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' /* optional */
			});
		});
	</script>
</body>
</html>
