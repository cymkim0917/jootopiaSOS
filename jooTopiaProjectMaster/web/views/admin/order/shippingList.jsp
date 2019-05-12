<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import="com.kh.jooTopia.product.model.vo.*, java.util.*, java.lang.*" -->
<%
	int count = 1;
	String memo = "��۸޽��� �ӽ�";
	
	/* Product productList = (Product) session.getAttribute("productList");
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String startDay = dateFormat.format(date);
	String endDay = dateFormat.format(date);
	
	ArrayList<Product> list = new ArrayList<Product>();
	list.add(new Product()); */
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<!-- <link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js"> -->
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<title>JooTopia</title>
<style>
br 
{mso-data-placement:same-cell;} 
</style>
</head>
<body>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3>����� ����</h3>
		<hr>
		
		<div id="listArea">
			��ü <a href="/jootopia/views/admin/order/paymentList.jsp">10</a>��
		</div>
		<br>
		
		<div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">��</th></tr>
				<tr>
					<td>�˻� �з�</td>
					<td colspan="2">
						<select id="searchCondition">
							<option value="pName">��ǰ��
							<option value="pCode">��ǰ�ڵ�
							<option value="oCode">�ֹ��ڵ�
							<option value="userName">�ֹ��ڸ�
							<option value="userId">�ֹ��� ���̵�
							<option value="phone">�ֹ��� ��ȭ��ȣ
						</select>
						<input type="search" placeholder="�˻� �ܾ �Է��ϼ���." width="20px">
					</td>
				</tr>
				<tr>
					<td>�ֹ���</td>
					<td id="selectDate" colspan="2">
						<a href="#" class="btnDate" period="0"><span>����</span></a>
						<a href="#" class="btnDate" period="7"><span>7��</span></a>
						<a href="#" class="btnDate" period="30"><span>1����</span></a>
						<a href="#" class="btnDate" period="90"><span>3����</span></a>
						<a href="#" class="btnDate" period="365"><span>1��</span></a>
						<a href="#" class="btnDate" period="-1"><span>��ü</span></a>
						<input type="date" id="startDate" name="startDate" class="date" value=""> ~ 
						<input type="date" id="endDate" name="endDate" class="date" value="">
					</td>
				</tr>
				<tr>
					<td>�����</td>
					<td id="selectDate" colspan="2">
						<a href="#" class="btnDate" period="0"><span>����</span></a>
						<a href="#" class="btnDate" period="7"><span>7��</span></a>
						<a href="#" class="btnDate" period="30"><span>1����</span></a>
						<a href="#" class="btnDate" period="90"><span>3����</span></a>
						<a href="#" class="btnDate" period="365"><span>1��</span></a>
						<a href="#" class="btnDate" period="-1"><span>��ü</span></a>
						<input type="date" id="startDate" name="startDate" class="date" value=""> ~ 
						<input type="date" id="endDate" name="endDate" class="date" value="">
					</td>
				</tr>
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="�˻�" onclick="">
				<input type="reset" value="�ʱ�ȭ" onclick="">
			</div>
		</div>
		
		<br><br><br><br>
		
		<div class="selectTopList">
		<span>�ֹ� ���</span><br>
		<span>[�� <a style="color: rgb(243, 156, 18);"><%= 1 %></a>��]</span>
		</div>
		
		<br>
		
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="9" style="height: 45px; text-align: left;">
						<button class="selectBtn" onclick="oTypeChange('��� �Ϸ�')">��� �Ϸ�</button>
					</th>
				</tr>
				<tr>
					<th width="25px"><input type="checkbox" id="allCheck"></th>
					<th width="25px">No</th>
					<th width="70px">�ֹ�����</th>
					<th width="150px">�ֹ���/�ֹ��ڵ�</th>
					<th width="90px">��ۿ�����</th>
					<th width="70px">����ڵ�</th>
					<th width="300px">�ֹ���</th>
					<th width="100px">��ǰ��</th>
					<th width="100px">���۸޽���</th>
				</tr>
				<%-- <% for(Product p : list) { %>
				<tr>
					<td ><input type="checkbox"></td>
					<td><%= count++ %></td>
					<td >�ֹ�����</td>
					<td>�ֹ���<br>/ �ֹ��ڵ� �ӽ�</td>
					<td>��ۿ����� �ӽ�</td>
					<td><a href="#">����ڵ� �ӽ�</a></td>
					<td>�ֹ��� �ӽ�</td>
					<td>��ǰ��</td>
					<td><div id="memo" class="memo">MEMO</div></td>
				</tr>
				<% } %> --%>
			</table>
		
	</div> <!-- selectListArea -->
		
		</div> <!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>


<!-- The Modal -->
<div id="memoModal" class="memoModal">
	<div class="memoModalContent">
	<div class="memoModalHeader">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>������ ��۸޽���</h4>
	<hr>
	</div>
	
	<!-- Modal content -->
    <div class="memoModalBody">
    	<table class="memoModalTable">
    		<tr>
    			<th>�ֹ��ڵ� : <%= "�ֹ��ڵ� �ӽ�" %><br />
    			�ֹ��� : <%= "�ֹ��� �ӽ�" %></th>
    		</tr>
    	</table>
    	<br>
        <table class="memoModalTable">
    		<tr>
    			<th>��۸޽���</th>
    		</tr>
    		<tr>
    			<td><input type="text" name="oMemo" value="<%= "��۸޽��� �ӽ�" %>" readonly></td>
    		</tr>
    	</table>
    	<br>
    	
    	<div class="modalBtnArea" align="center">
				<input type="reset" value="�ݱ�">
		</div>
    </div>
    </div>
</div>

<script>

	$(document).ready(function() {
		if(true) {
			$("#memo").css("background","rgb(52, 152, 219)");
		}
	});

	$(".btnDate").click(function() {
		
		$("#selectDate>a").removeClass();
		$("#selectDate>a").addClass("btnDate");
		$(this).toggleClass("selected");
		
	});
	
	function oTypeChange(text) {
		var answer = window.confirm("������ �ֹ��� " + text + " �Ͻðڽ��ϱ�?");
		
		if(answer) {
			alert("�ش��ֹ��� " + text + " ó�� �Ͽ����ϴ�.");
		}
	};
	
	$("#allCheck").click(function() {
		
		if($("#allCheck").prop("checked")) {
			$("input[type=checkBox]").prop("checked", true);
		}else {
			$("input[type=checkBox]").prop("checked", false);
		}
	});
	
	$(".memo").click(function() {
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
		
	})
	
    	
</script>
</body>
</html>