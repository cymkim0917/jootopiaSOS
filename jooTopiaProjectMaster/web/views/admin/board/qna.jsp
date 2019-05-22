<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*, com.kh.jooTopia.member.model.vo.* "%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
	ArrayList<Board> board = (ArrayList<Board>)hmap.get("board");
	ArrayList<Member> member = (ArrayList<Member>)hmap.get("member");
	
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
		#qnaList{
			text-align:center;
			width:100%;
		}
		    .replyModalTable > tbody{
			width: 200px;
		}
		.replyModalTable th, .replyModalTable td{
			background: rgb(224, 224, 224);
			text-align: left;
			padding: 3px;
			height: 20px;
			align: center;
		}
		#replyTb{
			align:center;
			margin-left:3%;
		}
</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      <h3 class="title">1:1질문 관리</h3>
      		<div class="searchArea">
      			<form id="searchForm" action="<%=request.getContextPath()%>/searchAdminQnA.do">
      			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">　</th></tr>
				<tr>
					<td colspan="2">
						&nbsp;<input type="radio" name="answer" value="All"><label>전체</label>
						&nbsp;<input type="radio" name="answer" value="Y"><label>답변Yes</label>
						&nbsp;<input type="radio" name="answer" value="N"><label>답변No</label>
					</td>
					<td colspan="2">
						&nbsp;
						<input type="search" name="searchId" placeholder="아이디를 입력하세요." width="20px">
					</td>
				</tr>
			</table>
      		<br>
      		<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
			</form>
      		</div>
	  <hr>
	  <div id="resultArea">
			<form>
		   		<table id="qnaList" border="1"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="100px;">아이디</th>
		   				<th width="50px;">글번호</th>
		   				<th width="100px;">글제목</th>
		   				<th width="150px;">작성일</th>
		   				<th width="100px;">답변여부</th>
		   			</tr>
		   			<%for(int i =0; i<board.size(); i++){ %>
		   			<tr>
		   				<th><input class="checkA" name="checkBid" type="checkbox" value="<%=board.get(i).getbId()%>"></th>
		   				<td><%=member.get(i).getUserId() %></td>
		   				<td><%=board.get(i).getbNo() %></td>
		   				<td><%=board.get(i).getbTitle() %></td>
		   				<td><%=board.get(i).getbDate() %></td>
		   				<td><%if(board.get(i).getaStatus().equals("N")){%>
		   					미답변
		   					<%}else{ %>
		   					답변완료
		   					<%} %>
		   				</td>
		   				<td style="display:none"><%=board.get(i).getbId()%></td>
		   			</tr>
		   			<%} %>
		   			
		   		</table>
		   	</form>
		</div>	
		   	<br>
		   	<hr>
		   	<div id="updateBtnArea" align="right">
		   		<input type="button" value="답변"   onclick="showModal();">
		   		<input type="button" value="삭제">
		   	</div>
	    
	    <div class="paging" align="center">
		<ul class="pagination">
			<li><a href="<%=request.getContextPath()%>/selectAdminQnA.do?currentPage=<%=currentPage-1%>">이전</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminQnA.do?currentPage=1">1</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminQnA.do?currentPage=2">2</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminQnA.do?currentPage=3">3</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminQnA.do?currentPage=4">4</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminQnA.do?currentPage=5">5</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminQnA.do?currentPage=<%=currentPage+1%>">다음</a></li>
		</ul>
		</div>
      </div>
   </section>
 
	    
	
   <script>
  	 function showModal(){
  		 
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
  		 
  	 }
  	 $(function(){
 		$("#qnaList td").mouseenter(function(){
 			$(this).parent().css({"background":"darkgray","cursor":"pointer"});
 		}).mouseout(function(){
 			$(this).parent().css({"background":"white"});
 			
 		}).click(function(){
 			var tr = $(this).parent();
 			var td = tr.children();
 			var tdArr = new Array();
 			var num = td.eq(6).text();
 			console.log(num);
 			
 			location.href="<%= request.getContextPath() %>/selectAdminOneQnA.do?num=" + num;
 			
 		});
 		
 	});
	
   
   
   </script>
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>