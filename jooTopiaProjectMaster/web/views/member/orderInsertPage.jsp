<%@page import="com.kh.jooTopia.board.model.vo.Attachment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.lang.*, com.kh.jooTopia.product.model.vo.*"%>
<% 
	ArrayList<HashMap<String,Object>> productList = (ArrayList<HashMap<String,Object>>) request.getAttribute("productList"); 
	int totalPrice = 0;
	int deliveryPrice = 30000; //배송비 임시
	String pIdArr = "";
	String account = "(주)주토피아 / 신한 / 000-11111-22222";
	String orderName = "주토피아 : ";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<link rel="stylesheet" href="/jootopia/css/user/semantic.css">

<title>JooTopia</title>
<style>
	div>h1{
		text-align:center;
		font-weight:bold;
	}
	#modifyBtn{
		width:100px;
		background-color: #FFBB00;
	   border: none;
	   color:#fff;
	   padding: 15px 0;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 15px;
	   margin: 4px;
	   cursor: pointer;
	   border-radius:10px;
	}
	#delBtn{
		width:100px;
		background-color: #7A7A7A;
		border: none;
		color:#fff;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
	}	
	#btnArea{
		text-align:center;
	}
	table{
		text-align:center;
	}
	#cartTable>td{
		height:120px;
		margin-top:auto;
	}
	th{
		text-align: center !important;
	}
	.btn {
		width: 200px;
		height: 50px;
		background: rgb(53, 15, 15);
		color: white;
		margin: 10px;
	}
	.btn:hover {
		background: #FFBB00;
		color: rgb(53, 15, 15);
	}
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
<%@ include file="/views/member/temp.jsp" %>
	<section>
		<br /><br />
		<div class="row">
			<h1>주문하기</h1>
			<br /><br />
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
			<form id="order" action="" method="post">
				<table class="table" align="center">
					<tr>
						<th colspan="4">
						<h3>회원 정보</h3>
						<input type="text" name="uno" value="<%= loginUser.getUno() %>" hidden="hidden">
						</th>
					</tr>
					<tr>
						<th colspan="2">회원명</th>
						<td colspan="2"><%=loginUser.getUserName() %></td>
					</tr>
					<tr>
						<th colspan="2">전화번호</th>
						<td colspan="2"><%=loginUser.getPhone() %></td>
					</tr>
					<tr>
						<th colspan="2">주소</th>
						<td colspan="2"><%=loginUser.getAddress() %></td>
					</tr>
				</table>
				<table class="table" align="center">
					<tr>
						<th colspan="4"><h3>수령자 정보</h3></th>
					</tr>
					<tr>
						<th colspan="4"><input type="checkbox" id="checkInfo" name="checkInfo"> &nbsp;&nbsp; <label for="checkInfo">수령자 정보가 회원 정보와 같으면 체크해주세요.</label></th>
					</tr>
					<tr>
						<th colspan="2">받으실 분 성함</th>
						<td colspan="2"><input id="name" name="name" style="width:100%" value=""></td>
					</tr>
					<tr>
						<th colspan="2">전화번호</th>
						<td colspan="2"><input id="phone" name="phone" style="width:100%" value=""></td>
					</tr>
					<tr>
						<th colspan="2">주소</th>
						<td colspan="2"><input id="address" name="address" style="width:100%" value=""></td>
					</tr>
					<tr>
						<th colspan="2">배송메시지</th>
						<td colspan="2"><input type="text" id="dMessage" name="dMessage" style="width:100%" value=""></td>
					</tr>
				</table>
				<br><br><br>
				<table class="table" id="cartTable">
					<tr>
						<th colspan="4"><h3>구매상품 정보</h3></th>
					</tr>
					<tr>
						<th>이미지</th>
						<th>상품번호</th>
						<th>제품명</th>
						<th>가격</th>
					</tr>
					<% for(int i = 0; i < productList.size(); i++) { 
					HashMap<String, Object> hmap = productList.get(i);
					Product p = (Product) hmap.get("p");
					Attachment a = (Attachment) hmap.get("a");
					
					totalPrice += Integer.parseInt(String.valueOf(p.getpPrice()));
					pIdArr += p.getpId() + "|";
					
					if(i == 0) {
						orderName += p.getpName();
					}else if(productList.size() > 1 && i == productList.size() - 1){
						orderName += " 외 " + (i) + "건";
					}
					%>
					<tr>
						<td><img src="/jootopia/images/product/<%= a.getChangeName() %>" width="60px" height="60px"></td>
						<td><%= p.getpId() %></td>
						<td><%= p.getpName() %></td>
						<td><%= p.getpPrice() %></td>
					</tr>
					<% 
					} %>
					<tr hidden="hidden">
						<td><input type="text" name="pIdArr" value="<%= pIdArr %>"></td>					
					</tr>
				</table>
				<table class="table">
					<tr>
						<td colspan="2">상품 금액</td>
						<td colspan="2">
						<%= totalPrice %>
						<input type="text" name="productPrice" value="<%= totalPrice %>" hidden="hidden">
						</td>
					</tr>
					<tr>
						<td colspan="2">배송비</td>
						<td colspan="2">
						<%= deliveryPrice %>
						<input type="text" name="deliveryPrice" value="<%= deliveryPrice %>" hidden="hidden">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="color:red; height:50px; font-weight:bold;">총 상품 금액</td>
						<td colspan="2" style="color:red; height:50px; font-weight:bold;"><%= totalPrice + deliveryPrice %></td>
					</tr>				
				</table>
				<table class="table" align="center">
					<tr>
						<th colspan="4"><h3>결제 방식</h3></th>
					</tr>
					<tr>
						<td colspan="1"></td>
						<td colspan="2"><div class="btn" id="account" name="account">계좌이체</div>
						<div class="btn" id="card" name="card" onclick="cardOrder()">카드결제</div></td>
						<td colspan="1"></td>
					</tr>
				</table>
				<table class="table" id="payment" align="center">
					<tr><td colspan="4"><td></tr>
				</table>
				</form>
			</div>
			<div class="col-sm-3"></div>		
		</div>
	</section>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
		//수령자 정보가 회원정보와 같다고 체크했을 때
		$("#checkInfo").click(function() {
			if($(this).prop("checked")) {
				$("#name").val("<%=loginUser.getUserName()%>");
				$("#phone").val("<%=loginUser.getPhone()%>");
				$("#address").val("<%=loginUser.getAddress()%>");
			}else {
				$("#name").val("");
				$("#phone").val("");
				$("#address").val("");
			}
		});
		
		$("#account").click(function() {
			var account = '<%= account %>'
			var type = $(this).text();
			var $t = $("#payment tbody");
			
			if(type == "계좌이체") {
				$t.children().remove();
				$t.append('<tr> <td colspan="4"><h4>계좌이체</h4></td> </tr>');
				$t.append('<tr> <td colspan="4"> 입금계좌 : ' + account + ' </td></tr>');
				$t.append('<tr> <td colspan="2">입금자명 : </td> <td colspan="2"><input type="text" id="depositName" name="depositName" placeholder="입금자명을 입력하세요" style="width:100%" value=""></td> </tr>');
				$t.append('<tr> <td colspan="4"><div class="btn" id="accountOrder" onclick="accountOrder()">주문하기</div></td></tr>');
			}
		});
		
		function accountOrder() {
			$("#order").attr("action","<%=request.getContextPath()%>/insertAccountPayment.do").submit();		
		};
		
		function cardOrder() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp10998160');
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 10,
			    buyer_email : '',
			    buyer_name : '<%= loginUser.getUserName() %>',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	console.log("결제성공");
			    	$.ajax({
			        	url : "cardPayment.do",
			        	data : {
			        		productPrice : '<%= totalPrice %>',
			        		deliveryPrice : '<%= deliveryPrice %>',
			        		paymentOption : rsp.pay_method,
			        		status : rsp.status,
			        		cardCompany : rsp.card_name,
			        		cardKind : rsp.card_name,
			        		installment : rsp.card_quota,
			        		uno : '<%= loginUser.getUno() %>',
			        		tId : rsp.pg_tid,
			        		//----
			        		name : $("#name").val(),
			        		phone : $("#phone").val(),
			        		address : $("#address").val(),
			        		dMessage : $("#dmessage").val(),
			        		//----
			        		pIdArr : '<%= pIdArr %>'
			        	},
			        	success : function(data) {
			        		alert("주문성공!");
			        		location.href="orderList.do";
			        	}
			        });
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}
</script>

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>