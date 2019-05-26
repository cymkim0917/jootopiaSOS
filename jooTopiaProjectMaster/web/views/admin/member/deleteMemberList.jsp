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
	#memberList{
		text-align:center;
	}
	#memberList tr{
		height:50%;
	}
	#updateBtnArea>input {
		width: 90px;
		height: 35px;
		border: none;
		color: white;
		background: rgb(61, 81, 113);
		border-radius: 10px;
		cursor: pointer;
		margin-left: 20px;
		margin-right: 20px;
		
	}
	#updateBtnArea>input:hover {
		background: rgb(114, 164, 208);
		color: white;
	}
	
</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      <h3 class="title">탈퇴회원관리</h3>
	  <hr>
       <div class="searchArea">
       		<form action="<%=request.getContextPath() %>/searchAdminDeleteM.do" method="post" >
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="4" style="background: rgb(224, 224, 224); height: 35px;">　</th></tr>
				<tr>
					<td>아이디</td>
					<td colspan="3">
						<input type="text" placeholder="아이디를 입력하세요." name="userId" width="30px">
					</td>
				</tr>
				<tr>
					<td>탈퇴사유</td>
					<td colspan="3">
						<input type="text" placeholder="검색할 사유를 입력하세요." name="nreason" width="30px">
					</td>
				</tr>
				
				<tr>
					<td>탈퇴 유형</td>
					<td colspan="3">
						&nbsp;<select id="searchCategory" name="wType">
							<option value=""> 
							<option value="자진">자진
							<option value="강퇴">강퇴
						</select>
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
			<form action="<%=request.getContextPath() %>/returnAdminMember.do"  method="post">
			
		   		<table id="memberList" class="table table-hover" align="center" width="100%"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="100px;">아이디</th>
		   				<th width="100px;">이름</th>
		   				<th width="100px;">탈퇴일</th>
		   				<th width="300px;">탈퇴사유</th>
		   			</tr>
		   			<%for(Member member:list){ %>
		   			<tr>
		   				<td><input id="uNova" type="checkbox" name="checkUno" value="<%=member.getUno()%>"></td>
		   				<td><%=member.getUserId() %></td>
		   				<td><%=member.getUserName() %></td>
		   				<td><%=member.getWidthDrawal_date() %></td>
		   				<td><%if(member.getWidthDrawal_reason()==null){ %>
		   				  
		   				<%}else{ %>
		   				<%=member.getWidthDrawal_reason() %>
		   				<%} %>
		   				</td>
		   			</tr>
		   			<%} %>
		   		</table>
		   	<br>
		   	<div id="updateBtnArea" align="right">
		   		<input type="submit" value="복구">
		   	</div>
		   	</form>
		</div>	
		<hr>
      </div>
      <div class="paging" align="center">
		<ul class="pagination">
			<li><a href="<%=request.getContextPath()%>/deleteAdminMember.do?currentPage=<%=currentPage-1%>">이전</a></li>
			<li><a href="<%=request.getContextPath()%>/deleteAdminMember.do?currentPage=1">1</a></li>
			<li><a href="<%=request.getContextPath()%>/deleteAdminMember.do?currentPage=2">2</a></li>
			<li><a href="<%=request.getContextPath()%>/deleteAdminMember.do?currentPage=3">3</a></li>
			<li><a href="<%=request.getContextPath()%>/deleteAdminMember.do?currentPage=4">4</a></li>
			<li><a href="<%=request.getContextPath()%>/deleteAdminMember.do?currentPage=5">5</a></li>
			<li><a href="<%=request.getContextPath()%>/deleteAdminMember.do?currentPage=<%=currentPage+1%>">다음</a></li>
		</ul>
		</div>
   </section>
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>