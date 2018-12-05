<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="./includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
<style>
  .carousel-wrap { height:600px;}
  #carousel-box {height: 100%; overflow: hidden;}
  .carousel-title{position: absolute; text-align: center; top: 21%; width: 100%; left: 0; color: white; font-size: 2.4em; font-weight: 700; letter-spacing: .8em; text-shadow: 1px 1px 2px rgba(0,0,0,.5);}
  .box.box-primary { height:300px;}
  .products-list li.item {overflow: hidden;}
  .products-list .item a {display: inline-block; width: 75%; color:#333; text-overflow:ellipsis; white-space:nowrap; word-wrap:normal; overflow: hidden;}
  .products-list .date {display: inline-block; color:#555;}
</style>
<div class="content-wrapper">
	<section class="carousel-wrap">
		<!-- 메인 컨텐츠 부분 -->
		<div id="carousel-box" class="carousel slide" data-ride="carousel" >
			<ol class="carousel-indicators">
				<li data-target="#carousel-box" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-box" data-slide-to="1"></li>
				<li data-target="#carousel-box" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="<c:url value='/img/carpool1.jpg'/>" alt="First slide">
					<h3 class="carousel-title">출퇴근 문화를 바꾸다</h3>
				</div>
				<div class="item">
					<img src="<c:url value='/img/carpool2.jpg'/>"	alt="Second slide">
					<h3 class="carousel-title">보다 편리한 카풀 이용</h3>
				</div>
				<div class="item">
					<img src="<c:url value='/img/carpool3.jpg'/>" alt="Third slide">
					<h3 class="carousel-title">즐거운 카풀 이용</h3>
				</div>
			</div>
			<a class="left carousel-control" href="#carousel-box" data-slide="prev"> <span class="fa fa-angle-left"></span></a> 
			<a class="right carousel-control" href="#carousel-box" data-slide="next"> <span class="fa fa-angle-right"></span></a>
		</div>
	</section>
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-sm-4">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">공지사항</h3>
						<small style="float: right;"><a href="<c:url value='/board/notice/list'/>">+more</a></small>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<ul class="products-list product-list-in-box">
							<c:forEach var="board" items="${notice}">
								<li class="item">
									<a href="<c:url value='/board/notice/detail?bno=${board.bno}'/>" class="product-title">${board.title}</a>
									<span class="date"><fmt:formatDate value="${board.reg_date}" pattern="yyyy.MM.dd" /></span>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- /.box-body -->
				</div>
			</div>
			<div class="col-sm-4">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">FAQ</h3>
						<small style="float: right;"><a href="<c:url value='/board/faq/list'/>">+more</a></small>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<ul class="products-list product-list-in-box">
							<c:forEach var="board" items="${faq}">
								<li class="item">
									<a href="<c:url value='/board/faq/list'/>" class="product-title"> ${board.title} </a>
									<span class="date"><fmt:formatDate value="${board.reg_date}" pattern="yyyy.MM.dd" /></span>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- /.box-body -->
				</div>
			</div>
			<div class="col-sm-4">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">QNA</h3>
						<small style="float: right;"><a href="<c:url value='/board/qna/list'/>">+more</a></small>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<ul class="products-list product-list-in-box">
							<c:forEach var="board" items="${qna}">
								<li class="item">
									<a href="<c:url value='/board/qna/detail?bno=${board.bno }'/>" class="product-title">${board.title}</a>
									<span class="date"><fmt:formatDate value="${board.reg_date}" pattern="yyyy.MM.dd" /></span>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- /.box-body -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 컨텐츠 끝  -->
<%@ include file="./includes/footer.jsp"%>