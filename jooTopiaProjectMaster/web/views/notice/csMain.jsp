<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<!-- <link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js"> -->
<link rel="stylesheet" href="/jootopia/css/user/common.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>JooTopia</title>
<style>


.bgstick {
  background-color: coral;
  
  height:200px;
 /*  width:2000px; */
  
}


.notice {
	text-align: center;
	align:center;
	
	padding: 50px;
}
.wrap {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -86px;
	margin-left: -89px;
	text-align: center;
}

.cateBtn {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 20px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	float:left;
}

.cateBtn:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}
	#cateBtnArea1{
		margin-left : 30%;
	}
	
	#cateBtnArea2{
		margin-left : 50%;
	}
	

	#cateBtnArea3{
		margin-left : 70%;
}

</style>


</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<br>
		<h1 align="center">고객센터</h1><br><br>
		
		 <div class = "bgstick" align="center">
			 
			
			<div class="notice">
				<div id="cateBtnArea1">
					<button class="cateBtn" onclick="location.href='<%=request.getContextPath()%>/selectList.do'">공지사항</button>
				</div>
				<div id="cateBtnArea2">
					<button class="cateBtn" onclick="location.href='<%=request.getContextPath()%>/selectReviewTotalList.do'">상품후기</button>
				</div>
				<div id="cateBtnArea3">
					<button class="cateBtn" onclick="location.href='<%=request.getContextPath()%>/selectFaqTotalList.do'">FAQ</button>
				</div>
			</div>
			
			
		</div>
		
	
		
		<br><br>
		<div class="csMain" align="center">
		<h1>고객 상담 응대 시간</h1>
		<h3>평일 : 7시~19시</h3>
		<br><br>
		<h3>이메일 : jootopia@gmail.com</h3>
		<h3>전화번호 : 02)3333 - 3333</h3>
		</div>
		


		
		
		
	</section>
	<br><br>
<%@ include file="/views/common/footer.jsp" %>

</body>
</html>