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
	
	#btnArea{
		text-align:center;
	}
	
	table{
		text-align:center;
	}
	
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h1>회원 정보</h1>
				<br /><br />
				<table class="table table-bordered">
					<tr>
						<td><label for="">아이디</label></td>
						<td><label for="">so3o02</label></td>
					</tr>
					<tr>
						<td><label for="">현재 비밀번호</label></td>
						<td><input type="password" name="orgPwd" /></td>
					</tr>
					<tr>
						<td><label for="">변경할 비밀번호</label></td>
						<td><input type="password" name="userPwd" /></td>
					</tr>
					<tr>
						<td><label for="">주소</label></td>
						<td><input type="text" name="address" /></td>
					</tr>
					<tr>
						<td><label for="">핸드폰 번호</label></td>
						<td><input type="tel" size="3" name="tel1"/>-<input type="tel" size="3" name="tel2"/>-
						<input type="tel" size="3" name="tel3"/> </td>
					</tr>
				</table>
					<div class="btnArea" id="btnArea">
					<a href="../main/MainPage.jsp" id="modifyBtn">수정 완료</a>
					<a onclick="delMember()" id="delBtn">탈퇴</a>
						
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>

	<script>
		function delMember(){
			var answer = window.confirm("정말 탈퇴하시겠습니까? ");
			
			if(answer == true){
				location.href="deleteMemberPage.jsp";
		
				
			}else{
				alert("잘 선택하셨어요~");
			}
		}
	</script>
</body>
</html>