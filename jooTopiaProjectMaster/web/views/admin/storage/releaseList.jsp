<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.release.model.vo.*, com.kh.jooTopia.heap.model.vo.*, java.util.*"%>
	
	<% ArrayList<ReleaseAdmin> rlist = (ArrayList<ReleaseAdmin>) request.getAttribute("rlist"); 
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
.table th {
	text-align: left;
} 
</style>
</head>
<body>
	<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">

			<h3 class="title">출고리스트</h3>
			<hr>

			<div class="searchArea">
				<table id="searchBox" border="1" align="center">
					<tr>
						<th colspan="3"
							style="background: rgb(224, 224, 224); height: 35px;"></th>
					</tr>
					<tr>
						<td>검색 분류</td>
						<td colspan="2">&nbsp;
						<select id="searchCondition">
								<option value="">주문번호
								<option value="">배송번호
								<option value="">출고번호
						</select> <input type="search" placeholder="검색 단어를 입력하세요." width="20px">
						</td>
					</tr>
					<%-- <tr>
						<td>출고일자</td>
						<td id="selectDate" colspan="2">&nbsp;						
						<input type="date" id="startDate" name="startDate" class="date"value="<%= startDay %>">
							~ <input type="date" id="endDate" name="endDate" class="date"value="<%= endDay %>">
						</td>
					</tr> --%>
				</table>

				<br>

				<div id="searchBtnArea" align="center">
					<input type="submit" value="검색" onclick="">
					<input	type="reset" value="초기화" onclick="">
				</div>
			</div>

			<br><br><br><br><br><br>

			<div class="container">

				<table class="table table-striped">
					<thead>
					<tr>
						<th>No.</th>
						<th>주문번호</th>
						<th>배송번호</th>
						<th>출고번호</th>
						<th>출고일자</th>
					</tr>
				</thead>
				<% int i = 0; for(ReleaseAdmin r : rlist){ i++;%>
				<tbody>
					<tr>
						<td><%= i %></td>
						<td><%= r.getPoId() %></td>
						<td><%= r.getdId() %></td>
						<td><%= r.getRlId() %></td>
						<td><%= r.getRlDate() %></td>
						
					</tr>
					<% } %>
					
				</tbody>
			</table>



			

			<!-- <hr>
			<div align="center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div> -->
		</div>
		
		<div class="pagingArea" align="center">
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminReleaseList.do?currentPage=1'"><<
            </button>
         <% if(currentPage <= 1) { %>
         <button disabled><</button>
         <% }else { %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminReleaseList.do?currentPage=<%= currentPage - 1 %>'"><
            </button>
         <% } %>
         
         <% for(int p = startPage; p <= endPage; p++){
            if(p == currentPage){%>
         <button disabled><%=p %></button>

         <%}else{%>
         <button
            onclick="location.href='<%=request.getContextPath()%>/selectAdminReleaseList.do?currentPage=<%=p%>'"><%=p %></button>
         <% }%>
         <% } %>


         <% if(currentPage >= maxPage) { %>
         <button disabled>></button>
         <% }else { %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminReleaseList.do?currentPage=<%= currentPage + 1 %>'">
            ></button>
         <% } %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminReleaseList.do?currentPage=<%= maxPage %>'">
            >></button>
      </div>
		
		</div>

	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>
</body>
</html>