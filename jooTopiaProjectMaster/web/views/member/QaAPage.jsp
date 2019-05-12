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
	<section>
		<div class="row">
		<h1>1:1문의</h1>
		<br /><br />
			<div class="col-sm-3"></div>
			
			<div class="col-sm-6">
			<table class="table">
				<tr>
					<td><label for="">아이디</label></td>
					<td>so3o02</td>
					<td><label for="">작성일자</label></td>
					<td>2018-02-03</td>
				</tr>
			
				<tr>
					<td><label for="">제목</label></td>
					<td colspan="3">저 궁금한 게 있는데용;ㅋ</td>
				</tr>
				<tr>
					<td rowspan="2"><label for="">내용</label><br /></td>
					<td colspan="4">
						<textarea name="content" id="" cols="80" rows="5"
						style="resize:none;" readonly
						></textarea>
					</td>
				</tr>
			</table>
			
			
			<div id="answerArea">
				
					<table id="answerTable" class="table">
						<tr>
							<td rowspan="2">
							<p id="answerBtn">답변</p><br /><br />
							</td>
							<td colspan="4">
									<textarea name="content" id="" cols="80" rows="3"
									style="resize:none; " readonly>
									</textarea>
							</td>
						</tr>
					</table>
				</div>
			</div>				
		
			<div class="col-sm-3"></div>
		</div>
		<div align="center">
			<div class="btnArea" id="btnArea">
				<a href="modifyQaAPage.jsp" id="modifyBtn">수정</a>
				<a onclick="delQaA()" id="delBtn">삭제</a>						
			</div>	
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>

	<script>
		function delQaA(){
			var answer = window.confirm("해당 1:1문의를 삭제하시겠습니까? ");
			
			if(answer == true){
				location.href="deleteQaAPage.jsp";	
			}else{
				alert("잘 선택하셨어요~");
			}
		}
	</script>
</body>
</html>