<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>
				회원 가입 <small>회원 가입 폼</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
				<li><a href="<c:url value='/member/join/step1'/>"> 회원가입</a></li>
				<li class="active">회원 가입 폼</li>
			</ol>
		</section>
		<section class="content container-fluid">
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1">
					<div class="box box-success">
						<div class="box-header with-border">
							<h2 class="box-title">이용 약관</h2>
						</div>
						<form:form role="form" commandName="registerRequest" 
							id="joinForm" action="step3" method="post" cssClass="form-horizontal">
						<div class="box-body">
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">이름</label>
								<div class="col-sm-10">
									<input type="text" name="name" class="form-control" id="name" 
										placeholder="이름 입력.." required="required">
									<p class="help-block">실명을 쓰지 않으면 이용에 제한이 있을 수 있습니다.</p>
								</div>
							</div>
							<div class="form-group">
								<label for="userid" class="col-sm-2 control-label">아이디</label>
								<div class="col-sm-10">
									<input type="text" name="userid" class="form-control" id="userid" 
										placeholder="아이디 입력.." required="required">
									
								</div>
							</div>
							<div class="form-group">
								<label for="userpw" class="col-sm-2 control-label">비밀번호</label>
								<div class="col-sm-10">
									<input type="password" name="userpw" class="form-control" id="userpw" 
										placeholder="비밀번호 입력.." required="required">									
								</div>
							</div>
							<div class="form-group">
								<label for="pw2" class="col-sm-2 control-label">비밀번호 확인</label>
								<div class="col-sm-10">
									<input type="password" name="pw2" class="form-control" id="pw2" oninput="checkPwd()"
										placeholder="비밀번호 확인 입력.." required="required">
									<p class="help-block">8글자 이상 영문+숫자+툭수문자 조합</p>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">이메일</label>
								<div class="col-sm-10">
									<input type="email" name="email" class="form-control" id="email" 
										placeholder="입력 예) user01@example.com" required="required">
									<p class="help-block">가입 후 메일인증이 필요하니 정확하게 입력하세요.</p>
								</div>
							</div>
							<div class="form-group">
								<label for="phone" class="col-sm-2 control-label">전화번호</label>
								<div class="col-sm-10">
									<input type="text" name="phone" class="form-control" id="phone" 
										placeholder="입력 예) 010-1111-1111" required="required">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">성별</label>
								<div class="col-sm-10">
									<label class="radio-inline">
									  <input type="radio" name="gender" id="genderM" value="MALE"> 남자
									</label>
									<label class="radio-inline">
									  <input type="radio" name="gender" id="genderF" value="FEMALE"> 여자
									</label>
								</div>
							</div>
						<div class="box-footer">
							<button class="btn btn-default pull-left"  onclick="history.go(-1);">
								<i class="fa fa-reply" aria-hidden="true"></i> 취소</button>
							<button id="joinBtn" class="btn btn-primary pull-right">
								<i class="fa fa-check-square-o" aria-hidden="true"></i> 회원 가입</button>
						</div>
						</form:form>
					</div>
				</div>
			</div>
		</section>
	</div>
<script>
	$(function() {
		$("#joinForm").submit(
				function() {
					if ($("#userpw").val() !== $("#pw2").val()) {
						alert("비밀번호가 다릅니다.");
						$("#userpw").val("").focus();
						$("#pw2").val("");
						return false;
					} else if ($("#userpw").val().length < 8) {
						alert("비밀번호는 8자 이상으로 설정해야 합니다.");
						$("#pw").val("").focus();
						return false;
					} else if ($.trim($("#userpw").val()) !== $("#userpw")
							.val()
							|| $.trim($("#email").val()) !== $("#email").val()
							|| $.trim($("#userid").val()) !== $("#userid")
									.val()) {
						alert("공백은 입력이 불가능합니다.");
						return false;
					}
				})

		$("#userid").keyup(function() {
			$.ajax({
				url : "/check_id",
				type : "POST",
				data : {
					userid : $("#userid").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						//$("#joinBtn").attr("disabled", "disabled");
					} else {
						$("#id_check").html("");
						//$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});

		$("#email").keyup(function() {
			$.ajax({
				url : "/check_email",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
					} else {
						$("#email_check").html("");
					}
				},
			})
		});
	})

	function checkPwd() {
		var inputed = $('#userpw').val();
		var reinputed = $("#pw2").val();
		if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
			$("#pw2").css("background-color", "#FFCECE");
		} else if (inputed == reinputed) {
			$("#pw2").css("background-color", "#B0F6AC");
			pwdCheck = 1;
			if (idCheck == 1 && pwdCheck == 1) {
				signupCheck();
			}
		} else if (inputed != reinputed) {
			pwdCheck = 0;
			//$("#joinBtn").prop("disabled", true);
			//$("#joinBtn").css("background-color", "#aaaaaa");
			$("#pw2").css("background-color", "#FFCECE");
		}
	}
</script>