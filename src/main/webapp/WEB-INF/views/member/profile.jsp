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
	});
</script>

<script>
$(function(){
	if(${msg != null}){
		alert('${msg}');
	};
	
	if($("#pwForm").submit(function(){
		if($("#userpw").val() !== $("#newpwchk").val()){
			alert("새 비밀번호가 다릅니다.");
			$("#userpw").val("").focus();
			$("#newpwchk").val("");
			return false;
		}else if ($("#newpw").val().length < 8) {
			alert("비밀번호는 8자 이상으로 설정해야 합니다.");
			$("#userpw").val("").focus();
			$("#newpwchk").val("");
			return false;
		}else if($.trim($("#userpw").val()) !== $("#userpw").val()){
			alert("공백은 입력이 불가능합니다.");
			return false;
		}
	}));
})
</script>

<style>
#myinfo {
	font-size: 14px;
	float: right;
}

.pwinput {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	float: right;
	width: 300px;
	height: 20px;
	text-align: right;
}
</style>

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
					<div class="box">

						<!-- 회원정보 수정 -->
						<div class="box-footer">
							<div>
								<label>Email :</label> <label id="myinfo">${memberlist.email}</label>
							</div>
							<div>
								<label>Phone :</label> <label id="myinfo">${memberlist.phone}</label>
							</div>
							<div>
								<label>Gender :</label> <label id="myinfo">${memberlist.gender}</label>
							</div>

							<div>
								<button class="pull-right btn btn-success" data-toggle='modal'
									data-target='#modifyProfile'>기본정보 수정</button>
							</div>
						</div>

						<!-- 비밀번호 변경 -->
						<div class="box-footer">
							<form id="pwForm" action="/carpool/member/updatePw" method="post">
								<div>
									<label>비밀번호 변경</label>
								</div>
								<input type="hidden" id="userid" name="userid"
									value="${memberlist.userid}">
								<div>
									<label>PASSWORD :</label> <input class="pwinput" id="oldpw"
										name="oldpw" type="password" placeholder="비밀번호 입력" required>
								</div>
								<div>
									<label>NEW PASSWORD :</label> <input class="pwinput"
										id="userpw" name="userpw" type="password"
										placeholder="새비밀번호 입력" required>
								</div>
								<div>
									<label>CONFIRM :</label> <input class="pwinput" id="newpwchk"
										name="newpwchk" type="password" placeholder="새비밀번호 확인"
										required>
								</div>
								<div>
									<button type="submit" id="updatePwBtn"
										class="pull-right btn btn-success">비밀번호 변경</button>
								</div>
							</form>
						</div>

						<div class="box-footer">
							<form id="withdrawal" action="/carpool/member/withdrawal"
								method="post">
								<div>
									<label>회원 탈퇴</label>
								</div>
								<input type="hidden" id="userid" name="userid"
									value="${memberlist.userid}">
								<div>
									<label>PASSWORD :</label> <input class="pwinput" id="userpw"
										name="userpw" type="password" placeholder="비밀번호 입력">
								</div>
								<div>
									<button type="submit" class="pull-right btn btn-danger">회원 탈퇴</button>
								</div>
							</form>
						</div>

					</div>
				</div>
				<!-- /.widget-user -->
			</div>
		</section>
	</div>
</div>

<!-- 프로필 수정 모달 -->
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