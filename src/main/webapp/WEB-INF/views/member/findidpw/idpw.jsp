<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 비밀번호 찾기 -->
<script>
	$(function() {
		$("#findPwbtn").click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/member/find/pw',
				type : "POST",
				data : {
					userid : $("#pw_userid").val(),
					email : $("#pw_email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
</head>
<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<!-- 컨텐츠 헤더 부분(Page header) -->
			<section class="content-header">
				<h1>
					<i class="fa fa-slideshare" aria-hidden="true"></i> 아이디 비밀번호 찾기
				</h1>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i>
							HOME</a></li>
					<li><a href="<c:url value='/login'/>"><i
							class="fa fa-dashboard"></i> 로그인</a></li>
					<li class="active">아이디/비밀번호 찾기</li>
				</ol>
			</section>
		</section>

		<section class="content">
			<div class="col-md-6">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">아이디 찾기</h3>
						<small>이름/이메일 입력</small>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form:form id="findIdForm" class="form-horizontal" role="form"
						commandName="memberDTO" action="id" method="post">

						<div class="box-body">
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">이름</label>

								<div class="col-sm-10">
									<input type="text" class="form-control" id="id_name"
										name="id_name" placeholder="NAME" required />
								</div>

							</div>
							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">이메일</label>

								<div class="col-sm-10">
									<input type="email" class="form-control" id="id_email"
										name="id_email" placeholder="EMAIL" required />
								</div>

							</div>
							<div class="form-group">
								<c:if test="${userfindid != null}">
									<label class="col-sm-2 control-label" style="color: red">아이디</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="findid"
											id="findif"
											style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px; background-color: white"
											value="${name}님의 아이디는 ${userfindid} 입니다." readonly="readonly">
									</div>
								</c:if>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="reset" class="btn btn-danger ">취소</button>
							<button type="submit" class="btn btn-info pull-right" id="findId">아이디
								찾기</button>
						</div>

						<!-- /.box-footer -->
					</form:form>
				</div>
			</div>


			<!-- 비밀번호 -->
			<div class="col-md-6">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">비밀번호 찾기</h3>
						<small>아이디/이메일 입력</small>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form class="form-horizontal">
						<div class="box-body">
							<div class="form-group">
								<label for="inputId" class="col-sm-2 control-label">아이디</label>

								<div class="col-sm-10">
									<input type="text" class="form-control" id="pw_userid"
										name="pw_userid" placeholder="ID" required>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">이메일</label>

								<div class="col-sm-10">
									<input type="email" class="form-control" id="pw_email"
										name="pw_email" placeholder="EMAIL" required>
								</div>
							</div>

						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="reset" class="btn btn-danger ">취소</button>
							<button type="button" id="findPwbtn" name="findPwbtn"
								class="btn btn-info pull-right">비밀번호 찾기</button>
						</div>

						<!-- /.box-footer -->
					</form>
				</div>
			</div>
		</section>

	</div>
</div>



<!-- 컨텐츠 끝  -->
<%@ include file="../../includes/footer.jsp"%>