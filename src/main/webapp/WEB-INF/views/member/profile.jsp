<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

<script type="text/javascript">
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				/* $("[name=address1]").val(data.zonecode);
				$("[name=address2]").val(fullRoadAddr); */

				document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address2').value = fullRoadAddr;
				//document.getElementById('address3').value = data.jibunAddress;
			}
		}).open();
	}
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
	width: 220px;
	height: 20px;
	text-align: right;
}

.col-sm-8 {
	padding-left: 0px;
	padding-right: 0px;
}

.col-sm-4 {
	padding-left: 0px;
	padding-right: 0px;
}

.col-sm-12 {
	padding-left: 0px;
	padding-right: 0px;
}

#addrlist {
	text-align: center;
	padding-left: 5px;
	padding-right: 5px;
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
					<li class="active">My Profile</li>
				</ol>
			</section>
		</section>
		<!-- 메인 컨텐츠 부분 -->

		<section class="content">
			<div class="row">
				<div class="col-md-6">
					<!-- Widget: user widget style 1 -->
					<div class="box box-widget widget-user-2">
						<!-- Add the bg color to the header using any of the bg-* classes -->
						<div class="widget-user-header bg-blue">
							<div class="widget-user-image">
								<!-- <img class="img-circle" src="../dist/img/user7-128x128.jpg"
									alt="User Avatar"> -->
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
									<button class="btn btn-primary btn-block btn-sm" data-toggle='modal'
										data-target='#modifyProfile'>기본정보 수정</button>
								</div>
							</div>

							<!-- 비밀번호 변경 -->
							<div class="box-footer">
								<form id="pwForm" action="/carpool/member/updatePw"
									method="post">
									<div>
										<label>비밀번호 변경</label>
									</div>
									<input type="hidden" id="pw_userid" name="userid"
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
											class="btn btn-default btn-block btn-sm">비밀번호 변경</button>
									</div>
								</form>
							</div>

							<div class="box-footer">
								<form id="withdrawal" action="/carpool/member/withdrawal"
									method="post">
									<div>
										<label>회원 탈퇴</label>
									</div>
									<input type="hidden" id="withdrawal_userid" name="userid"
										value="${memberlist.userid}">
									<div>
										<label>PASSWORD :</label> <input class="pwinput"
											id="withdrawal_userpw" name="userpw" type="password"
											placeholder="비밀번호 입력">
									</div>
									<div>
										<button type="submit" class="btn btn-default btn-block btn-sm">회원
											탈퇴</button>
									</div>
								</form>
							</div>

						</div>
					</div>
					<!-- /.widget-user -->
				</div>
				<div class="col-md-6">
					<div class="box box-info">
						<form id="addressInsertForm" name="addressInsertForm" class="form"
							method="post">
							<div class="box-header with-border">
								<div class="form-group">
									<h3 class="box-title">주소 등록</h3>
								</div>
								<div class="form-group">
									<button type="button" class="btn btn-success pull-right"
										onclick="execPostCode();">
										<i class="fa fa-search"></i> 주소검색
									</button>
								</div>
							</div>

							<div class="box-body">
								<div class="form-group">
									<input type="hidden" name="mno" id="mno" value="${login.mno}">
									<div class="col-sm-4">
										<input class="form-control col-md-4" placeholder="우편번호"
											name="address1" id="address1" type="text" readonly="readonly">
									</div>
									<div class="col-sm-8">
										<input class="form-control col-md-8" placeholder="도로명 주소"
											name="address2" id="address2" type="text" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<input class="form-control" placeholder="상세주소 입력"
											name="address3" id="address3" type="text" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<input class="form-control" type="text" name="addr_name"
											id="addr_name" placeholder="주소명">
									</div>
								</div>
								<!-- /.box-body -->
							</div>
							<div class="box-footer">
								<button type="button" class="btn btn-primary btn-block btn-sm"
									name="insertAddrBtn">주소 저장</button>
							</div>
						</form>
					</div>
					<!-- /.box -->
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">${login.userid}(${login.mno})님의&nbsp;주소록</h3>
						</div>
						<div class="box-body">
							<table class="table table-hover">
								<tr style="background-color: #d2d6de;">
									<td class="edit_Addr"><input type="checkbox"
										name="checkAll" id="checkAll">주소명</td>
									<td id="addrlist">우편번호</td>
									<td id="addrlist">주소</td>
									<td id="addrlist">상세주소</td>
								</tr>
								<c:forEach var="list" items="${list}">
									<tr class="myaddr">
										<td><input type="checkbox" class="edit_Addr" name="check"
											width="10" id="${list.addr_no}" value="${list.addr_no}">${list.addr_name}</td>
										<td id="addrlist">${list.address1}</td>
										<td id="addrlist">${list.address2}</td>
										<td id="addrlist">${list.address3}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<!-- ./box-body -->
						<div class="box-footer">
							<button class="edit_Addr btn btn-primary pull-right"
								name="deleteAddress" id="deleteAddress"
								onclick="deleteAddress()">선택 삭제</button>
						</div>
						<!-- ./box-footer -->
					</div>
					<!-- /. box -->
				</div>
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

<script>
	
		$('[name=insertAddrBtn]').click(function() { //주소 등록 버튼 클릭 
			var insertData = $('[name=addressInsertForm]').serialize(); //addressInsertForm의 내용을 가져옴
			
			insertAddress(insertData); //insertAddress 함수호출
			if($(".myaddr").length >= 5 ){
				alert("주소 등록 갯수를 초과하였습니다.")
			}else{
				alert("주소가 등록 되었습니다.")
			}
		});
		//주소 등록(AJAX)
		function insertAddress(insertData) {
			$.ajax({
				type : 'post',
				url : "<c:url value='/addressSave'/>",
				data : insertData,
				success : function(data) {
					document.location.reload();
				},
				error : function(request, status, error) {
					alert("error"+error)
				}
			});
		}
		
		//주소 삭제
		function deleteAddress() {
			var addrnum="";
			var checkArray = new Array();
			
			<c:forEach var="selectAddr" items="${list}" varStatus="status">
				addrnum = "#"+"${selectAddr.addr_no}";
				if($(addrnum).is(":checked")){
					checkArray.push(${selectAddr.addr_no});
				}
			</c:forEach>
			
			if(checkArray.length == 0){
				alert("삭제할 주소를 선택하세요.")
			}else{
				if(confirm("삭제하시겠습니까?") == true){
					$.ajax({
						type:'POST',
						url: 'deleteAddress',
						data:{ checkArray : checkArray},
							success:function pageReload(){
								location.href="/carpool/member/myprofile"
							},
							error:function(request,status,error){
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
					});
					checkArray = new Array();
					addrnum="";
				}
				else{
					location.reload(true);
				}
			}
		}
		$( document ).ready( function() {
		   $("#checkAll").click( function() {
		      $("input[name=check]:checkbox").prop('checked', this.checked);
		   });
		});
		
		function toggle_EditOpt() {
			$(".edit_Addr").toggle();
		}
		
	</script>

<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>