<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../includes/header.jsp"%>
<!-- 컨텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>
				회원 가입 <small>이용약관 및 개인정보수집 동의</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
				<li><a href="<c:url value='/member/join/step1'/>"> 회원가입</a></li>
				<li class="active">이용약관 및 개인정보수집 동의</li>
			</ol>
		</section>
		<section class="content container-fluid">
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1">
					<div class="box box-success">
						<div class="box-header with-border">
							<h2 class="box-title">이용 약관</h2>
						</div>
						<div class="box-body">
							<p>제 1 조 (목적) 본 약관은 카티오(이하 "회사")가 제공하는 CarTO(카티오) 서비스의 이용과 관련하여
					회사와 회원의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다. 제 2 조 (정의) ① 본
					약관에서 사용하는 용어의 정의는 다음과 같습니다. 1. "CarTO(카티오)"(이하 “서비스”라 합니다)라 함은
					“드라이버용 애플리케이션(이하 “앱”이라 합니다)”과 “라이더용 앱”을 통해 “라이드셰어링매칭”을 제공하는 서비스로
					구체적인 내용은 제 8조에 따릅니다. 2. “회원”이라 함은 회사의 서비스에 접속하여 본 약관에 따라 회사와 이용계약을
					체결하고 회사가 제공하는 서비스를 이용하는 고객을 말합니다. 3. “드라이버”라 함은 서비스 이용 회원 중에 드라이버용
					앱을 이용하는 운전자 회원으로서, 자가용 승용자동차을 이용하여 라이더에게 “카풀”(제6호에서 정의됨. 이하 같음)을
					제공하는 운전자 회원을 말합니다.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1">
					<div class="box box-warning">
						<div class="box-header with-border">
							<h2 class="box-title">개인정보 취급방침</h2>
						</div>
						<div class="box-body">
							<p>Ⅰ. 개인정보 수집ㆍ이용에 관한 동의 1. 수집하는 개인정보의 항목 및 수집방법 가. 수집하는 개인정보의 항목
					1) 회사는 회원 종류에 따라 다음과 같은 개인정보를 필수항목으로 수집하고 있습니다. ① 라이더 회원 - 이름 -
					이메일주소(아이디) 및 패스워드 - 휴대전화번호 ② 드라이버 회원 - 이름 - 이메일주소(아이디) 및 패스워드 -
					휴대전화번호 - 프로필 사진 - 운전면허정보 - 차량 정보와 사진 - 자동차 등록증 - 차량보험증서 2) 회사는 다음과
					같은 회원의 개인정보를 선택항목으로 수집할 수 있습니다. - 프로필 사진(라이더 회원의 경우에 한함),
					주민등록번호(드라이버 회원의 경우에 한함), 집주소, 집전화번호, 성별, 직업, 소속기관명, 소속기관 이메일주소,
					기념일, 범죄경력회보서, 운전자보험증서, 운전경력증명서, 가족관계증명서 등 3) 서비스 이용과정이나 사업 처리 과정에서
					다음과 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. - IP Address, 쿠키, 방문 일시, 서비스 이용
					기록, 불량 이용 기록, 기기 정보, 채팅 기록, 앱 설치정보, 네트워크 위치정보 등</p>
						</div>
						<div class="box-footer">
							<form role="form" action="step2" method="post">
								<div class="form-group">
									<label class="checkbox-inline"> <input type="checkbox"
										name="agree" value="true">동의합니다.
									</label>
								</div>
								<button type="submit" class="btn btn-primary pull-right">
									<i class="fa fa-check-square-o" aria-hidden="true"></i> 다음 단계</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section><!-- /.content -->
	</div>
<!-- 컨텐츠 끝  -->
<%@ include file="../../includes/footer.jsp"%>
