<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
<div class="content-wrapper">
	<div class="container">
		<!-- 메인 컨텐츠 부분 -->
		<div class="row">
			<div class="col-xs-12">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"
							class=""></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"
							class=""></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="https://source.unsplash.com/drw6RtOKDiA/1600x800"
								alt="First slide">
							<div class="carousel-caption">First Slide</div>
						</div>
						<div class="item">
							<img src="https://source.unsplash.com/GbcjU3tcUeQ/1600x800"
								alt="Second slide">
							<div class="carousel-caption">Second Slide</div>
						</div>
						<div class="item">
							<img src="https://source.unsplash.com/d0yYWDJ1qDI/1600x800"
								alt="Third slide">
							<div class="carousel-caption">Third Slide</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-example-generic"
						data-slide="prev"> <span class="fa fa-angle-left"></span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						data-slide="next"> <span class="fa fa-angle-right"></span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- /.content -->
	<%-- <p>${login}</p> --%>
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
								<li class="item"><a href="<c:url value='/board/notice/detail?bno=${board.bno}'/>" class="product-title">${board.title}</a></li>
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
								<li class="item"><a href="<c:url value='/board/faq/list'/>" class="product-title"> ${board.title} </a></li>
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
								<li class="item"><a href="<c:url value='/board/qna/detail?bno=${board.bno }'/>" class="product-title">${board.title}</a></li>
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
<%@ include file="../includes/footer.jsp"%>