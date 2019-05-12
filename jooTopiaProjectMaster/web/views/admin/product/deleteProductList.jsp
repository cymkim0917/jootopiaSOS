<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- import="com.kh.jooTopia.product.model.vo.*, java.util.*, java.lang.*" --%>    
<%
	int count = 1;
	
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
</head>
<body>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3>������ǰ</h3>
		<hr>
		
		<div id="listArea">
			��ü <a href="/jootopia/views/admin/product/deleteProductList.jsp">10</a>��  |  
			������ǰ <a href="#">2</a>��  |
			ȯ�ҿϷ� <a href="#">6</a>��  |
			�ǸſϷ� <a href="#">2</a>��
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
							<option value="userName">�ֹ��ڸ�
							<option value="userId">�ֹ��� ���̵�
							<option value="phone">�ֹ��� ��ȭ��ȣ
						</select>
						<input type="search" placeholder="�˻� �ܾ �Է��ϼ���." width="20px">
					</td>
				</tr>
				<tr>
					<td>��ǰ ī�װ�</td>
					<td colspan="2">
						<select id="searchCategory" onchange="smallCategoty(this.value)">
							<option value="">- ��з� -
							<option value="bedRoom">ħ��
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
					<td>��ǰ �����</td>
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
					<td>��ǰ ����</td>
					<td colspan="2">
						<input type="radio" name="pType" id="all"><label for="all">��ü</label>
						<input type="radio" name="pType" id="refund"><label for="refund">ȯ�ҿϷ�</label>
						<input type="radio" name="pType" id="delete"><label for="delete">������ǰ</label>
						<input type="radio" name="pType" id="sell"><label for="sell">�ǸſϷ�</label>
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
		<span>��ǰ ���</span><br>
		<span>[�� <a style="color: rgb(243, 156, 18);"><%= 1 %></a>��]</span>
		</div>
		
		<br>
		
		<div class="selectListArea">
			<form action="" method="post">
				<table id="selectList" class="selectList" border="1">
					<tr>
						<th colspan="9" style="height: 45px; text-align: left;">
							<button class="selectBtn" onclick="pTypeChange('���� ����')">���� ����</button>
						</th>
					</tr>
					<tr>
						<th width="25px"><input type="checkbox" id="allCheck"></th>
						<th width="25px">No</th>
						<th width="70px">��ǰ����</th>
						<th width="90px">��ǰ�з�</th>
						<th width="150px">��ǰ�ڵ�</th>
						<th width="70px">��ǰ�̹���</th>
						<th width="300px">��ǰ��</th>
						<th width="100px">�ǸŰ�(��)</th>
						<th width="100px">���ΰ�(%)</th>
					</tr>
					<%-- <% for(Product p : list) { %>
					<tr>
						<td ><input type="checkbox"></td>
						<td><%= count++ %></td>
						<td >�����ӽ�</td>
						<td>�з�/�ӽ�</td>
						<td><a href="../product/productInfo.jsp">��ǰ�ڵ� �ӽ�</a></td>
						<td><img src="/jootopia/images/logo.png" width="60px" height="60px"></td>
						<td><a href="#">��ǰ�� �ӽ�</a></td>
						<td>�ǸŰ� �ӽ�</td>
						<td>���ΰ� �ӽ�</td>
					</tr>
					<% } %> --%>
				</table>
			</form>
		
		</div> <!-- selectListArea -->
		
		</div> <!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>

	<script>
		function smallCategoty(big) {
			
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
		}
		
		$(".btnDate").click(function() {
			
			$("#selectDate>a").removeClass();
			$("#selectDate>a").addClass("btnDate");
			$(this).toggleClass("selected");
			
		})
		
		function pTypeChange(text) {
			var answer = window.confirm("������ ��ǰ�� " + text + " �Ͻðڽ��ϱ�?");
			
			if(answer) {
				alert("�ش��ǰ�� " + text + " ó�� �Ͽ����ϴ�.");
			}
		}
		
		$(function() {
			$(".btnDate").click(function() {
				
				/* ��¥ó���ϱ� (���� ������) */
				
				/* var year = this.args.year == null ? 0 : Number(this.args.year);
			    var month = this.args.month == null ? 0 : Number(this.args.month);
			    var day = this.args.day == null ? 0 : Number(this.args.day);
			    var result = new Date();

			    result.setYear(result.getFullYear() + year);
			    result.setMonth(result.getMonth() + month);
			    result.setDate(result.getDate() + day);
			    return this.formatDate(result, "-");

				var changeDay = $("#endDate").val() + $(this).attr("period");
				console.log(changeDay);
				$("#endDate").val(changeDay); */
				
			})
		})
		
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