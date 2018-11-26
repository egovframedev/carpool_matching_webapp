<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>Carto | CarPool Matching Web Application</title>
	<link rel="stylesheet" href="<c:url value="/"/>vendor/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value="/"/>vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<c:url value="/"/>vendor/Ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="<c:url value="/"/>css/AdminLTE.min.css">
	<link rel="stylesheet" href="<c:url value="/"/>css/skins/_all-skins.min.css">
	<link rel="stylesheet" href="<c:url value="/"/>vendor/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
	<script src="<c:url value="/"/>vendor/jquery/dist/jquery.min.js"></script>
	<script src="<c:url value="/"/>vendor/bootstrap/dist/js/bootstrap.min.js"></script>	
</head>
<c:choose>
	<c:when test="${empty login}"><body class="hold-transition skin-purple-light layout-top-nav"></c:when>
	<c:when test="${!empty login and login.authority == 'ROLE_RIDER'}"><body class="hold-transition layout-top-nav skin-blue"></c:when>
	<c:when test="${!empty login and login.authority == 'ROLE_DRIVER'}"><body class="hold-transition layout-top-nav skin-green"></c:when>
	<c:otherwise><body class="hold-transition layout-top-nav skin-yellow"></c:otherwise>
</c:choose>
<div class="wrapper">
 	<!-- 상단 메인 메뉴 시작 -->
	<%@ include file="gnb_default.jsp" %>
	<!-- 상단 메인 메뉴 끝 -->