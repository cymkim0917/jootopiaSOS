<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.product.model.vo.*, java.util.*"%>
<% ProductregAdmin p = (ProductregAdmin) request.getAttribute("p"); 
	System.out.println("p : " + p);
%> 
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/jquery-3.4.0.min.js"></script>
<script src="/jootopia/js/external/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<style>
.separate {
	border-collapse: collapse;
	border-spacing: 3px;
	border: 1px solid #ccc;
	width: 100%;	
}
.btnArea {
	margin-bottom: 30px;
}
.listArea{
	padding-left: 5%;
	width: 100%;
}
#tableArea tr > td:nth-child(1){
	width: 20%;
	text-align: center;
}
#tableArea tr > td:nth-child(2){
	width: 70%;
}
#tableArea td{
	height : 50px;
	padding: 10px;
	background-color: #fafafa;
	border: 1px solid #ccc;
}
.listArea img{
	border: 1px solid black;
	width : 150px;
	height : 150px;
	margin : 0 2%;
}
#imgArea td{
	text-align: center;
}
</style>
<title>JooTopia</title>
</head>
<body>
	<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">
			<h3 class="title">상품등록</h3>
			<hr>
			<br />
			<div class="listArea" align="center" >
				<form action="<%=request.getContextPath()%>/insertAdminPAttachment.do" method="post" encType="multipart/form-data">
					<table width="100%" id="imgArea">
						<tr>
							<td>
								<img id="Img1">				
								<img id="Img2">
								<img id="Img3">
								<img id="Img4">
							</td>
						</tr>
					</table>			
				<br /><br />
				<table class="separate" border="1" id="tableArea">
					<tr>
						<td>매입번호</td>
						<td><%= p.getPcid() %>
							<input type="hidden" name="pcdId" value="<%= p.getPcdId() %>">
							<input type="hidden" name="pcid" value="<%= p.getPcid() %>">
							<input type="hidden" name="pBarcode" value="<%= p.getpBarcode() %>">
						</td>
					</tr>
					<tr>
						<td  >대분류</td>
						<td  ><%= p.getcGroup() %>
						<input type="hidden" name="cGroup" value="<%= p.getcGroup() %>"></td>
				</tr>
				<tr>
					<td  >중분류</td>
					<td  ><%= p.getName() %>
					<input type="hidden" name="cName" value="<%= p.getName() %>"></td>
				</tr>
				<tr>
					<td  >브랜드</td>
					<td  ><%= p.getBrand() %>
					<input type="hidden" name="pBrand" value="<%= p.getBrand() %>"></td>
				</tr>
				<tr>
					<td  >모델</td>
					<td  ><%= p.getModel() %>
					<input type="hidden" name="pModel" value="<%= p.getModel() %>"></td>
				</tr>
				<tr>
					<td  >사용기간</td>
					<td  ><%= p.getuPeriod() %>
					<input type="hidden" name="uPeriod" value="<%= p.getuPeriod() %>"></td>
				</tr>
				<tr>
					<td  >구매원가</td>
					<td   ><%= p.getpCost() %>
					<input type="hidden" name="pCost" value="<%= p.getpCost() %>"></td>
				</tr>
				<tr>
					<td  >판매희망가</td>
					<td  ><%= p.gethCost() %>
					<input type="hidden" name="hCost" value="<%= p.gethCost() %>"></td>
				</tr>
				<%-- <tr>
					<td  >메모</td>
					<td  ><%= p.getMemo() %>
					<input type="hidden" name="Memo" value="<%= p.getMemo() %>"></td>
				</tr> --%>					
				
				<tr>
					<td  >상품명</td>
					<td  ><input name="pName" size="50"></td>
				</tr>
				<tr>
					<td  >상품등급</td>
					<td  >
					<select name="pGrade" id="">
						<option value="">---선택---</option>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>치수 및 비고</td>
					<td><textarea name="pContent" cols="80%" rows="5"></textarea></td>
				</tr>					
			</table>
			<br><br>
			<div align="center" class="btnArea">
				<button type="submit">등록</button>
			</div>
			<div id="fileArea">
				<input type="file" id="thumbnailImg1" name="ThumbnailImg1" onchange="LoadImg(this,1)">
				<input type="file" id="thumbnailImg2" name="ThumbnailImg2" onchange="LoadImg(this,2)" />
				<input type="file" id="thumbnailImg3" name="ThumbnailImg3" onchange="LoadImg(this,3)" />
				<input type="file" id="thumbnailImg4" name="ThumbnailImg4" onchange="LoadImg(this,4)"/>
			</div>
			</form>
			<br>
		</div>
	</div>
	<script>
		$(function(){
			$("#fileArea").hide();
			
			$("#Img1").click(function(){
				$("#thumbnailImg1").click();
			});
			$("#Img2").click(function(){
				$("#thumbnailImg2").click();
			});
			$("#Img3").click(function(){
				$("#thumbnailImg3").click();
			});
			$("#Img4").click(function(){
				$("#thumbnailImg4").click();
			});
		});
		function LoadImg(value, num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1 : $("#Img1").attr("src", e.target.result); break;
					case 2 : $("#Img2").attr("src", e.target.result); break;
					case 3 : $("#Img3").attr("src", e.target.result); break;
					case 4 : $("#Img4").attr("src", e.target.result); break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
	
</section>
<%@ include file="/views/common/adminFooter.jsp"%>
</body>
</html>