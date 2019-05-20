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
	.outer {
		width:1000px;
		height:750px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table {
		border:1px solid white;
	}
	.insertArea {
		width:500px;
		height:550px;
		margin:0 auto;
	}
	.btnArea {
		width:250px;
		margin:0 auto;
	}
	#titleImgArea {
		width:300px;
		height:250px;
		border:2px dashed darkgray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
	}
	#contentImgArea1, #contentImgArea2, #contentImgArea3 {
		width:150px;
		height:100px;
		border:2px dashed darkgray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
	}
	#titleImgArea:hover, #contentImgArea1:hover,
	#contentImgArea2:hover, #contentImgArea3:hover {
		cursor:pointer;
	}
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	
	<% if(loginUser != null){ %>
	<div class="outer"> 	
		<br>
		<h2 align="center">사진게시판 작성</h2>
		<form action="<%=request.getContextPath() %>/insert.tn" method="post"
			encType="multipart/form-data">
			<!-- encType을 설정해야 파일을 폼에서 보낼 수 있다 -->
			<div class="insertArea">
				<table align="center">
					<tr>
						<td width="100px">제목</td>
						<td colspan="3">
							<input type="text" size="45" name="title">
						</td>
					</tr>
					<tr>
						<td>대표이미지</td>
						<td colspan="3">
							<div id="titleImgArea">
								<img id="titleImg" width="350" height="200">
							</div>
						</td>
					</tr>
					<tr>
						<td>내용사진</td>
						<td>
							<div id="contentImgArea1">
								<img id="contentImg1" width="120" height="100">
							</div>
						</td>
						<td>
							<div id="contentImgArea2">
								<img id="contentImg2" width="120" height="100">
							</div>
						</td>
						<td>
							<div id="contentImgArea3">
								<img id="contentImg3" width="120" height="100">
							</div>
						</td>
					</tr>
					<tr>
						<td>사진 메모</td>
						<td colspan="3">
							<textarea name="content" rows="5" cols="50" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div id="fileArea">
				<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1);">
				<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2);">
				<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this,3);">
				<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this,4);">
			</div>
			<br>
			<div class="btnArea">
				<button type="reset">취소하기</button>
				<button type="submit">작성하기</button>
			</div>
		</form>
	</div>
	<script>
		$(function(){
			$("#fileArea").hide();
			
			$("#titleImgArea").click(function(){
				$("#thumbnailImg1").click();
			});
			$("#contentImgArea1").click(function(){
				$("#thumbnailImg2").click();
			});
			$("#contentImgArea2").click(function(){
				$("#thumbnailImg3").click();
			});
			$("#contentImgArea3").click(function(){
				$("#thumbnailImg4").click();
			});
		});
		
		
		function loadImg(value,num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1:
						$("#titleImg").attr("src",e.target.result);
						break;
					case 2:
						$("#contentImg1").attr("src",e.target.result);
						break;
					case 3:
						$("#contentImg2").attr("src",e.target.result);
						break;
					case 4:
						$("#contentImg3").attr("src",e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		};
	</script>
	
	<% }else {
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다!");
		request
			.getRequestDispatcher("../common/errorPage.jsp")
			.forward(request, response);
	} %>
	
	
		
		
		
		
		
		
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>