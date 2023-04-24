<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>routeApiCrawler</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<style>


input {
	vertical-align: middle;
	font-size: 2rem;
	color: green;
	font-family: cursive;
		background-color: pink;
	display: block;
	width: 400px;
	height: 150px;
	border: 2px dashed green;
	border-radius:20%;
}
</style>

<body>
		<div>
			<input id="bpb" type="button" value="BIG PINK BUTTON">
		</div>
	
	<div id="result">
	
	</div>
	
	
	<script>
	let rowsInserted = 0;
		$(document).ready(function(){
			$("#bpb").on("mouseenter", ()=>{
				$("#bpb").css("background-color", "salmon");
			});
			
			$("#bpb").on("mouseout", ()=>{
				$("#bpb").css("background-color", "pink");
			});
			
			$("#bpb").on("mousedown", ()=>{
				$("#bpb").css("background-color", "tomato");
			});
			// CRAWL START SIGNAL
			$("#bpb").on("click", ()=>{
				$.ajax({
					url:'https://apis.data.go.kr/1613000/BusRouteInfoInqireService/getRouteNoList?serviceKey=38f8K%2FBb5kAAAS2jyZzjrfRmzjxFBS5HL6L256P5vOJ0ESqz2F7hUMTo%2FuzPe%2F7cBNR%2BzspWLdUHQxd6SbsXcg%3D%3D&pageNo=1&numOfRows=5000&_type=json&cityCode=24',
					success:function(resp){
						$.ajax({
							url:'Crawl',
							type:'POST',
							contentType:'application/json; charset=UTF-8',
							data:JSON.stringify(resp),
							success:function(response){
								console.log("json sent successfully");
					/*			if(parseInt(response)>0){
									rowsInserted += parseInt(response);
									$("#result").empty();
									$("#result").html("입력 완료 : " + rowsInserted);
								}	*/
							},
							error:function(xhr, status, error){
								console.log("json was not sent");
							}
						});
					},
					error:function(xhr, status, error){
						console.log("arrrrgh!! : "+error);
					}
				});
			});
		});
	</script>

</body>
</html>