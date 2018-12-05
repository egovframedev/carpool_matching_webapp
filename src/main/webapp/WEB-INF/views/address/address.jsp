<%@page import="com.carto.member.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta charset="UTF-8">
<title>AdressPage</title>

<script type="text/javascript">
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address2').value = fullRoadAddr;
			}
		}).open();
	}
</script>
</head>

<body>

	<form id="addressInsertForm" name="addressInsertForm" method="post">
		<div>
			<input type="hidden" name="mno" id="mno" value="${login.mno}"><br>
			<h2>주소록</h2>
			<input class="form-control"
				style="text-align: center; background: lightgray" placeholder="우편번호"
				name="address1" id="address1" type="text" readonly="readonly">
			<input class="form-control" placeholder="도로명 주소"
				style="text-align: center; width: 400px; background: lightgray"
				name="address2" id="address2" type="text" readonly="readonly" />
		</div>
		<div>
			<input class="form-control" style="text-align: center; width: 578px;"
				placeholder="상세주소 입력" name="address3" id="address3" type="text" />
		</div>
		<div>
			<button type="button" class="btn btn-default"
				onclick="execPostCode();">
				<i class="fa fa-search"></i> 주소검색
			</button>
			<div>
				<select id="addr_type" name="addr_type">
					<option value="HOME" selected>집</option>
					<option value="OFFICE">회사</option>
					<option value="FAVORITES">기타</option>
				</select> <input type="text" name="addr_name" id="addr_name"
					placeholder="주소명"><br>
			</div>
		</div>
		<div>
			<button type="button" name="insertAddrBtn">주소 저장</button>
			<button type="reset">초기화</button>
		</div>
	</form>

	<div>
		<form id="addressListForm" name="addressListForm" method="post">
			<div id="addressList"></div>
		</form>
	</div>
	<hr>
	<h3>${login.userid}(${login.mno})님의주소록</h3>
	<div>
		<table>
			<tr>
				<td class="edit_Addr"><input type="checkbox" name="checkAll"
					id="checkAll">전체선택</td>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td><input type="checkbox" class="edit_Addr" name="check"
						width="10" id="${list.addr_no}" value="${list.addr_no}">${list.addr_name}</td>
					<td>${list.address1}</td>
					<td>${list.address2}</td>
					<td>${list.address3}</td>
					<td></td>
				</tr>
			</c:forEach>
			<tr>
				<td><button class="edit_Addr" name="deleteAddress"
						id="deleteAddress" onclick="deleteAddress()">선택 삭제</button></td>
			</tr>
		</table>
	</div>

	<script>
	
		$('[name=insertAddrBtn]').click(function() { //주소 등록 버튼 클릭 
			var insertData = $('[name=addressInsertForm]').serialize(); //addressInsertForm의 내용을 가져옴
			insertAddress(insertData); //insertAddress 함수호출
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

		//주소 이름 수정
		function addressNameEdit() {
			var win =window.open("/carpool/edit", "Edit", "width=300,height=200,top=200,left=300,toolbar=no,scrollbars=no,resizable=no,location=no,status=no");
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
								location.href="/carpool/address"
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
</body>
</html>