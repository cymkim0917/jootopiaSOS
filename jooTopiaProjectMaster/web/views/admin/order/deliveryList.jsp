<%@page import="com.kh.jooTopia.delivery.model.vo.Delivery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.board.model.vo.*, com.kh.jooTopia.order.model.vo.* ,java.util.*, java.lang.*"%>
<%
	int count = 1;
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	
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
<style>
table th, td {
    border-top: 1px solid #ccc;  	
}
</style>
</head>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3 class="title">배송중 관리</h3>
		<hr>
		<br>
		<div class="selectListArea">
			<table id="selectList" class="selectList" >
				<tr>
					<th colspan="8" style="height: 45px; text-align: left;">
						<button class="selectBtn" onclick="deliveryCompleted()">배송완료</button>
					</th>
				</tr>
				<tr>
					<th width="25px"><input type="checkbox" id="allCheck"></th>
					<th width="25px">No</th>
					<th width="100px">배송상태</th>
					<th width="150px">주문일/주문코드</th>
					<th width="90px">배송예정일</th>
					<th width="150px">배송코드</th>
					<th width="70px">주문자</th>
					<th width="250px">상품명</th>
				</tr>
				<% for(int i = 0; i < list.size(); i++) { 
					HashMap<String,Object> hmap = list.get(i);
					POrder o = (POrder)hmap.get("o");
					Delivery d = (Delivery)hmap.get("d");
					int beforeDId = 0;
					System.out.println("list : " + list);
				%>
				<% if(i > 0) { 
				Delivery beforeD = (Delivery) list.get(i-1).get("d");
				beforeDId = beforeD.getdId();
				} %>
				<% if(i >= 0 && d.getdId() != beforeDId) { 
				%>
					<tr>
						<th><input type="checkbox" class="check" value="<%= d.getdId() %>"></th>
						<td><%= count++ %></td>
						<td><%= d.getStatus() %></td>
						<td><%= o.getPoDate() %> / <%= o.getPoId() %></td>
						<% if(hmap.get("startDate") != null) { %>
						<td><%= hmap.get("startDate") %></td>
						<% }else { %>
						<td>미정</td>
						<% } %>
						<td><%= d.getdId() %></td>
						<td><%= o.getName() %></td>
						<td><%= hmap.get("pName") %></td>
					</tr>
					<% } %>
				<% } %>
			</table>
		
	</div> <!-- selectListArea -->
	
	<br><br><br>
	<div class="paging" align="center">
		<ul class="pagination">
		<% if(currentPage <= 1) { %>
		<li><a>이전</a></li>
		<% } else { %>
		<li><a href="<%=request.getContextPath()%>/selectAdminDeliveryList.do?currentPage=<%= currentPage - 1 %>">이전</a></li>
		<% } %>
		
		<% for(int p = startPage; p < endPage; p++) { 
			if(p == currentPage) { %>
			<li><a><%= p %></a></li>
			<% 	}else { %>
			<li><a href="<%=request.getContextPath()%>/selectAdminDeliveryList.do?currentPage=<%= p %>"><%= p %></a></li>	
			<% 	} 
		} %>
		
		<% if(currentPage >= maxPage) { %>
		<li><a>다음</a></li>
		<% }else { %>
		<li><a href="<%=request.getContextPath()%>/selectAdminDeliveryList.do?currentPage=<%= currentPage + 1 %>">다음</a></li>
		<% } %>
		</ul>
	</div>
	
	</div> <!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>


<!-- The Modal -->
<div id="memoModal" class="memoModal">
	<div class="memoModalContent">
	<div class="memoModalHeader">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>배송정보 수정</h4>
	<hr>
	</div>
<!-- Modal content -->
    <div class="memoModalBody">
    	<table class="memoModalTable">
    		<tr>
    			<th>배송코드 : <span id="modalDId">배송코드임시</span><br>
    			주문코드 : <span id="modalPoId">주문코드임시</span><br>
    			주문일 : <span id="modalPoDate">주문일임시</span></th>
    		</tr>
    	</table>
    	<br>
        <table class="memoModalTable">
        	<tr>
        		<th colspan="2">배송지 정보</th>
        	</tr>
        	<tr>
    			<th>수령자명</th>
    			<td>
    			<input type="text" id="modalName" name="modalName" value="">
    			</td>
    		</tr>
    		<tr>
    			<th>연락처</th>
    			<td>
    			<input type="text" id="modalPhone" name="modalPhone" value="">
				</td>
    		</tr>
    		<tr>
    			<th>배송지 주소</th>
    			<td>
    			<input type="text" id="modalAddress" name="modalAddress" value="">
    			</td>
    		</tr>
    		<tr>
    			<th>배송메시지</th>
    			<td>
    			<input type="text" id="oMemo" name="oMemo" placeholder="배송메시지를 입력하세요" value="">
    			</td>
    		</tr>
    		<tr>
    			<th>배송일</th>
    			<td>
    			<input type="date" id="dStartDate" name="dStartDate" value="">
    			</td>
    		</tr>
    	</table>
    	<br>
    	<div class="modalBtnArea" align="center">
				<input type="submit" value="수정" onclick="changeDelivery();">
				<input type="reset" value="닫기">
		</div>
    </div>
    </div>
</div>

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

	$("#allCheck").click(function() {
		
		if($("#allCheck").prop("checked")) {
			$("input[type=checkBox]").prop("checked", true);
		}else {
			$("input[type=checkBox]").prop("checked", false);
		}
	});
	
	//배송정보 모달용 펑션
	$(".memo").click(function() {
		var dId = $(this).parent().parent().children().eq(5).text();
		
		//배송정보 출력용 에이젝스
		$.ajax({
			url : "selectDeliveryModal.do",
			type : "post",
			data : {dId : dId},
			success : function(data) {
				
				console.log(data);
				console.log(data["o"]);
				console.log(data["d"]);
				
				var order = data["o"];
				var delivery = data["d"];
				var startDate = data["startDate"];
				
				//조회 성공 시 모달에 넣어주기
				$(function() {
					$("#modalDid").text(delivery.dId);
					$("#modalPoId").text(order.poId);
					$('#modalPoDate').text(order.poDate);
					
					$("#modalName").val(order.name);
					$("#modalPhone").val(order.phone);
					$("#modalAddress").val(order.address);
					$("#oMemo").val(order.dMessage);
					if(startDate != null) {
						$("#dStartDate").val(startDate);
					}else {
						var today = new Date().toISOString().substr(0, 10);
						console.log("오늘날짜 : " + today);
						$("#dStartDate").val(today);
					}
					$("#modalDId").text(dId);
				});
			},
			error : function(data) {
				alert(data);
			}
		});
		
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
	});
	
	//배송정보 변경 및 배송중 처리
	function changeDelivery() {
		
		var poId = $("#modalPoId").text();
		var name = $("#modalName").val();
		var phone = $("#modalPhone").val();
		var address = $("#modalAddress").val();
		var dMessage = $("#oMemo").val();
		var startDate = $("#dStartDate").val();
		
		$.ajax({
			url : "updateAdminDeliveryModal.do",
			type : "post",
			data : {poId : poId, name : name, phone : phone, address : address, dMessage : dMessage, startDate : startDate},
			success : function(data) {
				location.href='selectAdminDeliveryList.do';
				alert(data);
			},
			error : function(data) {
				alert("에이젝스 접속실패");
			}
		});
	};
	
	//------체크된 주문 상태 변화 관련 펑션
	$("#allCheck").click(function() {
		
		if($("#allCheck").prop("checked")) {
			$("input[type=checkBox]").prop("checked", true);
		}else {
			$("input[type=checkBox]").prop("checked", false);
		}
	});
	
	function deliveryCompleted() {
		var answer = window.confirm("선택한 상품을 배송완료 처리 하시겠습니까?");
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
				url : "changeDeliveryStatus.do",
				type : "post",
				data : {numArr : numArr},
				success : function(data) {
					alert(data);
					location.href='selectAdminDeliveryList.do';
				},
				error : function(data) {
					alert("해당상품 배송완료 처리 실패");
				}
			});
		}
	};
	
	//------해당 배송정보(게시물) 조회 펑션
	$("#selectList td").mouseenter(function(){
		$(this).parent().css({"background":"rgb(242, 242, 242)", "color":"black", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"white", "color":"black"});
	}).click(function(){
		var num = $(this).parent().children().eq(5).text();
		location.href="<%=request.getContextPath()%>/selectAdminDelOne.do?num=" + num;
	});
</script>
</body>
</html>
