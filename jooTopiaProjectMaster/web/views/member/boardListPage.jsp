<%@page import="com.kh.jooTopia.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">
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
	
	#btnArea{
		text-align:center;
	}
	
	table{
		text-align:center;
		width:800px;
		heihgt:500px;
	}
	
	#tableArea{
		width:800px;
		height:500px;
	}
</style>
</head>

<body>
<%@ include file="/views/common/navigation.jsp" %>

<% ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 
	int boardIndex = 1;//
%>
	<section>
	<br /><br />
		<div class="row">
			<h1 align="center">게시글 조회</h1>
			<div class="col-sm-3"></div>
			<div class="col-sm-6" id="tableArea">
				<table class="table">
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성 일자</th>
						<th>조회수</th>
						<th>게시글 타입</th>
					</tr>
					<% 
					if(list != null) {
					for(int i=0; i<list.size(); i++){ %>
					<tr>
						
						<td><label><%= boardIndex %><% boardIndex++; %></label>
						
						<input type="hidden" name="bid" value="<%= list.get(i).getbId() %>"/>
						</td>
						<td><a href="<%= request.getContextPath() %>/selectQaA.do?num=<%=list.get(i).getbId() %>"><%= list.get(i).getbTitle() %></a></td>
						<td><label for=""><%= list.get(i).getBDate() %></label></td>
						<td><label for=""><%= list.get(i).getbCount() %></label><td>
							<% int num = list.get(i).getbType();
							   String bType = "";
							
								switch(num){
								case 1: bType = "FAQ"; break;
								case 2: bType = "공지"; break;
								case 3: bType = "1:1문의"; break;
								case 4: bType = "후기"; break;
								case 5: bType = "매입요청"; break;
								}
							
							%>
						<td>
						<label for=""><%= bType %></label>
						
						</td>
					<% 
						}
					} %>
					</tr>
				<!-- 	<tr>
						<td>2</td>
						<td>너무 좋내요~~@^^@</td>
						<td>2018-12-24</td>
						<td>0<td>
						<td>후기</td>
					</tr>
					<tr>
						<td>3</td>
						<td><a href="purchaseListDetail.jsp">소파 가져가주세용~ㅋ</a></td>
						<td>2019-01-01</td>
						<td>30</td>
						<td>매입 신청</td>
					</tr>	
					<tr>
						<td>4</td>
						<td><a href="QaAPage.jsp">저 궁금한 게 있는데용;ㅋ</a></td>
						<td>2019-02-03</td>
						<td>25</td>
						<td>1:1 문의</td>
					</tr> -->
				</table>
				
				<div align="center" id="btnArea">
					<ul class="pagination">
						<li><a href="">1</a> </li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">4</a></li>
						<li><a href="">5</a></li>
					</ul>
				</div>
			</div>
		<div class="col-sm-3"></div>
	</div>

	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>