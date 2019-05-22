<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--  <%
	 import="java.util.*,com.kh.jooTopia.board.model.vo.*"
	HashMap<String,Object> list = (HashMap<String,Object>) request.getAttribute("list");
	ArrayList<Board> bList = (ArrayList<Board>) list.get("bList");
	ArrayList<Member> mList = (ArrayList<Member>) list.get("mList");
	ArrayList<Attachment> aList = (ArrayList<Attachment>) list.get("aList");
 %>  --%>  
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
		width:1100px;
		height:1100px;
		background:coral;
		color:black;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	.containaer{
	margin-left:15%;
	margin-right:150px;
	margin-top:50px;
	width:900px;
	height:800px;
	
	
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
		/* border:2px dashed darkgray; */
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
	#titleImgArea:hover, #contentImgArea11:hover,
	#contentImgArea2:hover, #contentImgArea3:hover {
		cursor:pointer;
	}
	
	
	<!-- 자가코딩 시작 -->
			
			
			
			
			
	<!-- 자가코딩 끝 -->
	
	
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	
	
	<div class="outer"> 	
		<br>
		<h2 align="center">후기</h2>
		<form action="<%=request.getContextPath() %>/insertReview.do" method="post"
			encType="multipart/form-data">
			<!-- encType을 설정해야 파일을 폼에서 보낼 수 있다 -->
			
			
			<!-- 자가코딩 시작 -->
			<div class = "container" align="center" style="width:900px";>
				<table class = "table table-bordered">
					<thead></thead>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" placeholder="제목을 입력하세요" name="title" style="width:700px;"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><input type="text" placeholder="내용을 입력하세요" name="content" style="width:700px; height:600px";></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>
								<div id="titleImgArea" style="float:left; margin-right:1%;" >
									<img id="titleImg1" width="120" height="100">
								</div>
								
								<div id="contentImgArea11">
									<img id="titleImg2" width="120" height="100">
								
								</div>
							</td>							
						</tr> 
						
					</tbody>
					
					<!-- <tbody>
						<tr>
							<th>첨부사진 1</th>
								<td>
									
									<div id="titleImgArea">
										<div id = "thumbnailImg1">
											<img id = titleImg width="300" height="150">
										</div>
									</div>
								</td>
							
							<th>첨부사진 2</th>
								<td>
									<div id="contentImgArea1">
										<div id="thumbnailImg2">
										 	<img id = titleImg width="150" height="75">
										</div>
									</div>
								</td>
						</tr>
					
					</tbody>
				 -->
				
				</table><tr></tr>
			
			</div>
			
			
			
			
			<!-- 자가코딩 끝 -->
			
			
			
			
			
			<!-- <div class="insertArea">
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
					
					</tr>
					<tr>
						<td>사진 메모</td>
						<td colspan="3">
							<textarea name="content" rows="5" cols="50" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
			</div> -->
			<div id="fileArea">
				<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)">
				<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2)">
				
			</div>
			<br>
			<div class="btnArea">
				<!-- <button type="reset">취소하기</button>
				<button type="submit">작성하기</button> -->
				
				<button onclick="location.href='<%=request.getContextPath()%>/selectReviewTotalList.do'">취소하기</button>
				<button onclick="location.href='<%=request.getContextPath()%>/insertReview.do'">작성하기</button>
				
			</div>
		</form>
	</div>
	<script>
		$(function(){
			$("#fileArea").hide();
			
			$("#titleImgArea").click(function(){
				$("#thumbnailImg1").click();
			});
			$("#contentImgArea11").click(function(){
				$("#thumbnailImg2").click();
			});
			
		});
		
		
		//----------여기부분 이해불가---------------//
		function loadImg(value,num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1:
						$("#titleImg1").attr("src",e.target.result);
						break;
					case 2:
						$("#titleImg2").attr("src",e.target.result);
						break;
				
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		};
	</script>
	
	<%-- <% }else {
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다!");
		request
			.getRequestDispatcher("../common/errorPage.jsp")
			.forward(request, response);
	} %>
	 --%>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>