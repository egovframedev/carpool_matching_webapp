<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 메인 컨텐츠 부분 -->
		<section class="content container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
							<li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
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
	</section>
	<!-- /.content -->
	<p>${login}</p>
	</div>
<!-- 컨텐츠 끝  -->
<%@ include file="./includes/footer.jsp"%>
