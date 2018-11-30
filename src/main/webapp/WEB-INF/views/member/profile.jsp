<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>this is profile page!</h2>
	<table border="1">
		<tr>
			<td><input type="text" value="${memberlist.mno}" readonly="readonly"/></td>
		</tr>
		<tr>
			<td><input type="text" value="${memberlist.userid}" readonly="readonly"></td>
		</tr>
		<tr>
			<td><input type="text" value="${memberlist.name}" readonly="readonly"></td>
		</tr>
		<tr>
			<td><input type="text" value="${memberlist.email}" readonly="readonly"></td>
		</tr>
		<tr>
			<td><input type="text" value="${memberlist.phone}" ></td>
		</tr>
		<tr>
			<td><input type="text" value="${memberlist.gender}" ></td>
		</tr>
		<tr>
			<td><input type="text" value="${memberlist.birth}" ></td>
		</tr>
		
	</table>
</body>
</html>