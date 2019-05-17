<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<script src="/jootopia/js/external/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<title>JooTopia</title>
<style>
	#searchBox tr:nth-child(1) td{
		 background: rgb(224, 224, 224); 
		 height: 40px; 
		 width:100%;
	}
	#searchBox td:nth-child(1){
		width: 16%;
		height : 50px;
		font-size: 1.05em;
		font-weight: bold;
	}
	
	#searchBox td:nth-child(2) *{
		height : 30px;
		margin: 2px 5px 0px 5px;
		padding : 0px 10px;
	}
	#listTable{
		margin-top: 2%;
		width: 100%;
		border-top: 1px solid black;
	}
	#listTable tr:nth-child(1) th{
		height : 50px;
		color: black;
	}
	#listTable tr:nth-child(1) th:hover{
		cursor: auto;
	}
	#listTable tr{
		border-bottom: 1px solid black;
		cursor:pointer;
	}
	#listTable tr:hover{
		background: rgb(150, 150, 150); 
		color: white;
	}
	#listTable tr > td{
		height : 50px;
		text-align:center;
	}
</style>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
	<section class="row">
	<%@ include file="/views/common/adminSideMenu.jsp" %>
		<div class="col-sm-10">
	    	<h3 class="title">매입신청</h3>
	    	<hr>
	    	<div class="searchArea">
	    		<table border="1" align="center" id="searchBox">
	    			<tr>
	    				<td colspan="2"></td>
	    			</tr>
	    			<tr>
	    				<td>검색분류</td>
	    				<td>
	    					<select id="searchType">
	    						<option value="memberNo">회원번호</option>
	    						<option value="memberName">회원이름</option>
	    						<option value="phone">연락처</option>
	    						<option value="category">카테고리</option>
	    					</select>
	    					<input type="text" id="search" name="search" placeholder="검색어를 입력해주세요">
	    					<button onclick="search1();"></button>
	    				</td>
	    			</tr>
	    			<script>
	    				function search1(){
		    				var searchType = $("#searchType").val();
		    				var search = $("#search").val();
		    				console.log("searchType : " + searchType);
		    				console.log("search : " + search);
		    				switch(searchType){
			    				case "memberNo": location.href='<%= request.getContextPath() %>/selectSearchUnoServlet.do?search=' + search; 
			    								break;
			    				case "memberName" :
			    				case "phone":
			    				case "category":
			    					return false;
			    				
		    				}
	    				}
	    			</script>
	    			<tr>
	    				<td>글 등록일</td>
	    				<td>
	    					<button>오늘</button>
	    					<button>일주일</button>
	    					<button>한달</button>
	    					<button>3개월</button>
	    					<button>6개월</button>
	    					<input type="date" name="startDate">
	    					<input type="date" name="endDate">
	    				</td>
	    			</tr>
	    			<tr>
	    				<td>매입여부</td>
	    				<td>
	    					<input type="radio" hidden="hidden" name="status" value="확인 전" id="waiting" checked>
	    					<label for="waiting">확인 전</label>
	    					<input type="radio" name="status" value="수락" id="agree">
	    					<label for="agree">수락</label>
	    					<input type="radio" name="status"  value="거절" id="disagree">
	    					<label for="disagree">거절</label>
	    				</td>
	    			</tr>
	    		</table>
	    	</div><!-- searchArea -->
	    	<div class="lsitTableArea">
	    		<table align="center" id="listTable">
	    			<tr>
	    				<th>No.</th>
	    				<th>회원번호</th>
	    				<th>신청자명</th>
	    				<th>연락처</th>
	    				<th>상품카테고리</th>
	    				<th>신청일자</th>
	    				<th>매입여부</th>
	    				<th>입고여부</th>
	    			</tr>
	    			<% for(HashMap<String, Object> hmap : list){ %>
	    			<tr onclick="location.href='<%= request.getContextPath() %>/selectPurchaseDetail.do?no=<%= hmap.get("pcid")%>'">
	    				<td><%= hmap.get("pcid") %></td>
	    				<td><%= hmap.get("uno") %></td>
	    				<td><%= hmap.get("applicant") %></td>
	    				<td><%= hmap.get("appPhone") %></td>
	    				<td><%= hmap.get("category") %></td>
	    				<td><%= hmap.get("bDate") %></td>
	    				<td><%= hmap.get("status") %></td>
	    				<td><%= hmap.get("status") %></td>
	    			<% } %>
	    			</tr>
	    		</table>
	    	</div><br><br><br>
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
	    </div><!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>








