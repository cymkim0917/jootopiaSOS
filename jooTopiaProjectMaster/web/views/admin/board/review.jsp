<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.jooTopia.product.model.vo.*, com.kh.jooTopia.board.model.vo.*, com.kh.jooTopia.member.model.vo.* "%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
	
	ArrayList<Board> board = (ArrayList<Board>)hmap.get("board");
	ArrayList<Member> member = (ArrayList<Member>)hmap.get("member");
	ArrayList<Product> product = (ArrayList<Product>)hmap.get("product");
	
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
		#updateBtnArea{
			margin-left:90%;
		
		}
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
	    #reviewList>tr{
	    	height:30px;
	    
	    }
	    #reviewList{
	    	width:100%;
	    	text-align:center;
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
		}

</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      <h3 class="title">후기게시판 관리</h3>
	  <hr>
      	<div class="searchArea">
      		<form action="<%=request.getContextPath() %>/searchAdminRRe.do" method="post">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(209, 220, 222); height: 35px;">　</th></tr>
				<tr>
					<td>작성자</td>
					<td colspan="2">
						&nbsp;
						<input type="search" name="userId" placeholder="작성자를 입력하세요." width="20px">
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="2">
						&nbsp;
						<input type="search" name="title" placeholder="제목을 입력하세요." width="20px">
					</td>
				</tr>
			</table>
			<br>
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색">
				<input type="reset" value="초기화">
			</div>
			</form>
			
		</div>
		<hr>
		<div id="resultArea">
		<h3>후기글 목록</h3>
			<form action="<%=request.getContextPath()%>/deleteAdminReview.do">
		   		<table id="reviewList" class="table table-hover" align="center"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="100px;">글쓴이</th>
		   				<th width="150px">상품명</th>
		   				<th width="200px;">제목</th>
		   				<th width="100px;">작성일</th>
		   				<th width="100px;">평점</th>
		   			</tr>
		   			<%for (int i = 0; i<board.size(); i++){ %>
		   			<tr id="detailreviews">
		   				<th><input type="checkbox" name="checkBid" value="<%=board.get(i).getbId()%>"></th>
		   				<td><%=member.get(i).getUserId()%></td>
		   				<td><%=product.get(i).getpName() %></td>
		   				<td><%=board.get(i).getbTitle() %></td>
		   				<td><%=board.get(i).getbDate() %></td>
		   				<td><%=board.get(i).getRrating() %></td>
		   			</tr>
		   			<%} %>
		   		</table>
		   	<br>
		   	<br>
		   	<div id="updateBtnArea" align="center">
		   		<input type="submit"value="삭제">
		   	</div>
		   	</form>
		</div>	
		
		<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="<%=request.getContextPath()%>/selectAdminReview.do?currentPage=<%=currentPage-1%>">이전</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminReview.do?currentPage=1">1</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminReview.do?currentPage=2">2</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminReview.do?currentPage=3">3</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminReview.do?currentPage=4">4</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminReview.do?currentPage=5">5</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminReview.do?currentPage=<%=currentPage+1%>">다음</a></li>
		</ul>
		</div>
		
      </div>
   </section>
   
   <script>
   /* $(function(){
		$("#reviewList td").mouseenter(function(){
			$(this).parent().css({"background":"darkgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"}); */
			
		}).click(function(){
			var tr = $(this).parent();
			var td = tr.children();
			var num = td.eq(0).children().val();
			console.log(num);
			
		    location.href="<%= request.getContextPath() %>/selectAdminDeReview.do?num=" + num;
			
		});
		
	});
   
   
   </script>
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>