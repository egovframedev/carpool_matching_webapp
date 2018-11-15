<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>
				카풀 요청<small>Carpool Request Page</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 카풀 요청</a></li>
				<li class="active">카풀 요청 조회</li>
			</ol>
		</section>	
		<!-- 메인 컨텐츠 부분 -->
		<section class="content container-fluid">
			<!-- 검색 부분 -->
			<div class="box box-danger">
	            <div class="box-header with-border">
	              <h3 class="box-title">카풀 요청 조회</h3>
	            </div>
            	<div class="box-body">
            		<form action="${request.requestURI}" method="get">
		              <div class="row">
		                <div class="col-md-5 col-xs-5">
		                  <input type="text" class="form-control" placeholder="출발지 입력...">
		                </div>
		                <div class="col-md-5 col-xs-5">
		                  <input type="text" class="form-control" placeholder="목적지 입력...">
		                </div>
		                <div class="col-md-2 col-xs-2">
		                  <button type="submit" class="btn btn-success btn-block">
		                  	<i class="fa fa-search"></i> 검색</button>
		                </div>
		              </div>
            		</form>
            	</div><!-- /.box-body -->
          	</div><!-- // 검색 부분 -->
          	<!-- 결과 리스트 부분 -->
          	<div class="row">        
		</section>
		<!-- /.content -->
	</div>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
