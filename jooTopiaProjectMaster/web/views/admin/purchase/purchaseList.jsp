<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	int currentPage = ((PageInfo)request.getAttribute("pi")).getCurrentPage();
	int startPage = ((PageInfo)request.getAttribute("pi")).getStartPage();
	int endPage = ((PageInfo)request.getAttribute("pi")).getEndPage();
	int maxPage = ((PageInfo)request.getAttribute("pi")).getMaxPage();
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
	#searchBtn{
		height : 50px;
		width: 100%;
		background: white;
	}
	.dateSearch label{
		border: 1px solid black;
		line-height : 30px;
		vertical-align: middle;
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
	    		<form action="" method="">
		    		<table border="1" align="center" id="searchBox">
		    			<tr>
		    				<td colspan="2"></td>
		    			</tr>
		    			<tr>
		    				<td>검색분류</td>
		    				<td>
		    					<select id="searchType">
		    						<option value="memberNo">회원번호</option>
		    						<option value="pcName">신청자명</option>
		    						<option value="phone">연락처</option>
		    						<option value="category">카테고리</option>
		    					</select>
		    					<input type="text" id="searchVal" name="searchVal" placeholder="검색어를 입력해주세요" value="">
		    				</td>
		    			</tr>
		    			<tr class="dateSearch">
		    				<td>글 등록일</td>
		    				<td> 
		    					<input type="radio" name="bDate" id="allDate" hidden checked>
	    						<label for="allDate">전체</label>
	    						<input type="radio" name="bDate" id="today" value="0" hidden>
	    						<label for="today">오늘</label>
	    						<input type="radio" name="bDate" id="weeks" value="7" hidden>
	    						<label for="weeks">일주일</label>
	    						<input type="radio" name="bDate" id="month" value="30" hidden >
	    						<label for="month">한달</label>
	    						<input type="radio" name="bDate" id="3month" value="90" hidden>
	    						<label for="3month">3개월</label>
	    						<input type="radio" name="bDate" id="6month" value="180" hidden>
	    						<label for="6month">6개월</label>
	    						<input type="radio" name="bDate" id="year" value="365" hidden>
	    						<label for="year">1년</label>
								<Br>
								<!-- <input type="radio" name="bDate" id="customDate" hidden>
								<label for="customDate">
									<input type="date" name="startDate">
		    						<input type="date" name="endDate">
								</label> -->
		    				</td>
		    			</tr>
		    			
		    			<tr>
		    				<td>매입여부</td>
		    				<td class="purchaseNY">
		    					<input type="radio" hidden="hidden" name="status" value="pcAll" id="pcAll" checked>
		    					<label for="pcAll">전체</label>
		    					<input type="radio" hidden="hidden" name="status" value="waiting" id="waiting">
		    					<label for="waiting">처리대기중</label>
		    					<input type="radio" hidden="hidden" name="status" value="agree" id="agree" >
		    					<label for="agree">수락</label>
		    					<input type="radio" hidden="hidden" name="status"  value="disagree" id="disagree">
		    					<label for="disagree">거절</label>
		    				</td>
		    			</tr>
		    			<tr>
		    				<td colspan="2">
		    					<button id="searchBtn">검색하기</button>
		    					<!-- <button>검색하기</button> --> 
		    				</td>
		    			</tr>
		    		</table>
				</form>
	    	</div>
	    	<script>
	    		$("#searchBtn").click(function(){
	    			var searchType = $("#searchType").val();
	    			var searchVal = $("#searchVal").val();
	    			dateVal = $(".dateSearch input:checked").val();
	    			console.log(searchType);
	    			console.log(searchVal);
	    			
	    			// 정규 표현식 
	    			if(searchType === "pcName" || searchType == "category"){
	    				var regex= /[가-힣]/;
	    				if(!regex.test(searchVal)) alert("글자를 잘못 입력하셨습니다."); return;
	    			}else if(searchType == "memberNo"){
	    				var regex = /[^0-9]/g;
	    				if(!regex.text(searchVal)) alert("회원번호를 입력해주세요!"); return;
	    			}
	    			
	    			$.ajax({
	    				url : "searchDate.do",
	    				data : {date:dateVal},
	    				success : function(data){
	    					console.log("성공!");
	    					dateVal = data;
	    					console.log(dateVal);
	    				}, fail : function(data){
	    					console.log("실패" + data);
	    					dateVal = "no";
	    				}, complete : function(data){
	    					console.log("complete : " + data);
	    					location.href="<%= request.getContextPath() %>/selectSearchPCList.do?searchType=" + searchType + "&searchVal=" + searchVal + "&dateVal=" + dateVal;
	    				}
	    			});
	    		})
	    	</script>
	    	
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
	    			<% for(HashMap<String, Object> hmap : list){ 
	    				String status = String.valueOf(hmap.get("status"));
	    			%>
	    			<tr onclick="location.href='<%= request.getContextPath() %>/selectPurchaseDetail.do?no=<%= hmap.get("pcid")%>'">
	    				<td><%= hmap.get("pcid") %></td>
	    				<td><%= hmap.get("uno") %></td>
	    				<td><%= hmap.get("applicant") %></td>
	    				<td><%= hmap.get("appPhone") %></td>
	    				<td><%= hmap.get("category") %></td>
	    				<td><%= hmap.get("bDate") %></td>
	    				<td>
	    				<% if(status.equals("매입대기중") || status.equals("매입중") || status.equals("현장거절") || status.equals("매입완료")){ %>
	    					매입수락
	    				<% } else {%>
	    					<%= status %>
	    				<% } %>
	    				</td>
	    				<td>
	    				<% if(status.equals("신청수락대기") || status.equals("매입신청거절")){ %>
	    					-
	    				<% }else if(status.equals("매입수락") || status.equals("매입대기중")){ %>
	    					매입대기중
	    				<% }else{ %>
	    					<%= status %>
	    				<% } %>
	    				</td>
	    			<% } %>
	    			</tr>
	    		</table>
	    	</div><br><br><br>
	    	<div class="paging" align="center">
				<ul class="pagination">
				<% if(currentPage <= 1){ %>
				<% } else { %>
				<li><a href="<%= request.getContextPath() %>/selectPurchaseAdminList.do?currentPage=<%= currentPage - 1 %>"><</a></li>
				<% } %>
				
				<% for(int p = startPage; p <= endPage; p++){
						if(p == currentPage){ %>
							<li class="active"><a href="<%= request.getContextPath() %>/selectPurchaseAdminList.do?currentPage=<%= p %>"><%= p %></a></li>
				<%  	} else { %>
							<li><a href="<%= request.getContextPath() %>/selectPurchaseAdminList.do?currentPage=<%= p %>"><%= p %></a></li>
				<%		} %>
				<% } %>
				
				<% if(currentPage >= maxPage){ %>
				<% } else { %>
				<li><a href="<%= request.getContextPath() %>/selectPurchaseAdminList.do?currentPage=<%= currentPage + 1 %>">></a></li>
				<% } %>
				</ul>
			</div>
	    </div><!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>
<script>
	var checkDateId = $(".dateSearch input:checked").eq(0).attr("id");
	for(var i = 0; i < 5; i++){
		var dateLabel = $(".dateSearch label").eq(i);
		if(dateLabel.attr("for") == checkDateId){
			dateLabel.css("background", "black").css("color", "white");	    						
		}
	}
	$(".dateSearch").change(function(){
		var checkDateId = $(".dateSearch input:checked").eq(0).attr("id");
		$(".dateSearch label").css("background", "white").css("color", "black");
		for(var i = 0; i < 7; i++){
			var dateLabel = $(".dateSearch label").eq(i);
			if(dateLabel.attr("for") == checkDateId){
				dateLabel.css("background", "black").css("color", "white");	    						
			}
		}
	})
	var checkPCId = $(".purchaseNY input:checked").eq(0).attr("id");
	for(var i = 0; i < 3; i++){
		var statusLabel = $(".purchaseNY label").eq(i);
		if(statusLabel.attr("for") == checkPCId){
			statusLabel.css("color", "red").css("font-weight", "bold");	    						
		}
	}
	$(".purchaseNY").change(function(){
		var checkPCId = $(".purchaseNY input:checked").eq(0).attr("id");
		$(".purchaseNY label").css("color", "black").css("font-weight", "none");
		for(var i = 0; i < 5; i++){
			var statusLabel = $(".purchaseNY label").eq(i);
			if(statusLabel.attr("for") == checkPCId){
				statusLabel.css("color", "red").css("font-weight", "bold");	    						
			}
		}
	})
	
	
</script>
</body>
</html>








