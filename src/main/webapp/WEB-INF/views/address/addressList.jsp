<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<table>
		<tr>
			<th>유저 ${login.mno} 의 주소</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.addr_type.type}</td>
				<td>${row.address1}</td>
				<td>${row.address2}</td>
				<td>${row.address3}</td>
			</tr>
		</c:forEach>
	</table>

</body>
