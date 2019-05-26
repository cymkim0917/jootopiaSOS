<%@page import="com.kh.jooTopia.delivery.model.vo.Delivery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.board.model.vo.*, com.kh.jooTopia.order.model.vo.*, com.kh.jooTopia.payment.model.vo.*, java.util.*, java.lang.*"%>
<%
	int count = 1;
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int currentPage = pageInfo.getCurrentPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
	int refundIng = 0;
	int refundCompleted = 0;
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
		<h3 class="title">환불 관리</h3>
		<hr>
		<br>
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="11" style="height: 45px; text-align: left;">
						<button class="selectBtn" onclick="refund()">환불완료</button>
					</th>
				</tr>
				<tr>
					<th width="25px"><input type="checkbox" id="allCheck"></th>
					<th width="25px">No</th>
					<th width="50px">결제취소번호</th>
					<th width="150px">결제취소일</th>
					<th width="50px">결제번호</th>
					<th width="100px">결제방법</th>
					<th width="250px">환불금액</th>
					<th width="100px">환불여부</th>
					<th width="50px">환불번호</th>
					<th width="100px">환불날짜</th>
					<th width="100px">환불사유</th>
				</tr>
				<% for(int i = 0; i < list.size(); i++) { 
					Payment pym = (Payment) list.get(i).get("pym");
					PaymentCancle cancle = (PaymentCancle) list.get(i).get("cancle"); 
					Refund r = (Refund) list.get(i).get("r"); 
					%>
				<tr>
					<th><input type="checkbox" class="check" value="<%= cancle.getPymCId() %>"></th>
					<td><%= count++ %></td>
					<td><%= cancle.getPymCId() %></td>
					<td><%= cancle.getPymCDate() %></td>
					<td><%= pym.getPymId() %></td>
					<td><%= pym.getPaymentOption() %></td>
					<td><span class="price"><%= pym.getProductPrice() + pym.getDeliveryPrice() %></span></td>
					<td><%= cancle.getRefundNY() %></td>
					<% if(r.getRfId() > 0) { %>
					<td><%= r.getRfId() %></td>
					<td><%= r.getRfDate() %></td>
					<% }else { %>
					<td>-</td>
					<td>-</td>
					<% } %>
					<th>
					<div id="memo" class="memo">MEMO
					</div>
					<input type="hidden" id="dMsg" value="<%= cancle.getReason() %>">
					</th>
				</tr>	
				<% } %>
			</table>
	</div> <!-- selectListArea -->
	
	<br><br><br>
	<div class="paging" align="center">
		<ul class="pagination">
		<% if(currentPage <= 1) { %>
		<li><a>이전</a></li>
		<% } else { %>
		<li><a href="<%=request.getContextPath()%>/refundAdminList.do?currentPage=<%= currentPage - 1 %>">이전</a></li>
		<% } %>
		
		<% for(int p = startPage; p < endPage; p++) { 
			if(p == currentPage) { %>
			<li><a><%= p %></a></li>
			<% 	}else { %>
			<li><a href="<%=request.getContextPath()%>/refundAdminList.do?currentPage=<%= p %>"><%= p %></a></li>	
			<% 	} 
		} %>
		
		<% if(currentPage >= maxPage) { %>
		<li><a>다음</a></li>
		<% }else { %>
		<li><a href="<%=request.getContextPath()%>/refundAdminList.do?currentPage=<%= currentPage + 1 %>">다음</a></li>
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
	<h4>취소사유</h4>
	<hr>
	</div>
	
	<!-- Modal content -->
    <div class="memoModalBody">
    	<table class="memoModalTable">
    		<tr>
    			<th>결제취소코드 : <span id="modalPymCId">결제취소코드임시</span><br>
    			결제취소일 : <span id="modalPymCDate">결제취소일임시</span></th>
    		</tr>
    	</table>
    	<br>
        <table class="memoModalTable">
    		<tr>
    			<th>취소사유</th>
    		</tr>
    		<tr>
    			<td><input type="text" id="reason" name="reason" value="" readonly></td>
    		</tr>
    	</table>
    	<br>
    	
    	<div class="modalBtnArea" align="center">
				<input type="reset" value="닫기">
		</div>
    </div>
    </div>
</div>

<!-- refund Modal -->
<div id="refundModal" class="memoModal">
	<div class="memoModalContent">
	<div class="memoModalHeader">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>환불처리</h4>
	<hr>
	</div>
	
	<!-- Modal content -->
    <div class="memoModalBody">
    	<table class="memoModalTable">
    		<tr>
    			<th>주문코드 : <span id="modalPoId">주문코드임시</span><br>
    			주문일 : <span id="modalPoDate">주문일임시</span></th>
    		</tr>
    	</table>
    	<br>
    	<table id="refundModalTable1" class="memoModalTable">
    		<tr>
				<th colspan="2">환불 정보</th>    		
    		</tr>
    		<tr>
    			<th>결제코드</th>
    			<td><%= "P20190510_01" %></td>
    		</tr>
    		<tr>
    			<th>결제일</th>
    			<td><%= "2019-05-10" %></td>
    		</tr>
    		<tr>
    			<th>결제수단</th>
    			<td><%= "결제수단 임시" %></td>
    		</tr>
    		<tr>
    			<th>결제정보</th>
    			<td><%= "결제정보 임시" %></td>
    		</tr>
    	</table>
    	<br>
    	<table id="refundModalTable2" class="memoModalTable">
    		<tr>
    			<th height="50px;">판매가</th>
    			<td><%= "판매가 임시" %></td>
    		</tr>
    		<tr>
    			<th>배송비</th>
    			<td><%= "배송비 임시" %></td>
    		</tr>
    		<tr>
    			<th>환불금액</th>
    			<td>
    			<input type="number" value="<%= 25000 %>">
    			</td>
    		</tr>
    	</table>
    	<br>
        <table id="refundModalTable3" class="memoModalTable">
    		<tr>
    			<th>취소사유</th>
    			<td><%= "취소사유 임시" %></td>
    		</tr>
    	</table>
    	<br>
    	
    	<div class="modalBtnArea" align="center">
    		<input type="submit" value="환불">
			<input type="reset" value="닫기">
		</div>
    </div>
    </div>
</div>

<script>
//환불사유 모달 펑션
	$(".memo").click(function() {
		var modalPymCId = $(this).parent().parent().children().eq(0).children().eq(0).val();
		var modalPymCDate = $(this).parent().parent().children().eq(3).text();
		var reason = $(this).parent().children().eq(1).val();
		
		if(reason == "null") {
			reason = "-";
		}
		
		$(function() {
			$("#modalPymCId").text(modalPymCId);
			$("#modalPymCDate").text(modalPymCDate);
			$("#reason").val(reason);
		});
		
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
	});
	
	$(".btnDate").click(function() {
		
		$("#selectDate>a").removeClass();
		$("#selectDate>a").addClass("btnDate");
		$(this).toggleClass("selected");
		
	});
	
	//-----환불처리용 펑션
	function refund() {
		var answer = window.confirm("선택한 주문을 환불처리 하시겠습니까?");
		
		if(answer) {
			var numArr = [];
			var price = [];
			$(".check").each(function() {
				if($(this).is(":checked"))
					if($(this) !== $("#allCheck")) {
						numArr += $(this).val() + "|";
						price += $(this).parent().parent().children().eq(6).text() + "|";
					}
			});
			
			console.log( numArr );
			console.log( price );
			
			$.ajax({
				url : "insertAdminRefund.do",
				type : "post",
				data : {numArr : numArr, price : price},
				success : function(data) {
					alert(data);
					location.href='refundAdminList.do';
				},
				error : function(data) {
					alert("해당상품 환불 처리 실패");
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
	});
	
	$("#memo").click(function() {
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
		
	});
</script>
</body>
</html>