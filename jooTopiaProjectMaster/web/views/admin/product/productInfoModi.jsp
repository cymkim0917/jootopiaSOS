<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%-- import="com.kh.jooTopia.product.model.vo.*, java.util.*, java.lang.*" --%>
<%
	/* Product productList = (Product) session.getAttribute("productList");
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yy-MM-dd");
	String startDay = dateFormat.format(date);
	String endDay = dateFormat.format(date); */
	
	String value = "bedRoom";

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
		
		<h3>��ǰ�� ����</h3>
		<hr>
		
		<div class="pInfo1Area">
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
					<select id="big" onchange="smallCategoty(this.value)">
						<option value="">- ��з� -
						<option value="bedRoom" selected="selected">ħ��
						<option value="livingRoom">�Ž�
						<option value="kitchen">�ֹ�
						<option value="study">����
					</select>
					<select id="small">
						<option value="">- �ߺз� -
					</select>
				</td>
			</tr>
			<tr>
				<th>��ǰ��</th>
				<td>
				<input type="text" size="45" name="pName" placeholder="<%= "��ǰ�� �ӽ�" %>">
				</td>
			</tr>
			<tr>
				<th>��ǰ�ڵ�</th>
				<td><%= "��ǰ�ڵ� �ӽ�" %></td>
			</tr>
			<tr>
				<th>��ǰ �ǸŰ�</th>
				<td>
				<input type="number" size="45" name="pName" placeholder="<%= "��ǰ�ǸŰ� �ӽ�" %>"> (��)
				</td>
			</tr>
			<tr>
				<th>���ΰ�</th>
				<td><%= "���η� �ӽ�" %> (%)</td>
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
				<textarea name="" rows="30" cols="110em" style="resize: none"><%= "��ǰ �󼼼��� �ӽ� �����" %></textarea>
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
				<th>
				��ǥ �̹���
				<br>
				<button id="mainImgArea">�̹��� ���� ����</button>
				</th>
				<td><%= "��ǥ�̹��� ���� ÷��" %></td>
			</tr>
			<tr>
				<th>
				�� �̹���
				<br>
				<button id="detailImgArea">�̹��� ���� ����</button>
				</th>
				<td><%= "���̹��� ���� ÷��" %></td>
			</tr>
		</table>
		</div>
		
		<br>
		
		<div id="fileArea" align="center">
				<input type="file" id="mainImg" name="mainImg">
				<!-- onchange="loadImg(this, 1);" -->
				<input type="file" id="detailImg" name="detailImg">
				<!--  onchange="loadImg(this, 2);" -->
		</div>
		
		<div class="btnArea" align="center">
			<button type="submit" onclick="location.href='productInfo.jsp'">����</button>
			<button type="reset" onclick="location.href='productList.jsp'">���</button>
		</div>
		
		</div>
		
	</section> <!-- row -->

	
	<%@ include file="/views/common/adminFooter.jsp" %>
	
	<script>

		$(document).ready(function() {
			
			<% if(value.equals("bedRoom")) { %>
			$("#big>option[value=" + '<%= value %>' + "]").attr("selected", true);
			<% } %>
		});
		
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
		
		$(function() {
			$("#fileArea").hide();
			
			$("#mainImgArea").click(function() {
				$("#mainImg").click();
			})
			
			$("#detailImgArea").click(function() {
				$("#detailImg").click();
			})
		})
		
		/* function loadImg(value, num) {
			if(value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch(num) {
					case 1 :
						$("#mainImg").attr("src", e.target.result);
						break;
					case 2 :
						$("#detailImg").attr("src", e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		} */
	</script>
</body>
</html>