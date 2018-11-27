<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<table class="table">
	<thead>
		<tr>
			<th>운전자</th>
			<th>동승인원</th>
			<th>금액</th>
			<th>등록일자</th>
			<th>진행상태</th>
			<th>처리버튼</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="match" items="${matchList}">
		<tr>
			<td>${match.userid}</td>
			<td>${match.cpnum}자리</td>
			<td><fmt:formatNumber value="${match.paysum}" pattern="#,####"/>원</td>
			<td>${match.matchDateStr}</td>
			<td>
			<c:choose>
				<c:when test="${match.progress eq 'WAIT' }">
					<span class="label label-warning">${match.progress.status}</span>
				</c:when>
				<c:when test="${match.progress eq 'CONFIRM' }">
					<span class="label label-primary">${match.progress.status}</span>
				</c:when>
				<c:when test="${match.progress eq 'COMPLETE' }">
					<span class="label label-success">${match.progress.status}</span>
				</c:when>
				<c:otherwise>
					<span class="label label-defatult">${match.progress.status}</span>
				</c:otherwise>			
			</c:choose></td>
			<td><c:choose>
				<c:when test="${match.progress eq 'WAIT' }">
					<button class="btn btn-primary btn-xs">수락하기</button>
				</c:when>
				<c:when test="${match.progress eq 'CONFIRM' }">
					<button class="btn btn-danger btn-xs">취소하기</button>
				</c:when>
				<c:when test="${match.progress eq 'COMPLETE' }">
					<button class="btn btn-success btn-xs">내역보기</button>
				</c:when>
				<c:otherwise>
				</c:otherwise>			
			</c:choose></td>
			
		</tr>
	</c:forEach>
	<c:if test="${empty matchList}">
		<tr>
			<td colspan="3"> 요청된 자료가 없습니다... </td>
		</tr>
	</c:if>
	</tbody>
	</table>