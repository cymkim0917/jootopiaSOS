<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.stock.model.vo.*, com.kh.jooTopia.heap.model.vo.*, java.util.*"%>
    
    <% ArrayList<StockAdmin> list = (ArrayList<StockAdmin>) request.getAttribute("list"); 
    PageInfo pi = (PageInfo)request.getAttribute("pi");
  	int currentPage = pi.getCurrentPage();
  	int maxPage = pi.getMaxPage();
  	int startPage = pi.getStartPage();
  	int endPage = pi.getEndPage();
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
<title>JooTopia</title>
<style>

.listArea{
	padding-left: 5%;
	width: 100%;
}
#tableArea th{
	width: 10%;
}
#tableArea td{
	width: 10%;
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div id="adminSection" class="col-sm-10">
      
      <h3 class="title">창고 재고현황</h3>
	    	<hr>      	
      <div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;"></th></tr>
				<tr>
					<td>검색 분류</td>
					<td colspan="2">
						&nbsp;<select id="searchCondition" >
							<option value="hCode">적치번호
							<option value="pCode">상품번호
							<option value="lNo">위치번호							
						</select>
						<input type="search" placeholder="검색 단어를 입력하세요." width="20px">
					</td>
				</tr>
			</table>
			<br>
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
		</div>
		<br><br><br><br>
			<div class="listArea">
				<table class="table table-striped" id="tableArea">
					<thead>
					<tr>
						<th>No.</th>
						<th>대분류</th>
						<th>중분류</th>
						<th>상품번호</th>
						<th>적치번호</th>
						<th>위치번호</th>
						<th>적치일자</th>
					</tr>
				</thead>
				<tbody>
				<% int i = 0; for(StockAdmin s : list){ i++; %>
					<tr>
						<td><%= i %></td>
						<td><%= s.getcGroup() %></td>
						<td><%= s.getName() %></td>
						<td><%= s.getpId() %></td>
						<td><%= s.gethId() %></td>
						<td><%= s.getlBarcode() %></td>
						<td><%= s.gethDate() %></td>
						
					</tr>
					<% } %>
				</tbody>
			</table>		
			</div>
			
			<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="<%=request.getContextPath()%>/selectAdminStock.do?currentPage=<%=currentPage-1%>">이전</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminStock.do?currentPage=1">1</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminStock.do?currentPage=2">2</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminStock.do?currentPage=3">3</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminStock.do?currentPage=4">4</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminStock.do?currentPage=5">5</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminStock.do?currentPage=<%=currentPage+1%>">다음</a></li>
		</ul>
		</div>
			
				<%-- <div class="pagingArea" align="center">
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminStock.do?currentPage=1'"><<
            </button>
         <% if(currentPage <= 1) { %>
         <button disabled><</button>
         <% }else { %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminStock.do?currentPage=<%= currentPage - 1 %>'"><
            </button>
         <% } %>
         
         <% for(int p = startPage; p <= endPage; p++){
            if(p == currentPage){%>
         <button disabled><%=p %></button>

         <%}else{%>
         <button
            onclick="location.href='<%=request.getContextPath()%>/selectAdminStock.do?currentPage=<%=p%>'"><%=p %></button>
         <% }%>
         <% } %>


         <% if(currentPage >= maxPage) { %>
         <button disabled>></button>
         <% }else { %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminStock.do?currentPage=<%= currentPage + 1 %>'">
            ></button>
         <% } %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminStock.do?currentPage=<%= maxPage %>'">
            >></button>
      </div> --%>
	
	
	<!-- <div align="center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div> -->
	</div>
	
   
   </section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>