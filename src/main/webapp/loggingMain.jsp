<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body style="align: center">
	<h1>승객 로그인</h1>
	<div id="psngrLogWrapper">

		<form action="PLogin" method="post">
			<table>
				<tr>
					<td colspan="2"><input type="text" name="p_id"
						placeholder="ID입력"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="p_pw"
						placeholder="PW입력"></td>
				</tr>
				<tr>
					<td><input type="reset" value="취소"></td>
					<td><input type="submit" value="로그인"></td>
				</tr>
				<tr>
					<td colspan="2"><input id="passengerJoin" type="button" value="회원가입"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="ID와 PW찾기" onclick="아이디비번찾기페이지로">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<hr>

	<div id="forDrivers">

		<a href="driverLogging.jsp">기사님으로 로그인!</a>

	</div>


<script>
	$('#passengerJoin').on("click", ()=>{
		$.ajax({
			url: 'SignUp',
			type: 'POST',
			data: {ident:'isPassenger'},
			success: function(response){
				window.location.href=response; // redirecting to the signup sheet
			},
			error: function(xhr, status, error){
				console.log("ERROR: " + error);
			}
		});
	});


</script>
</body>
</html>