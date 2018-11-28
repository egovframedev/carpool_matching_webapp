<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<!-- 컨텐츠 헤더 부분(Page header) -->
			<section class="content-header">
				<h1><i class="fa fa-slideshare" aria-hidden="true"></i>
					운전자인증<small>기본정보입력</small></h1>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
					<li><a href="<c:url value='/member/driver/certify1'/>"><i class="fa fa-dashboard"></i> 운전자인증</a></li>
					<li class="active">기본정보입력</li>
				</ol>
			</section>
		</section>
	<!-- 메인 컨텐츠 부분 -->
	<section class="content">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">운전자 기본 정보 입력</h3>
			</div>
			<form action="certify2" method="post" class="form-horizontal">
				
			<div class="box-body">
				<div class="form-group">
                 	<label for="license_no" class="col-sm-2 control-label">운전면허번호</label>
				    <div class="col-sm-6">
                   		<input type="text" class="form-control" name="license_no" id="license_no" placeholder="운전면허번호 입력..">
                 	</div>               
               	</div>
               	<div class="form-group">
                 	<label for="car_no" class="col-sm-2 control-label">차량번호</label>
				    <div class="col-sm-6">
                   		<input type="text" class="form-control" name="car_no" id="car_no" placeholder="차량번호 입력..">
                 	</div>               
               	</div>
               	<div class="form-group">
                 	<label for="car_prod" class="col-sm-2 control-label">차량제조사</label>
				    <div class="col-sm-6">
                   		<input type="text" class="form-control" name="car_prod" id="car_prod" placeholder="차량제조사입력..">
                 	</div>               
               	</div>
               	<div class="form-group">
                 	<label for="car_model" class="col-sm-2 control-label">차량모델명</label>
				    <div class="col-sm-6">
                   		<input type="text" class="form-control" name="car_model" id="car_model" placeholder="차량모델명입력..">
                 	</div>               
               	</div>
               	<div class="form-group">
                 	<label for="car_color" class="col-sm-2 control-label">차량색상</label>
				    <div class="col-sm-6">
                   		<input type="text" class="form-control" name="car_color" id="car_color" placeholder="차량색상입력..">
                 	</div>               
               	</div>
               	<div class="form-group">
                 	<label for="car_year" class="col-sm-2 control-label">차량연식</label>
				    <div class="col-sm-6">
                   		<input type="text" class="form-control" name="car_year" id="car_year" placeholder="차량연식입력..">
                 	</div>               
               	</div>
			</div>
			
			<div class="box-footer">
				<button type="reset" class="btn btn-default pull-left" id="btnCancel">취소</button>
				<button type="submit" class="btn btn-primary pull-right" id="btnSubmit">다음단계</button>
			</div>
			</form>
		</div>
	</section>
	</div>
</div>
<script>

</script>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>