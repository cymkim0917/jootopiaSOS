<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/common.css">
<link rel="stylesheet" href="/jootopia/css/user/header.css" type="text/css" >
<link rel="stylesheet" href="/jootopia/css/user/modal.css" type="text/css" >
<title>JooTopia</title>
</head>
<body>
			<div align="center">
				<br />
				<br />
				<br />
				<br />
				<br />
				<h1>아이디 찾기</h1>
				<p>회원님의 이름과 이메일을 적어주세요.</p>
				<table id="searchTable">
			
					<tr>
						<td>이름</td>
						<td><input type="text" id="userName" /></td>
					</tr>
					<tr>
						<td>이메일</td>

						<td><input type="email" id="email" /></td>
					</tr>
					<tr>
						<td>인증번호 : </td>
						<td><input type="text" id="writerNum" value="" />
							<input type="hidden" id="reqNums2" value="" />
						</td>
					</tr>
				</table>

			</div>
			<br /><br />
			<div id="btnArea">
				<input type="button" value="확인" id="submitBtn"/><br />
				<input type="button" value="확인" id="reqBtn" onclick="getUserId()"/>
			</div>


		<script>
			var getData;
			$(function(){
				$("#writerNum").hide();
				$("#reqNums2").hide();
				$("#reqBtn").hide();

				
			/* 	$("#writerNum").keyup(function(){
					 $("#reqNums").val($(this).val());
					 console.log("1 : " + $("#reqNums").val());
					 console.log("2 : " + $("#reqNums2").val());
					 console.log($("#reqNums").val() == $("#reqNums2").val());
				}) */
			})
			$("#submitBtn").click(function(){			
				if($('#userName').val().replace(/\s/g,"").length == 0 
						|| $('#email').val().replace(/\s/g,"").length == 0 ){
					alert("머해");
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
		
		function getUserId(){				
				var reqNum = $("#reqNums2").val();
				var writerNum = $("#writerNum").val();
				var userName =$('#userName').val();
				var email =$('#email').val();
				console.log('reqNum = ' + reqNum + ' / wirterNum = ' + writerNum);
				
				if(reqNum == writerNum){
					$.ajax({
						url:"<%= request.getContextPath() %>/returnUserId.do",
						type:"post",
						data:{
							userName : userName,
							email : email
						},
						success : function(data){
							alert('회원님의 아이디는 ' + data + '입니다.' + "\n 메인 페이지로 이동합니다.");
							location.href='index.jsp';
						}
					})
				}	
			}
		
		</script>
</body>
</html>