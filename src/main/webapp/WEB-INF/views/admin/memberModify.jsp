<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page session="false"%>
<%@ include file="../includes/header.jsp"%>
<!-- Content Wrapper. Containes page content -->
<div class="content-wrapper">
	<div class="col-sm-offset-1 col-sm-10">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				회원관리 <small>목록보기 </small>
			</h1>
			<ol class="breadcrumb">
				<li><a href=" <c:url value='/'/>"><i class="fa fa-home"></i>
						Home</a></li>
				<li><a href="<c:url value='/admin/member/list'/>">회원관리</a></li>
				<li class="active">목록보기</li>
			</ol>
		</section>
		<!-- Main content -->




	</div>
</div>



<%@ include file="../includes/footer.jsp"%>