<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SIGN UP : UNIVERSAL</title>
</head>
<body>

	<div id="signupWrapper">

		<form action="SignupSubmit" method="post">
			<table>

				<tr>
					<td>아이디</td>
					<td>
						<input type="text" value="ID입력">*
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" value="PW입력">*
					</td>
				</tr>
				<c:if test="${userCategory=='isPassenger'}">
					<tr>
						<td>전화번호</td>
						<td>
							<input type="text" value="전화번호 입력">
						</td>
					</tr>
				</c:if>
				
				<tr>
					<td>
						<input type="reset" value="다시쓰기">
					</td>
					<td>
						<input type="submit" value="가입">
					</td>
				</tr>
			</table>
		</form>
		<p>*는 필수입력</p>

	</div>

</body>
</html>