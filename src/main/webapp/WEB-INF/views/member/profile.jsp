<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 프로필 업데이트 -->
<script>
	$(function() {
		$(".modalModBtn").click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/member/myprofile/modify',
				type : "POST",
				data : {
					userid : $("#userid").val(),
					email : $("#email").val(),
					phone : $("#phone").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>

<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<!-- 컨텐츠 헤더 부분(Page header) -->
			<section class="content-header">
				<h1>
					<i class="fa fa-slideshare" aria-hidden="true"></i> My profile<small>회원
						정보 수정</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i>
							HOME</a></li>
					<li class="active">My profile</li>
				</ol>
			</section>
		</section>
		<!-- 메인 컨텐츠 부분 -->

		<section class="content">
			<div class="col-md-6">
				<!-- Widget: user widget style 1 -->
				<div class="box box-widget widget-user-2">
					<!-- Add the bg color to the header using any of the bg-* classes -->
					<div class="widget-user-header bg-yellow">
						<div class="widget-user-image">
							<img class="img-circle" src="../dist/img/user7-128x128.jpg"
								alt="User Avatar">
						</div>
						<!-- /.widget-user-image -->
						<h3 class="widget-user-username">${memberlist.name}</h3>
						<h5 class="widget-user-desc">${memberlist.userid}</h5>
					</div>
					<div class="box-footer">
						<ul class="nav nav-stacked">
							<li><a href="">E-mail : <label style="float: right">${memberlist.email}</label>
							</a></li>
							<li><a href="">Phone : <label style="float: right">${memberlist.phone}</label>
							</a></li>
							<li><a href="">Gender : <label style="float: right">${memberlist.gender}</label>
							</a></li>
						</ul>
						<div class="box-footer">
							<button class="pull-right btn btn-success" data-toggle='modal'
								data-target='#modifyProfile'>기본 정보 수정</button>
						</div>
					</div>
					<div class="box-footer">
						<div>
							<label>PASSWORD :</label> <input type="password"
								style="float: right; width: 300px; height: 20px;">
						</div>
						<div>
							<label>NEW PASSWORD :</label> <input type="password"
								style="float: right; width: 300px; height: 20px;">
						</div>
						<div>
							<label>CONFIRM :</label> <input type="password"
								style="float: right; width: 300px; height: 20px;">
						</div>
					</div>
					<div class="box-footer">
						<button class="pull-right btn btn-success">비밀번호 변경</button>
					</div>
				</div>
				<!-- /.widget-user -->
			</div>
		</section>
	</div>
</div>

<div class="modal fade" id="modifyProfile" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">기본정보 수정</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="name">이름</label> <input class="form-control" id="name"
						name="name" value="${memberlist.name}" readonly>
				</div>
				<div class="form-group">
					<label for="userid">아이디</label> <input class="form-control"
						id="userid" name="userid" value="${memberlist.userid}" readonly>
				</div>
				<div class="form-group">
					<label for="email">이메일</label> <input class="form-control"
						id="email" name="email" value="${memberlist.email}">
				</div>
				<div class="form-group">
					<label for="phone">전화번호</label> <input class="form-control"
						id="phone" name="phone" value="${memberlist.phone}">
				</div>
				<div class="form-group">
					<label for="gender">성별</label> <input class="form-control"
						id="gender" name="gender" value="${memberlist.gender}" readonly>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger pull-left"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-success modalModBtn">수정</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>