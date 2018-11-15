<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CarTO|카플매칭웹서비스</title>
<link rel="stylesheet" href="<c:url value='/'/>vendor/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/'/>vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value='/'/>vendor/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="<c:url value='/'/>css/AdminLTE.min.css">
<link rel="stylesheet" href="<c:url value='/'/>resources/plugins/iCheck/square/blue.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/"><b>CarTO</b> Login</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">
    	본 서비스를 이용하려면 로그인하세요.   	
    </p>
    <h3><c:out value="${error}" /></h3>
    <h3><c:out value="${logout}" /></h3>
    <form action="/login" method="post">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <div class="form-group has-feedback">
        <input type="text" name="username" class="form-control" placeholder="아이디" required="required">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" class="form-control" placeholder="비밀번호" required="required">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" name="useCookie"> 로그인 유지하기
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <a href="member/pwsearch" class="btn btn-sucess btn-sm">비밀번호 찾기</a><br>
    <a href="member/register" class="text-center"  class="btn btn-sucess btn-sm" >회원 가입 하기</a>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="<c:url value='/'/>vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<c:url value='/'/>resources/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>