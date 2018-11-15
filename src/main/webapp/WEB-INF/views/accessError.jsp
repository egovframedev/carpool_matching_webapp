<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<body class="hold-transition">
	<div class="container">
		<section class="content">
			<div class="error-page">
				<h2 class="headline text-yellow">404</h2>

				<div class="error-content">
					<h3>
						<i class="fa fa-warning text-yellow"></i> 
						${SPRING_SECURITY_403_EXCEPTION.getMessage()}
					</h3>
					<h3>
						<i class="fa fa-warning text-yellow"></i> 
						${msg}
					</h3>
				</div>
				<!-- /.error-content -->
			</div>
			<!-- /.error-page -->
		</section>
	</div>
</body>
</html>