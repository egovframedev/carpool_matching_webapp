<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page session="false"%>
<%@ include file="../includes/header.jsp"%>
<!-- Content Wrapper. Containes page content -->
<div class="content-wrapper">
	<div class="col-sm-offset-1 col-sm-10">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				회원관리 <small>목록보기 </small>
			</h1>
			<ol class="breadcrumb">
				<li><a href=" <c:url value='/'/>"><i class="fa fa-home"></i>
						Home</a></li>
				<li><a href="<c:url value='/admin/member/list'/>">회원관리</a></li>
				<li class="active">목록보기</li>
			</ol>
		</section>
		<!-- Main content -->

		<div class="box-body">
			<div id="example1_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap">
				<div class="row">
					<div class="row">
						<div class="col-sm-6"></div>

						<div class="col-sm-6 text-right">
							<form action="list" method="get" class="navbar-form"
								style="padding: 10px 0px;">
								<input type="hidden" name="page" value="1" /> <input
									type="hidden" name="perPageNum" value="${cri.perPageNum}" />
								<div class="form-group">
									<select name="searchType" class="form-control"
										style="width: 140px;">
										<option value="n"
											<c:out value="${cri.searchType == null? 'selected' : ''}"/>>검색조건선택</option>
										<option value="id"
											<c:out value="${cri.searchType eq 'id'? 'selected' : ''}"/>>아이디</option>
										<option value="nm"
											<c:out value="${cri.searchType eq 'nm'? 'selected' : ''}"/>>이름</option>
										<option value="tel"
											<c:out value="${cri.searchType eq 'tel'? 'selected' : ''}"/>>전화번호</option>
										<option value="type"
											<c:out value="${cri.searchType eq 'type'? 'selected' : ''}"/>>회원타입</option>
										<option value="email"
											<c:out value="${cri.searchType eq 'email'? 'selected' : ''}"/>>이메일</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" name="keyword" id="inputKeyword"
										class="form-control" value="${cri.keyword}"
										placeholder="Search" style="width: 240px;">
								</div>
								<button type="submit" class="btn btn-warning" id="btnSearch" title="검색">
									<i class="fa fa-search"></i>
								</button>
								&nbsp;&nbsp;
							</form>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="example1"
							class="table table-bordered table-striped dataTable" role="grid"
							aria-describedby="example1_info">
							<thead>
								<tr role="row">
									<th style="width: 10%;">회원번호</th>
									<th style="width: 10%;">아이디</th>
									<th style="width: 10%;">이름</th>
									<th style="width: 10%;">성별</th>
									<th style="width: 10%;">전화번호</th>
									<th style="width: 10%;">회원 타입</th>
									<th style="width: 10%;">이메일</th>
									<th style="width: 10%;">이메일 인증</th>
									<th style="width: 10%;">가입일자</th>
									<th style="width: 10%;">사용여부</th>
									<th style="width: 3%;" colspan="3"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="member" items="${list}" varStatus="status">
									<form name="form${status.index }" action="" method="post">
										<input type="hidden" id="mno" name="mno" value="${member.mno}">
										<input type="hidden" id="userid" name="userid"
											value="${member.userid}">
									<tr role="row">
										<td>${member.mno}</td>
										<td>${member.userid}</td>
										<td>${member.name}</td>
										<td>${member.gender}</td>
										<td>${member.phone}</td>
										<td><select name="authority">
												<c:if test="${member.authority eq 'ROLE_DRIVER'}">
													<option value="ROLE_DRIVER">ROLE_DRIVER</option>
													<option value="ROLE_RIDER">ROLE_RIDER</option>
												</c:if>
												<c:if test="${member.authority eq 'ROLE_RIDER'}">
													<option value="ROLE_RIDER">ROLE_RIDER</option>
													<option value="ROLE_DRIVER">ROLE_DRIVER</option>
												</c:if>
										</select></td>
										<td>${member.email}</td>
										<td><select name="approval_status">
												<c:if test="${member.approval_status eq 'true'}">
													<option value="true">true</option>
													<option value="false">false</option>
												</c:if>
												<c:if test="${member.approval_status eq 'false'}">
													<option value="false">false</option>
													<option value="true">true</option>
												</c:if>
										</select></td>
										<td><fmt:formatDate value="${member.regdate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
												<td>${member.mstate }</td>
										<td><a onclick="modifyGo(form${status.index })" title="수정"> <i
												class="fa fa-pencil-square-o"></i></a></td>
										<td><a onclick="removeGo(form${status.index })" title="삭제"> <i
												class="fa fa-trash"></i></a></td>
										<td><a onclick=""><i class="fa fa-file-image-o" title="운전자서류인증"></i></a></td>
									</tr>
									</form>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="box-footer text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}"
									title="이전">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:if test="${pageMaker.cri.page == idx}"> class="active"</c:if>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}"
									title="다음">&raquo</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {	
		$("#btnSearch").on("click",	function(evt) {
			evt.preventDefault();
			console.log("btnSearch Click......");
			self.location = "list"
							+ '${pageMaker.makeQuery(1)}'
							+ '&searchType='
							+ $("select[name='searchType'] option:selected").val()
							+ "&keyword="
							+ $('#inputKeyword').val();
		});
	});
	
		//수정
		function modifyGo( formObj){
			var arr = [];
			var delConfirm = confirm('수정 하시겠습니까?');
			
			if (delConfirm) {
				$(".uploadedList li").each(function(index) {
					arr.push($(this).attr("data-src"));
				});
				if (arr.length > 0) {
					$.post("/deleteAllFiles", {
						files : arr
					}, function() {
						// 첨부 파일 삭제 처리.
					});
				}
				formObj.action= "modify";
				formObj.submit();
			}
			
		}
		
		//삭제
		function removeGo( formObj){
			var arr = [];
			var delConfirm = confirm('해당 게시글을 삭제합니까?');
			
			if (delConfirm) {
				$(".uploadedList li").each(function(index) {
					arr.push($(this).attr("data-src"));
				});
				if (arr.length > 0) {
					$.post("/deleteAllFiles", {
						files : arr
					}, function() {
						// 첨부 파일 삭제 처리.
					});
				}
				formObj.action= "delete";
				formObj.submit();
			}
		}
</script>

<%@ include file="../includes/footer.jsp"%>