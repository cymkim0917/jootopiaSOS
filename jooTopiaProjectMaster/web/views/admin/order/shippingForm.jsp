<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import="java.util.*, java.lang.*, com.kh.jooTopia.order.model.vo.*" -->
<%
	/* ArrayList<Order> list = new ArrayList<Order>();
	list.add(new Order()); */
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<!-- <link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js"> -->
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<style>

</style>
<title>JooTopia</title>
</head>
<body>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3>����� �ֹ���</h3>
		<hr>
		
		<div id="infoArea">
		<table id="pInfo1">
			<tr>
				<th>��ǰ��</th>
				<td><%= "��ǰ�� �ӽ�" %></td>
			</tr>
			<tr>
				<th>�ֹ��ڵ�</th>
				<td><%= "�ֹ��ڵ� �ӽ�" %></td>
			</tr>
			<tr>
				<th>�ֹ�����</th>
				<td><%= "�ֹ����� �ӽ�" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div id="infoArea">
		<table id="pInfo1">
			<tr>
				<th>����ڵ�</th>
				<td><%= "����ڵ� �ӽ�" %></td>
			</tr>
			<tr>
				<th>��ۿ�����</th>
				<td><%= "��ۿ����� �ӽ�" %></td>
			</tr>
			<tr>
				<th>��۱�� ����</th>
				<td><%= "��۱�� ���� �ӽ�" %></td>
			</tr>
			<tr>
				<th>����� �ּ�</th>
				<td><%= "(�����ȣ) ����� �ּ� �ӽ�" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="7">�ֹ�����</th>
				</tr>
				<tr>
					<th width="25px"><input type="checkbox" id="allCheck"></th>
					<th width="200px">ǰ�� �ֹ���ȣ</th>
					<th width="150px">��ǰ��</th>
					<th width="30px">����</th>
					<th width="100px">�ǸŰ�(��)</th>
					<th width="100px">��ۺ�(��)</th>
					<th width="100px">�ֹ�����</th>
				</tr>
				<%-- <% for(Order o : list) { %>
				<tr>
					<td><input type="checkbox"></td>
					<td>ǰ�� �ֹ���ȣ</td>
					<td><a href="../product/productInfo.jsp">��ǰ��</a></td>
					<td>����</td>
					<td>�ǸŰ�</td>
					<td>��ۺ�</td>
					<td>�ֹ�����</td>
				</tr>
				<% } %> --%>
				<tr>						
					<th colspan="4">��</th>
					<th><%= "�ǸŰ� �Ѿ� �ӽ�" %></th>
					<th><%= "��ۺ� �Ѿ� �ӽ�" %></th>
					<th></th>
				</tr>
			</table>
			<div>
				<br>
				<button class="selectBtn" onclick="pTypeChange('��ۿϷ�')">��ۿϷ�</button>
			</div>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">��������</th></tr>
			<tr>
				<th>��ǰ���űݾ�</th>
				<td><%= "��ǰ���űݾ� �ӽ�" %> (��)</td>
			</tr>
			<tr>
				<th>��ۺ�</th>
				<td><%= "��ۺ� �ӽ�" %> (��)</td>
			</tr>
			<tr>
				<th>���������ݾ�</th>
				<td><%= "��ǰ���űݾ�+��ۺ�" %> (��)</td>
			</tr>
			<tr>
				<th>�� �ǰ����ݾ�</th>
				<td><%= "�� �ǰ����ݾ� �ӽ�" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">��������</th></tr>
			<tr>
				<th>�Ա��ڸ�</th>
				<td><%= "�Ա��ڸ� �ӽ�" %></td>
			</tr>
			<tr>
				<th>��������</th>
				<td><%= "�������� �ӽ�" %></td>
			</tr>
			<tr>
				<th>������������</th>
				<td><%= "������������/����/���¸�" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">�ֹ��� ����</th></tr>
			<tr>
				<th>�ֹ��ڸ�</th>
				<td><%= "�ֹ��ڸ� �ӽ�" %> (ȸ��)</td>
			</tr>
			<tr>
				<th>����ó</th>
				<td><%= "����ó �ӽ�" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">������ ����</th></tr>
			<tr>
				<th>�����ڸ�</th>
				<td><%= "�����ڸ� �ӽ�" %></td>
			</tr>
			<tr>
				<th>����ó</th>
				<td><%= "����ó �ӽ�" %></td>
			</tr>
			<tr>
				<th>����� �ּ�</th>
				<td><%= "(�����ȣ) ����� �ּ� �ӽ�" %></td>
			</tr>
			<tr>
				<th>��۸޽���</th>
				<td><%= "��۸޽��� �ӽ�" %></td>
			</tr>
		</table>
		</div>
		
		<br>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='paymentList.jsp'">Ȯ��</button>
		</div>
		
		</div> <!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>

<script>
	function changeMemo() {
		var memo = $("#message").val();
		console.log("����Ŭ��");
	}
</script>
</body>
</html>