<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
<style>

	div>h1{
		text-align:center;
		font-weight:bold;
	}
	
	#modifyBtn{
		width:100px;
		background-color: #FFBB00;
		
	   border: none;
	   color:#fff;
	   padding: 15px 0;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 15px;
	   margin: 4px;
	   cursor: pointer;
	   border-radius:10px;
	}
	
	#delBtn{
		width:100px;
		background-color: #7A7A7A;
		border: none;
		color:#fff;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
	}
	#orderBtn{
		width:200px;
		background-color: white;
		border: 1px solid black;
		color:black;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
		
	}	
	<!-- -->
	#btnArea{
		text-align:center;
	}
	
	#tempBtnArea{
		text-align:center;
		top:120px;
	}
	
	#tempBtnArea{
		width:250px;
		top:0;
		left:0;
		background:rgb(53, 15, 15); 
		 margin: 0 auto;
		height:100vh;
		z-index:9999;
		
	}
	
	
	#myTable{
		text-align:center;
		align:center;
		position:relative;
		left:80px; 
		
	}
</style>
</head>
<body>
<%@ include file="../common/navigation.jsp" %>
<%@ include file="/views/member/temp.jsp" %>
	<section>
		<div class="row">
			
			<div class="col-sm-7" id="myTable">
			<br /><br />
			<h1>회원 정보</h1><br />
			<br />
			<% if(loginUser != null) { %>
				<table class="table">
					<tr>
						<td><label for="">아이디</label></td>
						<td><label for=""><%= loginUser.getUserId() %></label></td>
					</tr>
					<tr>
						<td><label for="">이름</label></td>
						<td><label for=""><%= loginUser.getUserName() %></label></td>
					</tr>
					<tr>
						<td><label for="">생년월일</label></td>
						<td><label for=""><%= loginUser.getUserDate() %></label></td>
					</tr>
					<tr>
						<td><label for="">핸드폰 번호</label></td>
						<td><label for=""><%= loginUser.getPhone() %></label></td>
					</tr>
					<tr>
						<td><label for="">주소</label></td>
						<td><label for="">서울시 성동구</label></td>
						
					</tr>
					<tr>
						<td><label for="">이메일</label></td>
						<td><label for=""><%= loginUser.getEmail() %></label></td>
					</tr>
					<tr>
						<td> </td>
						<td> </td>
					</tr>					
				</table>			
				<% } %>
				<div class="btnArea" id="btnArea">
					<p onclick="checkModify();" id="modifyBtn">수정</p>					
					<a href="passwordCheckPage2.jsp" id="delBtn">삭제</a><br />
				
				</div>
				
			</div>
			<div class="col-sm-2"></div>
		</div>
	</section>
	
	<script>
		function checkModify(){
			var join_type = <%= loginUser.getJoinType() %>;
			
			if(join_type == 2){
				location.href='modifyUserInfoPage.jsp';
			}else{
				location.href='passwordCheckPage.jsp'
			}
		}	
	</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>