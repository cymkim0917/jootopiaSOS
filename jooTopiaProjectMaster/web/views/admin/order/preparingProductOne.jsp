<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*, java.lang.*, com.kh.jooTopia.order.model.vo.*, com.kh.jooTopia.payment.model.vo.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
	POrder o = (POrder) hmap.get("o");
	Payment pym = (Payment) hmap.get("pym");
	ArrayList<HashMap<String, Object>> orderDetail = (ArrayList<HashMap<String, Object>>) hmap.get("orderDetail");
	
	int totalPPrice = 0;
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
		<h3 class="title">상품준비중 주문상세</h3>
		<hr>
		
		<div id="infoArea">
		<table id="pInfo1">
			<tr>
				<th>주문코드</th>
				<td><%= o.getPoId() %></td>
			</tr>
			<tr>
				<th>주문일</th>
				<td><%= o.getPoDate() %></td>
			</tr>
			<tr>
				<th>주문상태</th>
				<td><%= o.getStatus() %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="5">주문내역</th>
				</tr>
				<tr>
					<th width="50px">품목별 주문번호</th>
					<th width="50px">상품번호</th>
					<th width="150px">상품명</th>
					<th width="100px">판매가(원)</th>
					<th width="100px">배송비(원)</th>
				</tr>
					<% for(int i = 0; i < orderDetail.size(); i++) { 
						totalPPrice += (int) orderDetail.get(i).get("pPrice");
					%>
					<tr>
						<td><%= orderDetail.get(i).get("odId") %></td>
						<td><%= orderDetail.get(i).get("pId") %>
						<td><%= orderDetail.get(i).get("pName") %></td>
						<td><%= orderDetail.get(i).get("pPrice") %></td>
						<% if(i == 0) { %>
						<td><%= orderDetail.get(0).get("deliveryPrice") %></td>
						<% }else { %>
						<td>0</td>
						<% } %>
					</tr>
					<% } %>
					<tr>
						<th colspan="3">계</th>
						<th><%= totalPPrice %></th>
						<th><%= orderDetail.get(0).get("deliveryPrice") %></th>
					</tr>
			</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">결제정보</th></tr>
			<tr>
				<th>상품구매금액</th>
				<td><%= pym.getProductPrice() %> (원)</td>
			</tr>
			<tr>
				<th>배송비</th>
				<td><%= pym.getDeliveryPrice() %> (원)</td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td><%= pym.getProductPrice() + pym.getDeliveryPrice() %> (원)</td>
			</tr>
			<tr>
				<th>총 실결제금액</th>
				<td><%= pym.getProductPrice() + pym.getDeliveryPrice() %> (원)</td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">결제수단</th>
			<tr>
				<th>결제수단</th>
				<td><%= pym.getPaymentOption() %></td>
			</tr>
			<% if(pym.getPaymentOption().equals("카드")) { %>
			<tr>
				<th>TID</th>
				<td><%= pym.gettId() %></td>
			</tr>
			<tr>
				<th>카드정보</th>
				<td><%= pym.getCardCompany() %></td>
			</tr>
			<% if(pym.getInstallment() > 0) { %>
			<tr>
				<th>결제정보</th>
				<td>결제일 : <%= pym.getPymDate() %> / <%= pym.getInstallment() %>개월 할부</td>
			</tr>
			<% }else { %>
			<tr>
				<th>결제정보</th>
				<td>결제일 : <%= pym.getPymDate() %> / (할부없음)</td>
			</tr>
			<% } %>
			<% }else { %>
			<tr>
				<th>입금자명</th>
				<td><%= pym.getDepositName() %></td>
			</tr>
			<tr>
				<th>입금일</th>
				<td><%= pym.getDepositDate() %></td>
			</tr>
			<% } %>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">주문자 정보</th></tr>
			<tr>
				<th>주문자명</th>
				<td><%= hmap.get("userName") %> (회원)</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%= hmap.get("mPhone") %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">수령자 정보</th></tr>
			<tr>
				<th>수령자명</th>
				<td>
				<input id="name" type="text" value='<%= o.getName() %>' size="50%">
				<button class="memo" onclick="changeCondition('NAME', this)">수정</button>
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
				<input id="phone" type="text" value='<%= o.getPhone() %>' size="50%">
				<button class="memo" onclick="changeCondition('PHONE', this)">수정</button>
				</td>
			</tr>
			<tr>
				<th>배송주소</th>
				<td>
					<input id="address" type="text" value='<%= o.getAddress() %>' size="50%">
					<button class="memo" onclick="changeCondition('ADDRESS', this)">수정</button>
				</td>
			</tr>
			<tr>
				<th>배송메시지</th>
				<td>
				<% if(o.getdMessage() == null) { %>
				<input id="message" type="text" value='' size="50%">
				<% }else { %>
				<input id="message" type="text" value='<%= o.getdMessage() %>' size="50%">
				<% } %>
				<button class="memo" onclick="changeCondition('DMESSAGE', this)">수정</button>
				</td>
			</tr>
		</table>
		</div>
		
		<br>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='selectAdminPreList.do'">확인</button>
			<button onclick="paymentAccCancle('<%= pym.getPymId() %>')">결제취소</button>
		</div>
		<br><br>
		
		</div> <!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>

<script>
	//------계좌이체 건 결제 취소 펑션
	function paymentAccCancle(num) {
		var answer = window.confirm("해당 주문을 결제취소 하시겠습니까?");
		
		if(answer) {
			location.href='insertPaymentCancleAcc.do?num='+num;
		}
	}
	//------해당 상품정보(게시물) 조회 펑션
	$("#selectList td").mouseenter(function(){
		$(this).parent().css({"background":"rgb(61, 81, 113)", "color":"white", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"white", "color":"black"});
	}).click(function(){
		var num = $(this).parent().children().eq(1).text();
		location.href="<%=request.getContextPath()%>/adminProductOne.do?num=" + num;
	});
	
	
	//상태변화
	function changeCondition(text, btn) {
		var poId = '<%= o.getPoId() %>';
		var condition = text;
		var changeValue = $(btn).siblings().val();
		console.log(poId);
		console.log(condition);
		console.log(changeValue);
		
		$.ajax({
			url : "changeConditionOne.do",
			type : "post",
			data : {poId : poId, condition : condition, changeValue : changeValue},
			success : function(data) {
				$(btn).siblings().val(changeValue);
				console.log(changeValue);
				location.href='adminPaymentOne.do?num='+poId;
				alert(data);
			},
			error : function(data) {
				alert("에이젝스 접속실패");
			}
		});
	}
</script>
</body>
</html>