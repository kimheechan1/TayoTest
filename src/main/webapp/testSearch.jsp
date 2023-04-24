<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>TEST</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>

<style>
.liTit {
	list-style-type: none;
}
.nodeIds{
	display:none;
}
</style>

<body>
	<h1>목적지 검색</h1>
	<div>
		<form class="form-inline">
			<table>
				<tr>
					<td colspan="2" class="form-group"><input type="text"
						class="form-control" id="departure" placeholder="출발지를 입력하세요">
						<div class="dropdown">
							<ul class="" id="dprtSrchDropdown">
							</ul>
						</div></td>
				</tr>
				<tr>
					<td colspan="2" class="form-group"><input type="text"
						class="form-control" id="arrival" placeholder="도착지를 입력하세요">
						<div class="dropdown">
							<ul class="" id="arrvSrchDropdown">
							</ul>
						</div></td>
				</tr>
				<tr>
					<td><input type="reset" class="btn btn-secondary"
						value="다시쓰기"></td>
					<td><input type="button" id="srchBtn" disabled class="btn btn-warning" value="정류장을 선택하세요"></td>
				</tr>
			</table>
		</form>
	</div>

	<div>
		<ul id="bookmarkList">
			<li class="liTit">자주 가는 곳(예시)</li>
			<li><a href="#">운천역</a></li>
			<li><a href="#">송정역</a></li>
			<li><a href="#">송정도서관</a></li>
		</ul>
		<ul id="recentSearch">
			<li class="liTit">최근 검색(예시)</li>
			<li><a href="#">송원대</a></li>
			<li><a href="#">송원고</a></li>
			<li><a href="#">문화전당</a></li>
		</ul>
	</div>

	<script>
	// TODO : geolocation / fav / recent
	// 검색 버튼 클릭시 전송용
	let dprtNodeId = "";
	let arrvNodeId = "";
	let dprtName ="";
	let arrvName ="";
	
	// 출발 도착 다 입력됐는지 확인
	let dprtCheck = false;
	let arrvCheck = false;
			
		$(document).ready(function() {
			// 출발지 검색용!!!!!############################
			$("#departure").on("keyup", function() {
				
				// 타자 칠때마다 검색 비활성화
				$("#srchBtn").prop("disabled", "disabled");
				$("#srchBtn").attr("class", "btn btn-warning");
				$("#srchBtn").attr("value", "먼저입력하라고~!!");
				dprtCheck = false;
				
				let query = $(this).val();
	//			console.log(query);
				$.ajax({
					url : 'Search',
					data : {
						keyword : query
					},
					success : function(response) {
					//	let resultList = JSON.parse(response);
						if(response!=undefined || response!=null){
							//	console.log(response);
								for(let i = 0 ; i < response.length ; i++){
									$("#dprtSrchDropdown").append("<span type='button' class='dprtPick'>"
																	+response[i]['nodenm']+"</span>"
																	+"<p class='nodeIds'>"+response[i]['nodeid']+"</p>"
																	+"<br>");
								}
						}
					},
					error : function(xhr, status, error){
						console.log("안되는디==>" + error);
					}
				});
				// 새로운 입력시 전 검색 내용 리셋
				$("#dprtSrchDropdown").empty();
			});
			
			// 도착지 검색용!!!!!############################
			$("#arrival").on("keyup", function() {

				// 타자 칠때마다 검색 비활성화
				$("#srchBtn").prop("disabled", "disabled");
				$("#srchBtn").attr("class", "btn btn-warning");
				$("#srchBtn").attr("value", "먼저입력하라고~!!");
				arrvCheck = false;
				
				let query = $(this).val();
				$.ajax({
					url : 'Search',
					data : {
						keyword : query
					},
					success : function(response) {
						if(response!=undefined || response!=null){
								for(let i = 0 ; i < response.length ; i++){
									$("#arrvSrchDropdown").append("<span type='button' class='arrvPick'>"
																	+response[i]['nodenm']+"</span>"
																	+"<p class='nodeIds'>"+response[i]['nodeid']+"</p>"
																	+"<br>");
								}
						}
					},
					error : function(xhr, status, error){
						console.log("안되는디==>" + error);
					}
				});
				$("#arrvSrchDropdown").empty();
			});
			
		});
		// AJAX 끝 ##############################################	
	
		// 드랍다운 보이기
		$(".form-control").on("focusin", function(){
					$(".dropdown").show();
		});
		// 출발지 선택용 (선택완료 후 드랍다운 숨김) -> 나중에 리팩터링 할것
		$("#dprtSrchDropdown").on("click", "span", function(){
	//		console.log("clicked");
			let picked = $(this).text();
			$("#departure").val(picked);
			$("#dprtSrchDropdown").hide();
			// 검색용 정류장 id, 이름 저장 (id = deprecated, same below)
			dprtNodeId = $(this).next().text();
			dprtName = picked;
	//		console.log($("#departure").val());
			// 검색 버튼 활성
			dprtCheck = true;
			if(dprtCheck && arrvCheck){
				$("#srchBtn").removeAttr("disabled");
				$("#srchBtn").attr("value", "검색ㄱㄱ");
				$("#srchBtn").attr("class", "btn btn-success");
			}
		});
		// 도착지 선택용 (선택완료 후 드랍다운 숨김) -> SAME
		$("#arrvSrchDropdown").on("click", "span", function(){
	//		console.log("clicked");
			let picked = $(this).text();
			$("#arrival").val(picked);
			$("#arrvSrchDropdown").hide();
			// 검색용 정류장id 저장
			arrvNodeId = $(this).next().text();
			arrvName = picked;
	//		console.log(arrvNodeId);
	//		console.log($("#arrival").val());
			// 검색 버튼 활성
			arrvCheck = true;
			if(dprtCheck && arrvCheck){
				$("#srchBtn").removeAttr("disabled");
				$("#srchBtn").attr("value", "검색ㄱㄱ");
				$("#srchBtn").attr("class", "btn btn-success");
			}
		});
		
		let responses = []; // get the largest scope!!!!!!!!
		// 대망으 검섁버튼
		$("#srchBtn").on("click", function(){
			// alert("ㅎㅇㅇ");
			// 먼저 출발지 도착지 둘다 경유하는 노선 cross reference
			// callback hell 방지, response 2개 동시에 받기
			let requests = [];
			
			$.ajax({
				// 두방향 같은이름 정류소
				url : 'Search2',
				method : 'post',
				data : {dprtnm : dprtName, arrvnm : arrvName},
				success : function(results){
			//		console.log(results);
					let resArr = results.replace("[","").replace("]","").split(", ");
					// TODO
			//		console.log(resArr);
					// 4개 정류소 조회
					$.ajax({
						url : 'https://apis.data.go.kr/1613000/BusSttnInfoInqireService/getSttnThrghRouteList?serviceKey=38f8K%2FBb5kAAAS2jyZzjrfRmzjxFBS5HL6L256P5vOJ0ESqz2F7hUMTo%2FuzPe%2F7cBNR%2BzspWLdUHQxd6SbsXcg%3D%3D&pageNo=1&numOfRows=100&_type=json&cityCode=24&nodeid='+resArr[0],
						success : function(rsp){
							console.log(rsp)
						},
						error : function(error){
							console.log(error);
						}
					});
					$.ajax({
						url : 'https://apis.data.go.kr/1613000/BusSttnInfoInqireService/getSttnThrghRouteList?serviceKey=38f8K%2FBb5kAAAS2jyZzjrfRmzjxFBS5HL6L256P5vOJ0ESqz2F7hUMTo%2FuzPe%2F7cBNR%2BzspWLdUHQxd6SbsXcg%3D%3D&pageNo=1&numOfRows=100&_type=json&cityCode=24&nodeid='+resArr[1],
						success : function(rsp){
							console.log(rsp)
						},
						error : function(error){
							console.log(error);
						}
					});
					$.ajax({
						url : 'https://apis.data.go.kr/1613000/BusSttnInfoInqireService/getSttnThrghRouteList?serviceKey=38f8K%2FBb5kAAAS2jyZzjrfRmzjxFBS5HL6L256P5vOJ0ESqz2F7hUMTo%2FuzPe%2F7cBNR%2BzspWLdUHQxd6SbsXcg%3D%3D&pageNo=1&numOfRows=100&_type=json&cityCode=24&nodeid='+resArr[2],
						success : function(rsp){
							console.log(rsp)
						},
						error : function(error){
							console.log(error);
						}
					});
					$.ajax({
						url : 'https://apis.data.go.kr/1613000/BusSttnInfoInqireService/getSttnThrghRouteList?serviceKey=38f8K%2FBb5kAAAS2jyZzjrfRmzjxFBS5HL6L256P5vOJ0ESqz2F7hUMTo%2FuzPe%2F7cBNR%2BzspWLdUHQxd6SbsXcg%3D%3D&pageNo=1&numOfRows=100&_type=json&cityCode=24&nodeid='+resArr[3],
						success : function(rsp){
							console.log(rsp)
						},
						error : function(error){
							console.log(error);
						}
					});   
					// 알고리즘 보류.... 위에서 브루트포스로 하는걸로 
		/*			for(let i = 0 ; i < resArr.length ; i++){
						requests.push($.ajax('https://apis.data.go.kr/1613000/BusSttnInfoInqireService/getSttnThrghRouteList?serviceKey=38f8K%2FBb5kAAAS2jyZzjrfRmzjxFBS5HL6L256P5vOJ0ESqz2F7hUMTo%2FuzPe%2F7cBNR%2BzspWLdUHQxd6SbsXcg%3D%3D&pageNo=1&numOfRows=100&_type=json&cityCode=24&nodeid='+resArr[i]));
					}
					// 리스폰스 리스트 받기
					$.when.apply($, requests).done(function(){
						for(let j = 0 ; j < arguments.length ; j++){
							console.log(arguments.length);
						//	console.log(arguments[j][0]);
							for(let k = 0 ; k < 50 ; k++){
								responses.push(arguments[j][0]);
								console.log(arguments[j][0].response.body.items.item[k].routeid);
							}
						//	console.log("end of index" + j)
						}
						
						console.log(responses);
					}).fail(function(error){
						console.log("route list 받기 실패" + error);
					});    */
				},
				error : function(xhr, status, error){
					console.log("정류장검색(중복제거용)실패"+error);
				} 
			});
		});
		
	</script>
</body>
</html>