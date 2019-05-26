<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.jooTopia.board.model.vo.*"%>
<%
	ArrayList<HashMap<String, Object>> list = 
			(ArrayList<HashMap<String,Object>>)request.getAttribute("list");
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
		height:1500px;
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
		width:100%;
		margin:0 auto;
		align:center;
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
	.snip1535 {
  background-color: #c47135;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 1em;
  font-size: 12px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 12px 40px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: #c47135;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: #c47135;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: #c47135;
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}

 #searchContentArea{
 	margin-top:2%;
 	float:left;
 	margin-left:35%;
 }
 #searchBtnArea{
 	float:left;
 }
  #insertBtnArea{
 	float:left;
 }
 .paging{
 	margin-top:10%;
 }
	
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
				HashMap<String,Object> hmap = list.get(i);
			%>
			
			<div class="thumb-list" align="center">
				<div>
			
					<input type="hidden" name="bno" value="<%=hmap.get("bid")%>" id="bno">
					
					<% System.out.println("reviewList : "+ hmap.get("bid")); %>
		
				<img src="<%=request.getContextPath()%>/images/review/<%=hmap.get("change_name")%>"
				
						width="200px" height="150px"> 
						
				</div>
				<p>
				No. <%=hmap.get("bno") %> <br>
				제목 : <%=hmap.get("btitle")%><br>
				글쓴이 : <%=hmap.get("user_id") %><br>
				조회수 : <%=hmap.get("bcount")%>
				</p> 
				
				<br>
				
			</div>
			<% } %> 
			
		</div>
		
	</div>
	<br><br>
		
		
		
		<div class="searchArea">
			<div id="searchContentArea">
			<select name="searchCondition" id="searchCondition">
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" />
			</div>
			<div id="searchBtnArea"><button class="snip1535" type="submit">검색하기</button></div>
			<div id="insertBtnArea"><button class="snip1535" onclick="location.href='<%=request.getContextPath()%>/views/board/reviewInsertForm.jsp'">작성하기</button></div>
		</div>


		<br>
		<br>
		
		<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="#">이전</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">다음</a></li>
		</ul>
		</div>
	
	<script>
			$(function(){
				$(".thumb-list").click(function(){
					var num = $("#bno").val();
					console.log("num : " + num);
					
					location.href="<%=request.getContextPath()%>/selectOneReview.do?num="+num;  
					
				});
			}); 
		</script>
	
	
		
	</section>
	
	<br><br>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>