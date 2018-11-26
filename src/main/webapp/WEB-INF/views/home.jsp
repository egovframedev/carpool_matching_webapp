<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
	<div class="content-wrapper">
		<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>
				페이지 제목 부분 <small>페이지 부가 설명 부분</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 메뉴제목</a></li>
				<li class="active">페이지 제목</li>
			</ol>
		</section>	
		<!-- 메인 컨텐츠 부분 -->
		<section class="content container-fluid">
			<!--------------------------
	        | 요기서 부터 내용 부분!  |
	        -------------------------->
			<h2>환영합니다! CarTo!</h2>
			<P>카풀 매칭 웹 서비스 어플리케이션</P>
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-success">
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
		          	</div>
	          	</div>
	        
          	
          		<div class="col-xs-12">
		        	<div class="box">
		            	<div class="box-header">
		              		<h3 class="box-title">카풀 요청 목록</h3>		
		              	</div><!-- /.box-header -->
		            	<div class="box-body table-responsive no-padding">
		              		<table class="table table-hover table-striped">
		                	<thead>
		                		<tr class="bg-primary">
		                		    <th>번호</th>
									<th>작성자</th>
									<th>출발지 <i class="fa fa-long-arrow-right" aria-hidden="true"></i> 도착지</th>
									<th>유형</th>
									<th>인원/금액</th>
		               			</tr>
		               		<thead>
		               		<tbody>
		              			<tr>
		                  			<td>100</td>
		                  			<td><img src="<c:url value="/img/user3-128x128.jpg"/>" alt="profile" class="img-circle" style="width:50px"/>
		                  				<span class="user-name">Johnson</span>
		                  			</td>
		                  			<td>
		                  				<span class="start-point">인천 연수구 신연수역</span>
		                  				<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
		                  				<span class="end-point">서울 종로구 종각역</span>
		                  			</td>
		                  			<td><span class="label label-success">요청중</span></td>
		                 			<td>4 / 5000원</td>
		                		</tr>
		                		<tr>
		                  			<td>99</td>
		                  			<td><img src="<c:url value="/img/user2-160x160.jpg"/>" alt="profile" class="img-circle" style="width:50px"/>
		                  				<span class="user-name">Johnson</span>
		                  			</td>
		                  			<td>
		                  				<span class="start-point">수원 팔달구 수원시청</span>
		                  				<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
		                  				<span class="end-point">서울 종로구 종각역</span>
		                  			</td>
		                  			<td><span class="label label-warning">마감</span></td>
		                 			<td>2 / 8000원</td>
		                		</tr>
		                		<tr>
		                  			<td>98</td>
		                  			<td><img src="<c:url value="/img/user1-128x128.jpg"/>" alt="profile" class="img-circle" style="width:50px"/>
		                  				<span class="user-name">Johnson</span>
		                  			</td>
		                  			<td>
		                  				<span class="start-point">수원 팔달구 수원시청</span>
		                  				<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
		                  				<span class="end-point">서울 종로구 종각역</span>
		                  			</td>
		                  			<td><span class="label label-primary">취소</span></td>
		                 			<td>2 / 8000원</td>
		                		</tr>
		                		<tr>
		                  			<td>97</td>
		                  			<td><img src="<c:url value="/img/user4-128x128.jpg"/>" alt="profile" class="img-circle" style="width:50px"/>
		                  				<span class="user-name">Johnson</span>
		                  			</td>
		                  			<td>
		                  				<span class="start-point">수원 팔달구 수원시청</span>
		                  				<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
		                  				<span class="end-point">서울 종로구 종각역</span>
		                  			</td>
		                  			<td><span class="label label-danger">긴급</span></td>
		                 			<td>2 / 10000원</td>
		                		</tr>
		                		<tr>
		                  			<td>96</td>
		                  			<td><img src="<c:url value="/img/user5-128x128.jpg"/>" alt="profile" class="img-circle" style="width:50px"/>
		                  				<span class="user-name">Johnson</span>
		                  			</td>
		                  			<td>
		                  				<span class="start-point">수원 팔달구 수원시청</span>
		                  				<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
		                  				<span class="end-point">서울 종로구 종각역</span>
		                  			</td>
		                  			<td><span class="label label-danger">긴급 요청</span></td>
		                 			<td>2 / 10000원</td>
		                		</tr>
		                		<tr>
		                  			<td>95</td>
		                  			<td><img src="<c:url value="/img/user4-128x128.jpg"/>" alt="profile" class="img-circle" style="width:50px"/>
		                  				<span class="user-name">Johnson</span>
		                  			</td>
		                  			<td>
		                  				<span class="start-point">수원 팔달구 수원시청</span>
		                  				<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
		                  				<span class="end-point">서울 종로구 종각역</span>
		                  			</td>
		                  			<td><span class="label label-danger">긴급 요청</span></td>
		                 			<td>2 / 10000원</td>
		                		</tr>
		                		<tr>
		                  			<td>94</td>
		                  			<td><img src="<c:url value="/img/user3-128x128.jpg"/>" alt="profile" class="img-circle" style="width:50px"/>
		                  				<span class="user-name">Johnson</span>
		                  			</td>
		                  			<td>
		                  				<span class="start-point">수원 팔달구 수원시청</span>
		                  				<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
		                  				<span class="end-point">서울 종로구 종각역</span>
		                  			</td>
		                  			<td><span class="label label-danger">긴급 요청</span></td>
		                 			<td>2 / 10000원</td>
		                		</tr>
		                		<tr>
		                  			<td>93</td>
		                  			<td><img src="<c:url value="/img/user8-128x128.jpg"/>" alt="profile" class="img-circle" style="width:50px"/>
		                  				<span class="user-name">Johnson</span>
		                  			</td>
		                  			<td>
		                  				<span class="start-point">수원 팔달구 수원시청</span>
		                  				<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
		                  				<span class="end-point">서울 종로구 종각역</span>
		                  			</td>
		                  			<td><span class="label label-danger">긴급 요청</span></td>
		                 			<td>2 / 10000원</td>
		                		</tr>
		                		<tr>
		                  			<td>92</td>
		                  			<td><img src="<c:url value="/img/user7-128x128.jpg"/>" alt="profile" class="img-circle" style="width:50px"/>
		                  				<span class="user-name">Johnson</span>
		                  			</td>
		                  			<td>
		                  				<span class="start-point">수원 팔달구 수원시청</span>
		                  				<span class="arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
		                  				<span class="end-point">서울 종로구 종각역</span>
		                  			</td>
		                  			<td><span class="label label-danger">긴급 요청</span></td>
		                 			<td>2 / 10000원</td>
		                		</tr>
		                	</tbody>
		                	</table>
		            	</div><!-- /.box-body -->
		   				<!-- 페이지네이션 -->
		            	<div class="box-footer clearfix">
				            <ul class="pagination pagination-sm no-margin">
				                <li><a href="#">«</a></li>
				                <li><a href="#">1</a></li>
				                <li><a href="#">2</a></li>
				                <li><a href="#">3</a></li>
				                <li><a href="#">»</a></li>
				            </ul>
				            <div class="btn-group pull-right">
				            	<button type="button" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> 카풀 등록</button>
				            </div>
			            </div>
		         	</div> <!-- /.box -->
		        </div>
		      </div>
		    </div>
		</section>
		<!-- /.content -->
		</div>
	</div>
<!-- 컨텐츠 끝  -->
<%@ include file="./includes/footer.jsp"%>
