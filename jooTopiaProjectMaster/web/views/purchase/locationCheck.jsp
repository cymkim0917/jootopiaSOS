<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">

<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<script src="/jootopia/js/external/bootstrap.min.js"></script>

<link rel="stylesheet" href="/jootopia/css/user/common.css">
<style>
	.row > div{
		height : 500px;
	}
	.locationArea{
		background : rgba(205, 38, 21, 0.18);
		margin: 0 auto;
		width: 90%;
		height: 400px;
		margin-bottom : 20px;
	}
	.mapArea{
		width: 50%;
		height : 100%;
		display:inline-block;
	}
	.mapArea > img{
		width: 85%;
		height : 90%;
		margin: 4% 7%;
	}
	.locationExplain{
		position: relative;
		height : 100%;
		width: 50%;
		display : block;
		float:right
	}
	.locationExplain *{
		text-align: center;
	}
	.locationExplain h3, .locationExplain h4{
		font-weight: bold;
	}
	.locationExplain td, .locationExplain th{
		padding : 5px 25px;
	}
	.searchArea *{
		text-align:center;
	}
	.title{
		margin: 
	}
	.searchArea > h2{
		margin : 40px auto;
		margin-top: 70px;
		font-weight: bold;
	}
	#addressArea > input{
		width: 300px;
		margin : 0 auto;
	}
	#addressArea > input:nth-child(1){
		width: 200px;
		display : inline-block;
	}
	#addressArea > button{
		display : inline-block;
		background : rgb(53, 15, 15);
		color : rgb(241, 196, 15);
		width: 90px;
		height : 33px;
		border-radius: 5px;
		position: relative;
		top: -2px;
		font-weight: bold;
	}
	#addressArea > button:hover{
		color : rgb(53, 15, 15);
		background : rgb(241, 196, 15);
	}
</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<h2 class="title">용달 금액 산정</h2>
		<br>
		<div class="locationArea">
			<div class="mapArea">
				<img src="<%= request.getContextPath() %>/images/map.png"> 
			</div>
			<div class="locationExplain" >
			<br>
				<h3>주토피아 위치 안내</h3>
				<p>주소 : 서울특별시 강남구 역삼동 KH리사이클링</p>
				<br>
				<br>
				<h4>요금안내</h4>	
				<table align="center" border="1">
					<tr>
						<th>거리</th>
						<td>요금</td>						
					</tr>
					<tr>
						<td>10km이내</td>
						<td>무료</td>
					</tr>
					<tr>
						<td>15km이내</td>
						<td>10,000원</td>
					</tr>
					<tr>
						<td>20km이내</td>
						<td>20,000원</td>
					</tr>
					<tr>
						<td>30km이내</td>
						<td>30,000원</td>
					</tr>
				</table>		
				
			</div>
		</div>
		<br clear="both"> 
		<div class="row">
			<div class="col-sm-5">
				<div class="searchArea">
					<h2>주소 검색</h2>
					<div id="addressArea" align="center">
						<input type="text" name="postNum" value="우편번호를 검색해주세요" class="form-control" >
						<button onclick="#">검색</button><br><br><br>
						<input type="text" name="address1" size="35" placeholder="서울시 강남구 역삼동" class="form-control"><br>
						<input type="text" name="address2" size="35" placeholder="상세주소를 입력하세요" class="form-control"><br>
					</div>
					<div class="mapSearchResult">
					<Br><br>
						<h4><%-- loginUser.getNickName() --%><span>김채연</span> 고객님의 위치에서 주토피아까지 <br> 거리는 14.2km입니다.<br>
							<br> 매입기사 배송금액은 <%  %>10,000원 입니다.
						</h4>
					</div>
				</div>
				<!-- 지도 api를 연결해주세요 -->
			</div> 
			<div class="col-sm-7" >
				<img src="<%= request.getContextPath() %>/images/map.png" width="100%" height="100%">
			</div>
		</div>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='/jootopia/views/purchase/purchaseRequestForm.jsp'" class="jBtn">신청하기</button>
			<button onclick="location.href='/jootopia'" class="jBtn">취소하기</button>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>


