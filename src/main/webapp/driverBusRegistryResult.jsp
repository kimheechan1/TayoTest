<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bus Register Result</title>
</head>
<body>


	<table>
	
		<tr>
			<td>ID</td>
			<td>${driver.d_id}</td>
		</tr>
		<tr>
			<td>BUS등록번호</td>
			<td>${bus.b_id}</td>
		</tr>
		<tr>
			<td colspan="2">접속합니다.</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="취소" onclick="location.href='driverLogging.jsp'">
			</td>
			<td>
				<input type="button" value="확인" onclick="알림통신화면으로 ㄱㄱ  location.href='뭐시기뭐시기'">
			</td>
		</tr>
	
	</table>


</body>
</html>