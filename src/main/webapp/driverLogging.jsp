<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>
	<!--  FOR THE DRIVER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<c:if test="${empty driver}">
		<h1>기사님 로그인</h1>
		<div>
			<form action="Login" method="post">
				<table>
					<tr>
						<td colspan="2"><input type="text" placeholder="ID"
							name="d_id"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" placeholder="PW"
							name="d_pw"></td>
					</tr>
					<tr>
						<td><input type="reset" value="다시쓰기"></td>
						<td><input type="submit" value="로그인"></td>
					</tr>
				</table>
			</form>

			<form action="">
				<table>
					<tr>
						<td><input id="driverJoin" type="button" value="회원가입"></td>
						<td>
							<input type="button" value="뒤로가기" onclick="location.href='loggingMain.jsp'">
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="ID PW 찾기">
						</td>
					</tr>
				</table>
			</form>
		</div>

		<hr>
	</c:if>
	<c:if test="${!empty driver}">
	<h1>${driver.d_id} 기사님 환영합니다!</h1>
		<div>
			<form action="BusRegister" method="post">
				<table>
					<tr>
						<td>
							<input type="text" name="b_id" placeholder="버스고유번호입력">
						</td>
						<td>
							<input type="submit" value="GO">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="로그아웃" onclick="location.href='DriverLogout'">
						</td>
					</tr>
				</table>

			</form>
		</div>
	</c:if>


<script>

		$('#driverJoin').on("click", ()=>{
			$.ajax({
				url: 'SignUp',
				type: 'POST',
				data: {ident:'isDriver'},
				success: function(response){
					window.location.href=response; // to the signup sheet!!
				},
				error: function(xhr, status, error){
					console.log("ERROR: " + error);
				}
			});
		});
</script>

</body>
</html>