<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>결제 완료 <small>payment success</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 결제 페이지</a></li>
				<li class="active">결제 완료</li>
			</ol>
		</section>	
		<!-- 메인 컨텐츠 부분 -->
		<section class="content container-fluid">
			<div class="box box-primary">
				<div class="box-body">
					<h2 class="text-center text-primary">Carto를 이용해 주셔서 감사합니다.</h2>
					
					<p class="text-center">주문하신 내역은 나의 결제내역에서 다시 확인이 가능합니다.</p>
					<div class="form-group has-success text-center">
	                  <label class="control-label" for="inputSuccess"><i class="fa fa-check"></i> payment with success</label>
	                </div>
					<div class="input-group input-group-lg">
					  <span class="input-group-addon" style="background-color: #efefef;">결제 금액</span>
					  <span class="input-group-addon"  style="width:80%;" >
					  	<div class="text-left">
					  		<span style="display:inline-block; font-size:14px; line-height:24x; padding-right:12px;">결제 금액:</span>
					  		<span style="display:inline-block;font-size:24px; line-height:28px; color:red;">${cpjoin.carpool.charge}</span>
					  		<span style="display:inline-block;font-size:24px; line-height:28px; color:red;">원</span>
					  	</div>
					  </span>
					</div>				
				</div>
			</div>
			<div class="box box-danger">
				<div class="box-header with-border">
				    <h3 class="box-title" >결제 내역</h3>
				</div>
		        <div class="box-body">
		        	<table class="table table-striped">
		        		<thead>
		        			<tr class="bg-primary">
		        				<th style="width:10%">결제 번호 </th>
		        				<th>결제 방식</th>
		        				<th>결제 금액</th>
		        				<th>결제 일자</th>
		        			</tr>
		        		</thead>
		        		<tbody>
		        			<tr>
		        				<td>${cpjoin.carpool.payno}</td>
		        				<td>카드</td>
		        				<td>${cpjoin.carpool.charge}</td>
		        				<td>${cpjoin.carpool.matchDateFmt}</td>
		        			</tr>
		        		</tbody>	
		        	</table>
		        </div>
		    </div>
		</section>
		<!-- /.content -->
	</div>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>
