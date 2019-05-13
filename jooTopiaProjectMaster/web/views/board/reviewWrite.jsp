<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.notice{
		/* margin-left:1400px; */
		text-align: center;
	}
	

	.containaer{
	margin-left:150px;
	margin-right:150px;
	}


</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<h1 align="center">상품 후기</h1>
		<br>
		<div class="containaer" align="center">
			<table class="table table-bordered">
				<thead>
					
				</thead>
				
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" placeholder="제목을 입력하세요" name="subject" style="width:900px;"></td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td><textArea cols="10" placeholder="내용을 입력하세요" name="content" style="width:1000px; height:500px"></textArea></td>
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
									  
									  
									  <input type="file" class="input_file" title="파일찾기">
									</div>
							</td>
							
						
						
						
						
						
						
						<!-- <td><input type="text" placeholder="파일을 선택하세요" name="filename"></td> -->
					</tr>
					
					
					
				
				</tbody>
			
			</table>
			
			
			
		
		
		</div>	
		
		
		<!-- <div class ="newWriting" align="center">
			<button type="submit">글쓰기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit">취소</button>
		
		</div> -->
			
			
			
				
		<div class = "newWriting">
			
			
			<div class="notice">
			
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/reviewList.jsp'">글쓰기</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/reviewList.jsp'">취소</button>
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