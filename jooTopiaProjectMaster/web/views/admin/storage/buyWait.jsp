<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.buy.model.vo.*, com.kh.jooTopia.heap.model.vo.*, java.util.*"%>
<% 
	ArrayList<BuyWaitAdmin> list = (ArrayList<BuyWaitAdmin>) request.getAttribute("list");
	System.out.println("jsp list : " + list);
	
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
	width: 14%;
}
#tableArea td{
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">
			<h3 class="title">매입리스트</h3>
			<hr>
			<br><br />
			<div class="listArea">
				<table class="table table-hover" id="tableArea">
					<thead>
						<tr>
							<th>매입번호</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>신청자명</th>
							<th>연락처</th>
							<th>상태</th>						
						</tr>
					</thead>
					<tbody>
						<% for(BuyWaitAdmin b : list){ %>
						<tr>
							<td><%= b.getPcid() %></td>
							<td><%= b.getcGroup() %></td>
							<td><%= b.getName() %></td>
							<td><%= b.getApplicant() %></td>
							<td><%= b.getAppPhone() %></td>
							<td><%= b.getStatus() %></td>						
						</tr>
						<% } %>						
					</tbody>
				</table>
			</div>

		<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="<%=request.getContextPath()%>/selectAdminBuy.do?currentPage=<%=currentPage-1%>">이전</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminBuy.do?currentPage=1">1</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminBuy.do?currentPage=2">2</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminBuy.do?currentPage=3">3</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminBuy.do?currentPage=4">4</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminBuy.do?currentPage=5">5</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminBuy.do?currentPage=<%=currentPage+1%>">다음</a></li>
		</ul>
		</div>
			<!-- <br />
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

	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>

	<script>
		$(function(){
			$("#tableArea tr").click(function(){
				var num = $(this).children().eq(0).text();
				console.log(num);				
				<%-- location.href="<%=request.getContextPath()%>/selectOneAdminProductr.do?num=" + num; --%>
				location.href="<%= request.getContextPath() %>/selectBuyDetail.do?num=" + num;
				
			})
		})
	</script>

</body>
</html>