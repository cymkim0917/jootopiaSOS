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

<style>
	.checkboxgroup{
		margin-left:350px;
		margin-rignt:150px;
	}
	
	.newWriting{
		margin-left:1400px;
	}

</style>



<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	
	
	<section>
	<br>
		<h1 align="center">상품후기</h1>
		
		<br>
		
		<div class="container">
		
		
		  <!-- <h2>Hover Rows</h2>
		  <p>The .table-hover class enables a hover state on table rows:</p>   -->          
		  <table class="table table-hover">
		    <thead>
		      <tr>
		        <th>글번호</th>
		        <th>작성자</th>
		        <th>제목</th>
		        <th>평점</th>
		        <th>작성일</th>
		        <th>조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr onclick="location.href='/jootopia/views/notice/reviewWriteSceen.jsp'">
		        <td>9</td>
		        <td>Doe</td>
		        <td>잘 받았습니다.</td>
		        <td>3.0</td>
		        <td>2019.4.3</td>
		        <td>6</td>
		      </tr>
		      <tr onclick="location.href='/jootopia/views/notice/reviewWriteSceen.jsp'">
		        <td>8</td>
		        <td>Moe</td>
		        <td>잘 받았습니다.</td>
		        <td>3.5</td>
		        <td>2019.4.3</td>
		        <td>3</td>
		      </tr>
		      <tr onclick="location.href='/jootopia/views/notice/reviewWriteSceen.jsp'">
		        <td>7</td>
		        <td>Dooley</td>
		        <td>잘 받았습니다.</td>
		        <td>4.5</td>
		        <td>2019.4.3</td>
		        <td>2</td>
		      </tr>
		    </tbody>
		    
		    <tbody>
		      <tr onclick="location.href='/jootopia/views/notice/reviewWriteSceen.jsp'">
		        <td>6</td>
		        <td>Doe</td>
		        <td>잘 받았습니다.</td>
		        <td>2.5</td>
		        <td>2019.4.3</td>
		        <td>5</td>
		      </tr>
		      <tr onclick="location.href='/jootopia/views/notice/reviewWriteSceen.jsp'">
		        <td>5</td>
		        <td>Moe</td>
		        <td>잘 받았습니다.</td>
		        <td>3.0</td>
		        <td>2019.4.3</td>
		        <td>4</td>
		      </tr>
		      <tr onclick="location.href='/jootopia/views/notice/reviewWriteSceen.jsp'">
		        <td>4</td>
		        <td>Dooley</td>
		        <td>잘 받았습니다.</td>
		        <td>4.0</td>
		        <td>2019.4.3</td>
		        <td>7</td>
		      </tr>
		    </tbody>
		     
		    <tbody>
		      <tr onclick="location.href='/jootopia/views/notice/reviewWriteSceen.jsp'">
		        <td>3</td>
		        <td>Doe</td>
		        <td>잘 받았습니다.</td>
		        <td>4.0</td>
		        <td>2019.4.3</td>
		        <td>8</td>
		      </tr>
		      <tr onclick="location.href='/jootopia/views/notice/reviewWriteSceen.jsp'">
		        <td>2</td>
		        <td>Moe</td>
		        <td>잘 받았습니다.</td>
		        <td>4.0</td>
		        <td>2019.4.3</td>
		        <td>7</td>
		      </tr>
		      <tr onclick="location.href='/jootopia/views/notice/reviewWriteSceen.jsp'">
		        <td>1</td>
		        <td>Dooley</td>
		        <td>잘 받았습니다.</td>
		        <td>4.0</td>
		        <td>2019.4.3</td>
		        <td>5</td>
		      </tr>
		    </tbody>
		  </table>
		</div>
		<br>
		<div class="checkboxgroup">
		<input type="checkbox" name="chk_info" value="name">이름
		<input type="checkbox" name="chk_info" value="title" checked="checked">제목
		<input type="checkbox" name="chk_info" value="content">내용
		<input type="text">&nbsp;
		<button onclick="location.href='<%=request.getContextPath()%>/views/notice/reviewList.jsp'">검색</button>
		
		</div>
		
		
		
		
		<div class = "newWriting">
			
			
			<div class="notice">
			
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/reviewWrite.jsp'">글쓰기</button>
			
			</div>
			
			
		</div>
		
		
		
		
		
		
		
		
		
		
	
		<div class ="paging button" align="center">
			<button type="submit"><<</button>&nbsp;
			<button type="submit"><</button>&nbsp;
			<button type="submit">1</button>&nbsp;
			<button type="submit">2</button>&nbsp;
			<button type="submit">3</button>&nbsp;
			<button type="submit">4</button>&nbsp;
			<button type="submit">5</button>&nbsp;
			<button type="submit">></button>&nbsp;
			<button type="submit">>></button>
		</div>
	
	
	
	
		
	</section>
	
	<br><br>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>