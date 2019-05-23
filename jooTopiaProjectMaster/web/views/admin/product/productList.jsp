<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.lang.*, com.kh.jooTopia.board.model.vo.*"%>
<%
	int count = 1;
	ArrayList<HashMap<String,Object>> list = 
	(ArrayList<HashMap<String,Object>>) request.getAttribute("list");
	int sell = 0;
	int noSell = 0;
	
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
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<title>JooTopia</title>
</head>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3 class="title">상품 목록</h3>
	    <hr>
		<div id="listArea">
			<% if(list != null) { 
				for(int i = 0; i < list.size(); i++) {
					if(list.get(i).get("status").equals("판매중")) {
						sell += 1;
					}else {
						noSell += 1;
					}
				}
			%>
				전체 <a href="#"><%= list.size() %></a>건  |  
				판매중 <a href="#"><%= sell %></a>건  |
				판매미등록 <a href="#"><%= noSell %></a>건
			<% }else { %>
				전체 <a href="#">0</a>건  |  
				판매중 <a href="#">0</a>건  |
				판매미등록 <a href="#">0</a>건
			<% } %>
		</div>
		<br>
		
		<form action="<%=request.getContextPath()%>/searchAdminProduct.do">
		<div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="height: 35px;">　</th></tr>
				<tr>
					<td>검색 분류</td>
					<td colspan="2">
						<select id="searchCondition" name="searchCondition">
							<option value="pName">상품명
							<option value="pCode">상품코드
						</select>
						<input type="search" placeholder="검색 단어를 입력하세요." width="20px" name="searchConditionValue">
					</td>
				</tr>
				<tr>
					<td>상품 카테고리</td>
					<td colspan="2">
						<select id="cGroup" name="cGroup">
							<option selected>-- 대분류 --</option>	
							<option value="침실">침실</option>
							<option value="서재">서재</option>
							<option value="주방">주방</option>
							<option value="거실">거실</option>
							<option value="기타">기타</option>
						</select>
					<select id="cName" name="cName">
						<option>-- 중분류 --</option>
					</select>
					<script>
						$("#cGroup").change(function(){
							var cGroup = $(this).children("option:selected").val();
							var $cName = $("#cName");
							$.ajax({
								url:"<%= request.getContextPath() %>/selectNameList.do",
								data:{cGroup:cGroup},
								type:"get",
								success:function(data){
									console.log("서버 전송 성공!");
									var options = ""; 
									for(var i = 0; i < data.length; i++){
										if(i == 0){
											options += "<option value=\"" + data[i] + "\" selected>" + data[i] + "</option>";
										}else{
											options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
										}
									}	
									$cName.html(options);
								},error:function(data){
									console.log("서버 전송 실패!");
								}
							});
						});
					</script>
					</td>
				</tr>
				<tr>
					<td>상품 등록일</td>
					<td id="selectDate" colspan="2">
						<a href="#" class="btnDate" period="0"><span>오늘</span></a>
						<a href="#" class="btnDate" period="7"><span>7일</span></a>
						<a href="#" class="btnDate" period="30"><span>1개월</span></a>
						<a href="#" class="btnDate" period="90"><span>3개월</span></a>
						<a href="#" class="btnDate" period="365"><span>1년</span></a>
						<a href="#" class="btnDate selected" period="-1"><span>전체</span></a>
						<input type="date" id="startDate" name="startDate" class="dateBox" value=""> ~ 
						<input type="date" id="endDate" name="endDate" class="dateBox" value="">
					</td>
				</tr>
				<tr>
					<td>상품 상태</td>
					<td colspan="2">
						<input type="radio" name="pType" id="all" checked><label for="all">전체</label>
						<input type="radio" name="pType" id="onSale" value="판매중"><label for="onSale">판매중</label>
						<input type="radio" name="pType" id="soldOut" value="판매미등록"><label for="soldOut">판매미등록</label>
					</td>
				</tr>
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색">
				<input type="reset" value="초기화" onclick="location.href='<%=request.getContextPath()%>/adminProductList.do'">
			</div>
		</div>
		</form>
		
		<br>
		
		<div class="selectTopList">
		<span>상품 목록</span><br>
		<span>[총 <a><% if(list != null) { %><%= list.size() %><% }else { %>0<% } %></a>개]</span>
		</div>
		
		<br>
		
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="9" style="height: 45px; text-align: left;">
						<button class="selectBtn" onclick="pTypeChange('판매등록')">판매등록</button>
						<button class="selectBtn" onclick="pTypeChange('판매미등록')">판매미등록</button>
						<button class="selectBtn" onclick="pTypeChange('상품삭제')">상품삭제</button>
					</th>
				</tr>
				<tr>
					<th width="25px"><input type="checkbox" id="allCheck"></th>
					<th width="25px">No</th>
					<th width="100px">상품상태</th>
					<th width="100px">상품분류</th>
					<th width="150px">상품코드</th>
					<th width="110px">상품이미지</th>
					<th width="250px">상품명</th>
					<th width="100px">판매가(원)</th>
					<th width="100px">할인가(%)</th>
				</tr>
				<% for(int i = 0; i < list.size(); i++) { 
				HashMap<String,Object> hmap = list.get(i); %>
				<tr>
					<th><input type="checkbox" class="check" value="<%= hmap.get("pId") %>"></th>
					<td><%= count++ %></td>
					<td><%= hmap.get("status") %></td>
					<td><%= hmap.get("cGroup") %> / <%= hmap.get("cName") %></td>
					<td><%= hmap.get("pId") %></td>
					<td><img src="/jootopia/images/product/<%= hmap.get("changeName") %>" width="60px" height="60px"></td>
					<td><%= hmap.get("pName") %></td>
					<td><%= hmap.get("pPrice") %></td>
					<td><%= hmap.get("sale") %></td>
				</tr>
				<% } %>
			</table>
	</div> <!-- selectListArea -->
	
	<br><br><br>
	<div class="paging" align="center">
		<ul class="pagination">
		<li><a><<</a></li>
		<% if(currentPage <= 1) { %>
		<li><a>이전</a></li>
		<% } else { %>
		<li><a href="<%=request.getContextPath()%>/adminProductList.do?currentPage=<%= currentPage - 1 %>">이전</a></li>
		<% } %>
		
		<% for(int p = startPage; p < endPage; p++) { 
			if(p == currentPage) { %>
			<li><a><%= p %></a></li>
			<% 	}else { %>
			<li><a href="<%=request.getContextPath()%>/adminProductList.do?currentPage=<%= p %>"><%= p %></a></li>	
			<% 	} 
		} %>
		
		<% if(currentPage >= maxPage) { %>
		<li><a>다음</a></li>
		<% }else { %>
		<li><a href="<%=request.getContextPath()%>/adminProductList.do?currentPage=<%= currentPage + 1 %>">다음</a></li>
		<% } %>
		</ul>
	</div>
	</div> <!-- col-sm-10 -->
	</section>
	
	<%@ include file="/views/common/adminFooter.jsp" %>
	
	<script>
		
		//------검색테이블 날짜 관련 펑션
		$(function() {
			var today = new Date().toISOString().substr(0, 10);
			
			console.log(today);
			$("#startDate").attr("disabled", true).val(today);
			$("#endDate").attr("disabled", true).val(today);
		});
		
		$(".btnDate").click(function() {
			
			$("#selectDate>a").removeClass();
			$("#selectDate>a").addClass("btnDate");
			$(this).toggleClass("selected");
			
		});
		
		$(".btnDate").click(function() {
			var date = $(this).attr("period");
			console.log( date );
			
			if(date != -1) {
				$(".dateBox").attr("disabled", false);
				$.ajax({
					url : "searchDate.do",
					data : {date : date},
					success : function(data) {
						console.log("에이잭스 성공");
						console.log(data);
						
						var change = new Date(data).toISOString().substr(0, 10);
						
						console.log(change);
						$("#startDate").val(change);
					},
					error : function(data) {
						console.log("전송실패");
					}
				});
			}else {
				$(".dateBox").attr("disabled", true);
			}
		});
		
		$(".dateBox").click(function() {
			$("#selectDate>a").removeClass();
			$("#selectDate>a").addClass("btnDate");
		});
		
		//------해당 상품정보(게시물) 조회 펑션
		$("#selectList td").mouseenter(function(){
			$(this).parent().css({"background":"rgb(61, 81, 113)", "color":"white", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white", "color":"black"});
		}).click(function(){
			var num = $(this).parent().children().eq(4).text();
			location.href="<%=request.getContextPath()%>/adminProductOne.do?num=" + num;
		});
		
		//------체크된 상품 상태 변화 관련 펑션
		$("#allCheck").click(function() {
			
			if($("#allCheck").prop("checked")) {
				$("input[type=checkBox]").prop("checked", true);
			}else {
				$("input[type=checkBox]").prop("checked", false);
			}
		});
		
		function pTypeChange(text) {
			var answer = window.confirm("선택한 상품을 " + text + " 하시겠습니까?");
			if(answer) {
				var numArr = [];
				$(".check").each(function() {
					if($(this).is(":checked"))
						if($(this) !== $("#allCheck")) {
							numArr += $(this).val() + "|";
						}
				});
				
				console.log( numArr );
				
				$.ajax({
					url : "adminChangeStatusProduct.do",
					type : "post",
					data : {numArr : numArr, text : text},
					success : function(data) {
						alert(data);
						location.href='adminProductList.do';
					},
					error : function(data) {
						alert("해당상품 " + text + " 처리 실패");
					}
				});
			}
		};
		
	</script>
	
</body>
</html>