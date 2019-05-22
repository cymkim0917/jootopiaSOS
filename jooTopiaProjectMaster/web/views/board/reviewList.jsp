<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.jooTopia.board.model.vo.*"%>
    
<%

	HashMap<String,Object> list = (HashMap<String,Object>) request.getAttribute("list");
	ArrayList<Board> bList = (ArrayList<Board>) list.get("bList");
	ArrayList<Member> mList = (ArrayList<Member>) list.get("mList");
	ArrayList<Attachment> aList = (ArrayList<Attachment>) list.get("aList");
	

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

<style>

.outer {
		width:1200px;
		height:900px;
		background:coral; 
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	.thumbnailArea {
		width:760px;
		height:550px;
		margin:0 auto;
	}
	.searchArea {
		width:420px;
		margin:0 auto;
	}
	.thumb-list {
		width:220px;
		border:1px solid white;
		display:inline-block;
		margin:10px;
		align:center;
	}
	.thumb-list:hover{
		opacity:0.8;
		cursor:pointer;

	}
	
<!--게시판용 스타일 -->
	 .checkboxgroup{
		margin-left:350px;
		margin-rignt:150px;
	}
	
	.newWriting{
		margin-left:1400px;
	}
	 
 <!--게시판용 스타일 -->
 
</style>

<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	
	<section>
	<div class="outer">
	<br>
		<h1 align="center">상품후기</h1>
		
		<br>
		
		<div class = "thumbnailArea">
			<%
			for(int i = 0; i<list.size(); i++){
			
			%>
			
		<div class="thumb-list" align="center">
				<div>
					<input type="hidden" name="bid" value="<%=bList.get(i).getbId()%>">
					
					<img src="<%=request.getContextPath() %>/images_upload/<%=aList.get(i).getChangeName()%>"
						width="200px" height="150px">
				</div>
				<p>
				No. <%=bList.get(i).getbId() %> <br>
				제목 : <%=bList.get(i).getbTitle()%><br>
				글쓴이 : <%=mList.get(i).getUserId() %><br>
				조회수 : <%=bList.get(i).getbCount()%>
				</p>
				
			</div>
			<% } %> 
		</div>
		
	</div>
	<br><br>
		
		
		
		<div class="searchArea">
			<select name="searchCondition" id="searchCondition">
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" />
			<button type="submit">검색하기</button>
			<%-- <% if(loginUser != null) { %> --%>
			<button onclick="location.href='<%=request.getContextPath()%>/views/board/reviewInsertForm.jsp'">작성하기</button>
			<%-- <% } %> --%>
		</div>

	
		<br>
		
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
	
	<script>
			$(function(){
				$(".thumb-list").click(function(){
					var num = $(this).children().children().eq(0).val();
					console.log(num);
					location.href="<%=request.getContextPath()%>/selectOneReview.do?num="+num;
				});
			}); 
		</script>
	
	
		
	</section>
	
	<br><br>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>