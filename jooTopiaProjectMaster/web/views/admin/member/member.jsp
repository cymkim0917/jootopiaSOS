<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.member.model.vo.*, java.util.*, com.kh.jooTopia.board.model.vo.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
	input{
	 width:100%;
	}
	
	#memberList{
		width:100%;
		text-align:center;
	}

</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
	<%@ include file="/views/common/adminSideMenu.jsp" %>
    <div class="col-sm-10">
    <h3 class="title">회원관리</h3>
	<hr>
	<br />
		<div>
			<form action="<%=request.getContextPath() %>/searchAdminMember.do" method="post">
			<table id="searchBox" border="1">
			<tr><th colspan="5" style="background: rgb(209, 220, 222); height: 35px;">　</th></tr>
				  <tr>
				    <td width="15%"><label class="titleName">아이디</label></td>
				    <td><input type="text" width="100%" name="sUserId"></td>
				    <td  width="15%"><label class="titleName">이름</label></td>
				    <td><input type="text" width="100%" name="sName"></td>
				  </tr>
				  <tr>
				    <td><label class="titleName">전화번호</label></td>
				    <td><input type="phone" name="sPhone"></td>
				    <td><label class="titleName">생년월일(ex 19/05/23)</label></td>
				    <td><input type="text" name="sDate"></td>
				  </tr>
				  <tr>
				    <td><label class="titleName">주소</label></td>
				    <td><input type="text" name="sAddress"></td>
				    <td><label class="titleName">이메일</label></td>
				    <td><input type="email" name="sEmail"></td>
				  </tr>
			</table>
			<br>
			<div id="searchBtnArea" align="right">
				<input type="submit" value="조회">
			</div>
			</form>
		</div>
		<hr>
		<div id="resultArea">
			<form action="<%=request.getContextPath() %>/deleteAdminM.do"  method="post">
		   		<table id="memberList"  align="center" class="table table-hover"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="100px;">아이디</th>
		   				<th width="100px;">이름</th>
		   				<th width="100px;">생년월일</th>
		   				<th width="150px;">전화번호</th>
		   				<th width="200px;">email</th>
		   				<th width="300px;">주소</th>
		   			</tr>
		   			<%for(Member member:list){ %>
		   			<tr>
		   				<th><input type="checkbox" name="checkuNo" value="<%=member.getUno()%>"></th>
		   				<td><%=member.getUserId() %></td>
		   				<td><%=member.getUserName() %></td>
		   				<td><%=member.getUserDate() %></td>
		   				<td><%=member.getPhone() %></td>
		   				<td><%=member.getEmail() %></td>
		   				<td><%=member.getAddress() %></td>
		   			</tr>
		   			<%} %>
		   		</table>
		   		<hr>
		   	<div id="searchBtnArea" align="right">
		   		<input type="submit" value="강퇴">
		   	</div>
		   	</form>
		
		
		</div>
		
		<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="<%=request.getContextPath()%>/selectAdminMember.do?currentPage=<%=currentPage-1%>">이전</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminMember.do?currentPage=1">1</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminMember.do?currentPage=2">2</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminMember.do?currentPage=3">3</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminMember.do?currentPage=4">4</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminMember.do?currentPage=5">5</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminMember.do?currentPage=<%=currentPage+1%>">다음</a></li>
		</ul>
		</div>
		
      	
   </div>
   
   <script>
   
   	$(function(){
		$("#memberList td").mouseenter(function(){
			$(this).parent().css({"background":"darkgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"}); 
			
		}).click(function(){
			var tr = $(this).parent();
			var td = tr.children();
			
			var num = td.eq(0).children().val();
			
			location.href="<%= request.getContextPath() %>/detailAdminMember.do?num=" + num;
			
			
		});
   	});
		

   </script>
      
      
   </section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>







