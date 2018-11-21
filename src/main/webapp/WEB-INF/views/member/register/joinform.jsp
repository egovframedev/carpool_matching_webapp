<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
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

<title>CarTO</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>CarTO</h3>
			</div>
			<div>
				<form:form role="form" commandName="registerRequest" id="joinForm" action="step3" method="post">
					<p>
						<input class="w3-input" id="name" name="name" type="text"
							placeholder="이름" required>
					</p>

					<p>
						<input class="w3-input" type="text" id="userid" name="userid"
							placeholder="아이디" required> <span id="id_check"
							class="w3-text-red"></span>
					</p>

					<p>
						<input class="w3-input" id="userpw" name="userpw" type="password"
							placeholder="비밀번호" required>
					</p>

					<p>
						<input class="w3-input" id="pw2" name="pw2" type="password"
							placeholder="비밀번호 확인" required oninput="checkPwd()">
					</p>

					<p>
						<input type="email" id="email" name="email" class="w3-input"
							required placeholder="이메일"> <span id="email_check"
							class="w3-text-red"></span>
					</p>

					<p>
						<input type="text" id="phone" name="phone" class="w3-input"
							required placeholder="전화번호">
					</p>

					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-primary"> <input type="radio"
							name="gender" id="jb-radio-1" type="radio" value="MALE">남자
						</label> <label class="btn btn-primary"> <input type="radio"
							name="gender" id="jb-radio-1" type="radio" value="FEMALE">여자
						</label>
					</div>

					<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Join</button>
						<button type="button" onclick="history.go(-1);"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
					</form:form>
			</div>
		</div>
	</div>
</body>
</html>