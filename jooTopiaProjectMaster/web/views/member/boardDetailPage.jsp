<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>   
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
	
	#answerBtn{
		width:45px;
		background-color: white;
		border: 1px solid black;;
		color:black;
		padding: 7px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 10px;
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
	
	#answerTable{
		text-align:center;
	}
	
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<%
		Date date = new Date();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String toDay = format.format(date);
	%>
	<section>
		<div class="row">
		<h1>1:1문의</h1>
		<br /><br />
			<div class="col-sm-3"></div>

			<div class="col-sm-6">
				<form action="<%= request.getContextPath()%>/insertQues.do"	id="insertForm"  encType="multipart/form-data" method="post">
				<table class="table">
					<tr>
						<td><label for="">아이디</label></td>
						<td>
							<% if(loginUser != null){ %> <%= loginUser.getUserId() %> <% } %>
						</td>
						<td><label for="">작성일자</label></td>
						<td>
							<p name="writeDate" style="font-weight: bold;"><%= toDay %></p>
						</td>
					</tr>

					<tr>
						<td><label for="">제목</label></td>
						<td colspan="3" width="200"><input type="text" name="title" /></td>
					</tr>
					<tr>
						<td rowspan="2"><label for="">내용</label><br /></td>
						<td colspan="4"><textarea name="content" id="" cols="80"
								rows="5" style="resize: none;"></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><label for="">첨부 파일</label></td>
					</tr>

					<tr>	
						<td> &nbsp; &nbsp;&nbsp;</td>					
						<td colspan="2">
						
								<img id="QaAImg1" width="120" height="100"> &nbsp;
							
						 	
								<img id="QaAImg2" width="120" height="100">
					
						</td>				
					</tr>
				</table>
				<div id="fileArea">
				<!-- 파일 요소를 같이 넘겨줌  this는 파일이 된다.-->
				<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)">
				<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2)">
			</div>
				</form>
			</div>

			<div class="col-sm-3"></div>
		</div>
		<div align="center">
			<div class="btnArea" id="btnArea">
				<a onclick="insertQaA()" id="modifyBtn">수정</a>
				<a onclick="delQaA()" id="delBtn">삭제</a>						
			</div>	
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>

	<script>
		function insertQaA(){
			$("#insertForm").submit();
		}
	
		function delQaA(){
			var answer = window.confirm("해당 1:1문의를 삭제하시겠습니까? ");
			
			if(answer == true){
				location.href="deleteQaAPage.jsp";	
			}else{
				alert("잘 선택하셨어요~");
			}
		}

		$(function(){
			
			//파일 이름 나온 영역 숨기기
			$("#fileArea").hide();
			
			$("#QaAImg1").click(function(){
				$("#thumbnailImg1").click();
			});
			
			$("#QaAImg2").click(function(){
				$("#thumbnailImg2").click();
			});
		})	


		function loadImg(value,num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1 :
							$("#QaAImg1").attr("src",e.target.result);
							console.log(e.target.result);
							break;
					case 2 :
							$("#QaAImg2").attr("src",e.target.result);
							break;
					}
				}
			}
			reader.readAsDataURL(value.files[0]);
			}
		
	</script>
</body>
</html>