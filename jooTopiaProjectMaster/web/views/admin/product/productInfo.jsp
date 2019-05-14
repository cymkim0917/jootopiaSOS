<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%-- import="com.kh.jooTopia.product.model.vo.*, java.util.*, java.lang.*" --%>
<%
	/* Product productList = (Product) session.getAttribute("productList");
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yy-MM-dd");
	String startDay = dateFormat.format(date);
	String endDay = dateFormat.format(date); */

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
		<h3>��ǰ��</h3>
		<hr>
		
		<div id="infoArea">
		<table id="pInfo1">
			<tr>
				<th>��ǰ��</th>
				<td><%= "��ǰ�� �ӽ�" %></td>
			</tr>
			<tr>
				<th>��ǰ�ڵ�</th>
				<td><%= "��ǰ�ڵ� �ӽ�" %></td>
			</tr>
			<tr>
				<th>��ǰ����</th>
				<td><%= "��ǰ���� �ӽ�" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
	
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px"><%= "[" + "��ǰ�ڵ� �ӽ�" + "]" %>  <%= "��ǰ�� �ӽ�" %></th></tr>

			<tr>
				<th>��ǰī�װ�</th>
				<td>
					<select id="big" disabled="disabled">
						<option value="">- ��з� -
						<option value="bedRoom" selected="selected">ħ��
						<option value="livingRoom">�Ž�
						<option value="kitchen">�ֹ�
						<option value="study">����
					</select>
					<select id="small" disabled="disabled">
						<option value="">- �ߺз� -
					</select>
				</td>
			</tr>
			<tr>
				<th>��ǰ��</th>
				<td><%= "��ǰ�� �ӽ�" %></td>
			</tr>
			<tr>
				<th>��ǰ�ڵ�</th>
				<td><%= "��ǰ�ڵ� �ӽ�" %></td>
			</tr>
			<tr>
				<th>��ǰ �ǸŰ�</th>
				<td><%= "��ǰ�ǸŰ� �ӽ�" %> (��)</td>
			</tr>
			<tr>
				<th>���ΰ�</th>
				<td><%= "���ΰ� �ӽ�" %> (��) / <%= "���η� �ӽ�" %> (%)</td>
			</tr>
			<tr>
				<th>��ǰ ����</th>
				<td><%= "��ǰ���� �ӽ�" %> (��)</td>
			</tr>
		</table>

		</div>
		
		<br><br>
		
		<div class="pInfo3Area">
		<table id="pInfo3">

			<tr>
				<th colspan="2">������</th>
			</tr>
			<tr>
				<th>��ǰ �󼼼���</th>

				<td>
				<textarea name="" rows="30" cols="110em" style="resize: none" readonly><%= "��ǰ �󼼼��� �ӽ� �����" %></textarea>
				</td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo4Area">

		<table id="pInfo4" border="1">
			<tr>
				<th colspan="2">�̹��� ����</th>
			</tr>
			<tr>
				<th>��ǥ �̹���</th>
				<td><%= "��ǥ�̹��� ���� ÷��" %></td>
			</tr>
			<tr>
				<th>�� �̹���</th>
				<td><%= "���̹��� ���� ÷��" %></td>
			</tr>
		</table>

		</div>
		
		<br>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='productInfoModi.jsp'">����</button>
			<button onclick="location.href='productList.jsp'">���</button>
		</div>
	
		</div>
	</section>
	<%@ include file="/views/common/adminFooter.jsp" %>
	
	<script>
		$(document).ready(function() {
			
			var big = $("#big>option[selected='selected']").val();

			var bedRoom = ["ħ��", "����", "ȭ���", "������"];
			var livingRoom = ["���̺�", "�Ž���", "����", "������"];
			var kitchen = ["��Ź", "��Ź����", "������", "������"];
			var study = ["å��", "å��", "�繫������", "������"];
			
			if(big == "") {
				smallCategory = [];
			}else if(big == "bedRoom") {
				smallCategory = bedRoom;
			}else if(big == "livingRoom") {
				smallCategory = livingRoom;
			}else if(big == "kitchen") {
				smallCategory = kitchen;
			}else if(big == "study") {
				smallCategory = study;
			}
			
			$("#small").empty();
			$("#small").append("<option value=''>- �ߺз� -</option>");
			
			for(var i = 0; i < smallCategory.length; i++) {
				var option = $("<option>" + smallCategory[i] + "</option>");
				$("#small").append(option);
			}
		})
		
	</script>
	
</body>
</html>