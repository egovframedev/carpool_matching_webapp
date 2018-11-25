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
		<form action="" method="post">
			<input type="hidden" id="mno" name="mno" />

			<div class="col-md-4">
				<div class="box box-widget widget-user">
					<div class="widget-user-header bg-aqua-active">
						<h3 class="widget-user-username">id ${member.userid }</h3>
						<h5 class="widget-user-desc">name ${member.name }</h5>
					</div>
					<div class="widget-user-image">
						<img class="img-circle" src="../dist/img/user1-128x128.jpg"
							alt="회원 사진">
					</div>
					<div class="box-footer">
						<div class="row">
							<div class="col-sm-4 border-right">
								<div class="description-block">
									<h5 class="description-header">3,200</h5>
									<span class="description-text">매상</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-4 border-right">
								<div class="description-block">
									<h5 class="description-header">13,000</h5>
									<span class="description-text">다음</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-4">
								<div class="description-block">
									<h5 class="description-header">35 세</h5>
									<span class="description-text">제작품</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<div class="box-footer no-padding">
						<ul class="nav nav-stacked">
							<li><input type="text" value="${member.userid }"></li>
						</ul>
					</div>
				</div>
				<!-- /.widget-user -->
			</div>
		</form>

	</div>
</div>



<%@ include file="../includes/footer.jsp"%>