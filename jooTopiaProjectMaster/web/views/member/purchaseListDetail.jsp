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
</head>
<style>
	div>h1{
		text-align:center;
		font-weight:bold;
	}
	
	table{
		text-align:center;
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
</style>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	<div class="row">
		<h1>매입 요청 내역 상세 페이지</h1>
		<br /><br />
		
		<div class="col-sm-2"></div>
		
		<!-- Img Div -->
		<div class="col-sm-2">			
			<table>
				<tr>
					<td rowspan="4">
					<img src="/jootopia/images/so.jpg" alt="" style="width:280px; heihgt:200px;"/>
					</td>
				</tr>
			</table>
			</div>

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
					<td colspan="3">소파 가져가주세용~ㅋ</td>
				</tr>
				<tr>
					<td rowspan="2"><label for="">내용</label><br /></td>
					<td colspan="4">
						<textarea name="content" id="" cols="80" rows="5"
						style="resize:none;" readonly
						>제 쇼파는 첨부파일 같이 생겼구요 어쩌구 저쩌구 우애애애애앵ㅇ~!!!
						돈 많이 줭 사 줭 나 용돈 줭!</textarea>
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
							style="resize:none; " readonly>거른댜
							</textarea>
						</td>
						</tr>
					</table>
				</div>
			</div>				
		
		
		
		<div class="col-sm-2"></div>
	</div>		
	
		<div align="center">
			<div class="btnArea" id="btnArea">
				<a href="purchaseStatusPage.jsp" id="modifyBtn">매입 상세조회</a>
				<a href="modifyPurchasePage.jsp" id="modifyBtn">수정</a>
				<a onclick="delPurchase()" id="delBtn">삭제</a>										
			</div>	
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>


</body>
</html>