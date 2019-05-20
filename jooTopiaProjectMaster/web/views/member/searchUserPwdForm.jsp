<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
</head>
<body>
	<div align="center">
		<br /> <br /> <br /> <br /> <br />
		<h1>비밀번호 찾기</h1>
		<p>회원님의 이름과 이메일을 적어주세요.</p>
		<table id="searchTable">

			<tr>
				<td>이름</td>
				<td><input type="text" id="userName" /></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userId" /></td>
			</tr>
			<tr>
				<td>이메일</td>

				<td><input type="email" id="email" /></td>
			</tr>
			<tr>
				<td>인증번호 :</td>
				<td><input type="text" id="writerNum" value="" /> <input
					type="hidden" id="reqNums2" value="" /></td>
			</tr>
		</table>

	</div>
	<br />
	<br />
	<div id="btnArea">
		<input type="button" value="확인" id="submitBtn" /><br /> <input
			type="button" value="확인" id="reqBtn" onclick="getUserPwd()" />
	</div>

	<script>
			var getData;
			$(function(){
				$("#writerNum").hide();
				$("#reqNums2").hide();
				$("#reqBtn").hide();
			})
			$("#submitBtn").click(function(){			
				if($('#userName').val().replace(/\s/g,"").length == 0 
						|| $('#email').val().replace(/\s/g,"").length == 0 ){
					alert("회원님의 정보를 입력해주세요.");
				}else{
				var userName = $("#userName").val();
				var email = $("#email").val();
				console.log(userName);
				console.log(email);
				$("#writerNum").show();
				$("#reqBtn").show();
				$("#submitBtn").hide();
				$.ajax({
					url:"<%=request.getContextPath()%>/searchId.do",
											type : "post",
											data : {
												userName : userName,
												email : email
											},
											success : function(data) {

												getData = data;
												$("#reqNums2").val(getData);
											},
											error : function() {
												console.log("실패");
											}
										});
							}
						});
			
			function getUserPwd(){
				var reqNum = $("#reqNums2").val();
				var writerNum = $("#writerNum").val();
				var userName =$('#userName').val();
				var email =$('#email').val();
				var userId = $('#userId').val();
				
				if(writerNum == reqNum){
					$.ajax({
						url:"<%=request.getContextPath()%>/issuPwd.do",
						type : "post",
						data : {
							userName : userName,
							email : email,
							userId : userId
						},
						success : function(data) {
							alert('비밀번호를 재발급했습니다.이메일을 확인해주세요!');
						},
						error : function() {
							console.log("실패");
							}
						});
					}
				}
		
	</script>
</body>
</html>