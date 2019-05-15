<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.lang.*, com.kh.jooTopia.board.model.vo.*"%>
<%
	int count = 1;
	ArrayList<HashMap<String,Object>> list = 
	(ArrayList<HashMap<String,Object>>) request.getAttribute("list");
	int delete = 0;
	int refund = 0;
	int sell = 0;
	
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
		<h3 class="title">삭제상품 목록</h3>
		<hr>
		
		<div id="listArea">
			<% if(list != null) { 
				for(int i = 0; i < list.size(); i++) {
					if(list.get(i).get("status").equals("삭제상품")) {
						delete += 1;
					}else if(list.get(i).get("status").equals("환불완료")) {
						refund += 1;
					}else {
						sell += 1;
					}
				}
			%>
				전체 <a href="#"><%= list.size() %></a>건  |  
				삭제상품 <a href="#"><%= delete %></a>건  |
				환불완료 <a href="#"><%= refund %></a>건  |
				판매완료 <a href="#"><%= sell %></a>건
			<% }else { %>
				전체 <a href="#">0</a>건  |  
				삭제상품 <a href="#">0</a>건  |
				환불완료 <a href="#">0</a>건  |
				판매완료 <a href="#">0</a>건
			<% } %>
		</div>
		<br>
		
		<div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="height: 35px;">　</th></tr>
				<tr>
					<td>검색 분류</td>
					<td colspan="2">
						<select id="searchCondition">
							<option value="pName">상품명
							<option value="pCode">상품코드
						</select>
						<input type="search" placeholder="검색 단어를 입력하세요." width="20px">
					</td>
				</tr>
				<tr>
					<td>상품 카테고리</td>
					<td colspan="2">
						<select id="cGroup">
							<option selected>-- 대분류 --</option>	
							<option value="침실">침실</option>
							<option value="서재">서재</option>
							<option value="주방">주방</option>
							<option value="거실">거실</option>
							<option value="기타">기타</option>
						</select>
					<select id="cName">
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
						<a href="#" class="btnDate" period="-1"><span>전체</span></a>
						<input type="date" id="startDate" name="startDate" class="date" value=""> ~ 
						<input type="date" id="endDate" name="endDate" class="date" value="">
					</td>
				</tr>
				<tr>
					<td>상품 상태</td>
					<td colspan="2">
						<input type="radio" name="pType" id="all"><label for="all">전체</label>
						<input type="radio" name="pType" id="refund"><label for="refund">환불완료</label>
						<input type="radio" name="pType" id="delete"><label for="delete">삭제상품</label>
						<input type="radio" name="pType" id="sell"><label for="sell">판매완료</label>
					</td>
				</tr>
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
		</div>
		
		<br>
		
		<div class="selectTopList">
		<span>상품 목록</span><br>
		<span>[총 <a><% if(list != null) { %><%= list.size() %><% }else { %>0<% } %></a>개]</span>
		</div>
		
		<br>
		
		<div class="selectListArea">
			<form action="" method="post">
				<table id="selectList" class="selectList" border="1">
					<tr>
						<th colspan="9" style="height: 45px; text-align: left;">
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
			</form>
		</div> <!-- selectListArea -->
		
	<br><br><br>
	<div class="paging" align="center">
		<ul class="pagination">
		<% if(currentPage <= 1) { %>
		<li><a>이전</a></li>
		<% } else { %>
		<li><a href="<%=request.getContextPath()%>/adminDeleteProductList.do?currentPage=<%= currentPage - 1 %>">이전</a></li>
		<% } %>
		
		<% for(int p = startPage; p <= endPage; p++) { 
			if(p == currentPage) { %>
		<li><a><%= p %></a></li>
		<% 	}else { %>
		<li><a href="<%=request.getContextPath()%>/adminDeleteProductList.do?currentPage=<%= p %>"><%= p %></a></li>	
		<% 	} 
		} %>
		
		<% if(currentPage >= maxPage) { %>
		<li><a>다음</a></li>
		<% }else { %>
		<li><a href="<%=request.getContextPath()%>/adminDeleteProductList.do?currentPage=<%= currentPage + 1 %>">다음</a></li>
		<% } %>
		</ul>
	</div>
		
	</div> <!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>

	<script>
	
		$("#selectList td").mouseenter(function(){
			$(this).parent().css({"background":"rgb(61, 81, 113)", "color":"white", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white", "color":"black"});
		}).click(function(){
			var num = $(this).parent().children().eq(4).text();
			console.log(num);
			
		});
		
		$(".btnDate").click(function() {
			
			$("#selectDate>a").removeClass();
			$("#selectDate>a").addClass("btnDate");
			$(this).toggleClass("selected");
			
		})
		
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
					location.href='adminDeleteProductList.do';
				},
				error : function(data) {
					alert("해당상품 " + text + " 처리 실패");
				}
			});
		}
	};
		
		$("#allCheck").click(function() {
			
			if($("#allCheck").prop("checked")) {
				$("input[type=checkBox]").prop("checked", true);
			}else {
				$("input[type=checkBox]").prop("checked", false);
			}
		})
		
	</script>
</body>
</html>