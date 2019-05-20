<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.board.model.vo.* , java.util.*"%>
    
<%
Board b = (Board) request.getAttribute("b");
ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
Attachment titleImg = fileList.get(0);
Attachment titleImg1 = fileList.get(1);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>JooTopia</title>

<style>
	<!--게시판 형식 -->
	/* .containaer{
	margin-left:250px;
	margin-right:150px;

	width:1000px;
	height:800px;
	}

	.table-bordered tr th{
	 background-color:lightgray;
	 width:80px;
	
	} */
	<!--게시판 형식 -->
	
	<style>
	.outer{
		width:1000px;
		height:650px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	.detail td {
		text-align:center;
		width:1000px;
		border:1px solid white;
	}
	#titleImgArea {
		width:500px;
		height:300px;
		margin:0 auto;
	}
	#contentArea {
		height:30px;
	}
	.detailImgArea {
		width:250px;
		height:210px;
		margin:0 auto;
	}
	#titleImg {
		width:500px;
		height:300px;
	}
	.detailImg {
		width:250px;
		height:180px;
	}
	

</style>


</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	
	
	<section>
		<h1 align="center">상품 후기</h1>
		
		<div class="outer">
		<table class="detail" align="center">
			<tr>
				<td width="50">제목</td>
				<td colspan="5"><label><%=b.getbTitle() %></label></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><label><%=b.getuNo() %></label></td>
				<td>조회수</td>
				<td><label><%=b.getbCount() %></label></td>
				<td>작성일</td>
				<td><label><%=b.getbDate() %></label></td>
			</tr>
			<tr>
				<td>대표사진</td>
				<td colspan="4">
					<div id="titleImg" align="center">
						<img id="titleImg"
							src="<%=request.getContextPath() %>/images_upload/<%=titleImg.getChangeName() %>"/>
					</div>
				</td>
				<%-- <td>
					<button onclick="location.href='<%=request.getContextPath()%>/download.tn?num=<%=titleImg.getFid()%>'">다운로드</button>
				</td> --%>
			</tr>
			<tr>
				<td>사진메모</td>
				<td colspan="6">
					<p id="contentArea"><%=b.getbContent() %></p>
				</td>
			</tr>
		</table>
		<table class="detail">
			<tr>
				<td>
					<div class="detailImgArea">
						<img id="detailImg1" class="detailImg"
						src="<%=request.getContextPath()%>/images_upload/<%=detailImg1.getChangeName()%>"/>
						<!-- <button>다운로드</button> -->
					</div>
				</td>
				<td>
					<div class="detailImgArea">
						<img id="detailImg2" class="detailImg"
						src="<%=request.getContextPath()%>/images_upload/<%=detailImg2.getChangeName()%>"/>
						<!-- <button>다운로드</button> -->
					</div>
				</td>
				
			</tr>
		</table>
	</div>
		
		
		
		
		<%-- <%-- <br>
		<div class="containaer" align="center">
			<table class="table table-bordered">
				<thead>
					
				</thead>
				
				<tbody>
					<tr>
						<th>제목</th>
						<td>제목입니다.</td>
						<!-- <td><input type="text" placeholder="제목을 입력하세요" name="subject" style="width:900px;"></td> -->
					</tr>
					
					<tr>
						<th>내용</th>
						<!-- <td><textArea cols="10" placeholder="내용을 입력하세요" name="content" style="width:1000px; height:500px"></textArea></td> -->
						<td height="500px">내용입니다.</td>
						
					</tr>
					
					<tr>
						<th>첨부파일</th>
							<td>
								<!--input box-->
									<!-- <input type="text" class="upload_text" readonly="readonly"> -->
									<!--button-->
									<!-- <div class="upload-btn_wrap">
									  <button type="button" title="파일찾기">
									   <span>파일찾기</span>  
									  </button> -->
									  
									  
									  <!-- <input type="file" class="input_file" title="파일찾기"> -->
									</div>
							</td>
						
						<!-- <td><input type="text" placeholder="파일을 선택하세요" name="filename"></td> -->
					</tr>
					
					
				</tbody>
			
			</table>
			<div class="starRev" align="center">
						  <span class="starR on">별1</span>
						  <span class="starR">별2</span>
						  <span class="starR">별3</span>
						  <span class="starR">별4</span>
						  <span class="starR">별5</span>
						  <!-- <span class="starR">별6</span>
						  <span class="starR">별7</span>
						  <span class="starR">별8</span>
						  <span class="starR">별9</span>
						  <span class="starR">별10</span> -->
						</div>
					 	<% 
					 	$('.starRev span').click(function(){
					 		  $(this).parent().children('span').removeClass('on');
					 		  $(this).addClass('on').prevAll('span').addClass('on');
					 		  return false;
					 		});
					 	
					 	
					 	
					 	%> --%> 
					 	<br><br>
					 	
					 	
		<div class="notice">
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/reviewList.jsp'">목록</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/reviewWrite.jsp'">수정</button>
			<%-- <button onclick="location.href='<%=request.getContextPath()%>/'">삭제</button> --%>
			<button onclick="review_delete();">삭제</button>
			
			
			
			
			
		<script>
		
		function review_delete(){
			alert("게시물을 삭제하시겠습니까?");
		}
		
		
		</script>
			
			</div>
		</div>	
		
		
		
		
		
			
			
			
			
			<!-- <br>
			<h1 align="center">상품 후기</h1>
			
			<div class = "writeArea" align="center">
				<div id = "title">
				
					<b>제목 : </b>
					<input type="text" name="title" size=20 maxlength=10 value="제목을 입력하세요">
					
					<label>제목</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" align="center"  value="제목을 입력하세요" MAXLENGTH=200 >
				
				</div>
			
			</div> -->
			
			
			
			
	<br><br>

	
	
	
	
	
	
		
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>