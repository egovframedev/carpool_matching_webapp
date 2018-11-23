<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>결제 내역조회 <small>payment serach</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 내 정보</a></li>
				<li class="active">결제 내역 조회</li>
			</ol>
		</section>	
		<!-- 메인 컨텐츠 부분 -->
		<section class="content container-fluid">
			<div class="box box-primary">
				<div class="box-body">
					<h2 class="text-center text-primary">Carto를 이용해 주셔서 감사합니다.</h2>
					
					<p class="text-center">결제 번호및 결제 시각으로 조회 가능합니다.</p>
					<div class="form-group has-success text-center">
	                </div>
					<div class="input-group input-group-lg">
					  <span class="input-group-addon" style="background-color: #efefef;">카풀 이용 금액</span>
					  <span class="input-group-addon" style="width:80%;" >원</span>
					</div>				
				</div>
			</div>
			<div class="box box-danger">
				<div class="box-header with-border">
				    <h3 class="box-title" >결제내역 조회</h3>
				</div>
		        <div class="box-body">
		        	<table class="table table-striped">
		        		<thead>
		        			<tr class="bg-primary">
		        				<th>결제 번호</th>
		        				<th>결제 금액</th>
		        				<th>결제 승인번호</th>
		        				<th>결제 일자</th>
		        			</tr>
		        		</thead>
		        		<tbody>
		        		<c:forEach items="${listview}" var="listview" varStatus="aa">
		        			<tr>
		        				<td>${listview.payno}</td>
		        				<td>${listview.amount}</td>
		        				<td>${listview.apply_num}</td>
		        				<td>${listview.pay_date}</td>
		        			</tr>
						</c:forEach>
		        		</tbody>	
		        	</table>
		        </div>
		    </div>
			
			
		</section>
		<!-- /.content -->
	</div>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
