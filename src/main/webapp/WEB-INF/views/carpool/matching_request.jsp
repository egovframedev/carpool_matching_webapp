<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<table class="table">
	<thead>
		<tr>
			<th>동승제의자</th>
			<th>등록일자</th>
			<th>진행상태</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty matchList}">
		<tr>
			<td colspan="3"> 요청된 자료가 없습니다... </td>
		</tr>
	</c:if>
	</tbody>
	</table>