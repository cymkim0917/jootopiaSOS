<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.board.model.vo.*, java.util.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int currentPage = pageInfo.getCurrentPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
%>
<!DOCTYPE html>
<html>   
<head>   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/jquery-3.4.0.min.js"></script>
<script src="/jootopia/js/external/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<style>
		#updateBtnArea>input {
			width: 90px;
			height: 35px;
			border: none;
			background: rgb(224, 224, 224);
			border-radius: 10px;
			cursor: pointer;
			margin-left: 20px;
			margin-right: 20px;
		}
		#updateBtnArea>input:hover {
			background: rgb(92, 55, 39);
			color: white;
			}
		#noticeList{
			text-align:center;
			width:100%;
		}
</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      <h3 class="title">공지사항 게시판 관리</h3>
		<hr>
      	<div class="searchArea">
			<form id="searchForm" action="<%=request.getContextPath() %>/searchAdminNotice.do" method="post" >
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">　</th></tr>
				<tr>
					<td colspan="2">
						&nbsp;<input type="radio" name="nType" value="All"><label>전체</label>
						&nbsp;<input type="radio" name="nType" value="공지사항"><label>공지사항</label>
						&nbsp;<input type="radio" name="nType" value="이벤트"><label>이벤트</label>
					</td>
					<td colspan="2">
						&nbsp;
						<input type="search" name="searchTitle" placeholder="제목 검색" width="20px">
					</td>
				</tr>
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" >
				<input type="reset" value="초기화" >
			</div>
			</form>
		</div>
		<hr>
		<div id="resultArea">
			<form action="<%=request.getContextPath() %>/deleteAdminNotice.do"  method="post">
		   		<table id="noticeList" class="table table-hover" align="center"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="50px;">글번호</th>
		   				<th width="150px;">제목</th>
		   				<th width="70px;">작성일</th>
		   				<th width="70px;">수정일</th>
		   				<th width="50px;">조회수</th>
		   				<th width="50px;">분류</th>
		   			</tr>
		   			<%for(Board board:list){ %>
		   			<tr>
		   				<th><input class="checkA" name="checkBid" type="checkbox" value="<%=board.getbId() %>"></th>
		   				<td><%=board.getbNo() %></td>
		   				<td><%=board.getbTitle() %></td>
		   				<td><%=board.getbDate() %></td>
		   				<td><%=board.getModifyDate() %></td>
		   				<td><%=board.getbCount() %></td>
		   				<td><%=board.getnType() %></td>
		   				<td style="display:none">
		   					<input value="<%=board.getbId() %>">
		   				</td>
		   			</tr>
		   			<%} %>
		   		</table>
		   	<br>
		   	<hr>
		   	<div id="updateBtnArea" align="right">
		   		<input type="button" value="글쓰기" onclick="location.href='/jootopia/views/admin/board/noticeInsertForm.jsp'">
		   		<input type="submit" value="삭제" onclick="deleteBoard();">
		   	</div>
		   	</form>
		</div>	
		
		
		<div class="paging" align="center">
				<ul class="pagination">
				<% if(currentPage <= 1){ %>
				<li><a><</a></li>
				<% } else { %>
				<li><a href="<%= request.getContextPath() %>/adminBoardList.do?currentPage=<%= currentPage - 1 %>"><</a></li>
				<% } %>
				
				<% for(int p = startPage + 1; p <= endPage; p++){
					System.out.println(currentPage);
						if(p == currentPage){ %>
							<li class="active"><a href="<%= request.getContextPath() %>/adminBoardList.do?currentPage=<%= p %>"><%= p %></a></li>
							
				<%  	} else { %>
							<li><a href="<%= request.getContextPath() %>/adminBoardList.do?currentPage=<%= p %>"><%= p %></a></li>
				<%		} %>
				<% } %>
				
				<% if(currentPage >= maxPage){ %>
				<% } else { %>
				<li><a href="<%= request.getContextPath() %>/adminBoardList.do?currentPage=<%= currentPage + 1 %>">></a></li>
				<% } %>
				</ul>
			</div>
		
      </div>
   </section>
   <script>
  	  $(function(){
		$("#noticeList td").mouseenter(function(){
			$(this).parent().css({"background":"darkgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"}); */
			
		}).click(function(){
			var tr = $(this).parent();
			var td = tr.children();
			var tdArr = new Array();
			var type = td.eq(6).text();
			var num = td.eq(7).children().val();
			console.log(type);
			console.log(num);
			
			if(type == '공지사항'){
				location.href="<%= request.getContextPath() %>/selectAdminNotice.do?num=" + num;
				console.log('if문공지사항')
			}else if(type=='이벤트'){
				location.href="<%= request.getContextPath() %>/selectAdminEvent.do?num=" + num;
			} 
		});
		
	});
  	 	 function deleteBoard(){
  	 		 var values = document.getElementsByName("checkBid");
  	 		 for(var i = 0; i<values.length; i++){
  	 			 if(values[i].checked){
  	 				 console.log(values[i].value);
  	 			 }
  	 		 }
  	 	 }

   
   </script>
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>