<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.product.model.vo.*, java.util.*"%>
	
	<% ProductregAdmin p = (ProductregAdmin) request.getAttribute("p"); %> 
	
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
	border-collapse: separate;
	border-spacing: 3px;
	border: 1px solid #ccc;
	width: 80%;	
}

.separate tr {
	height: 30px;
	padding: 5px;
}
 
.separate td {
	padding: 5px;
	background-color: #fafafa;
	border: 1px solid #ccc;
}

/* #mainImg1 {
	width: 550px;
	height: 400px;
	margin-bottom: 20px;
	border: 2px solid orangered;
	

} */

/* #subImg1{
	width: 165px;
	height: 120px;
	margin-bottom: 20px;
	border: 2px solid orangered;
	float:left;
	margin-right:1%;
	margin-left:4%;
	
} */

#mImg1, #mImg2, #mImg3, #mImg4 {
	width: 210px;
	height: 170px;
	margin-bottom: 20px;
	border: 2px solid orangered;
	/* float:left;
	margin-right:1%; */
	margin:10px;
	
}

.btnArea {
	margin-bottom: 30px;
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
			
			<div class="listArea1" align="center">
				<form action="<%=request.getContextPath()%>/insertAdminPAttachment.do" method="post" encType="multipart/form-data">
				<table >
					<!-- <tr>
						<td>
							<div id="mainImg1">
								<img  id="Img1" width="545px" height="395px">					
							</div>
						</td>
					</tr> -->
					<tr>
						<td>
							<div id="mImg1">
								<img  id="Img1" width="204px" height="165px">					
							</div>						
						</td>
						<td>
							<div id="mImg2">
								<img  id="Img2" width="204px" height="165px">
							</div>
						</td>
						<td>
							<div id="mImg3">
								<img  id="Img3" width="204px" height="165px">
							</div>
						</td>
						<td>
							<div id="mImg4">
								<img  id="Img4" width="204px" height="165px">
							</div>
						
						</td>
					</tr>
				</table>			
				<br /><br />
				
				<table class="separate" border="1">
				
					<tr>
						<td width="120">매입번호</td>
						<td width="500"><%= p.getPcdId() %>
						<input type="hidden" name="pcdId" value="<%= p.getPcdId() %>"></td>
					</tr>
					<tr>
						<td width="120">대분류</td>
						<td width="500"><%= p.getcGroup() %>
						<input type="hidden" name="cGroup" value="<%= p.getcGroup() %>"></td>
					</tr>
					<tr>
						<td width="120">중분류</td>
						<td width="500"><%= p.getName() %>
						<input type="hidden" name="cName" value="<%= p.getName() %>"></td>
					</tr>
					<tr>
						<td width="120">브랜드</td>
						<td width="500"><%= p.getBrand() %>
						<input type="hidden" name="pBrand" value="<%= p.getBrand() %>"></td>
					</tr>
					<tr>
						<td width="120">모델</td>
						<td width="500"><%= p.getModel() %>
						<input type="hidden" name="pModel" value="<%= p.getModel() %>"></td>
					</tr>
					<tr>
						<td width="120">사용기간</td>
						<td width="500"><%= p.getuPeriod() %>
						<input type="hidden" name="uPeriod" value="<%= p.getuPeriod() %>"></td>
					</tr>
					<tr>
						<td width="120">구매원가</td>
						<td width="500" ><%= p.getpCost() %>
						<input type="hidden" name="pCost" value="<%= p.getpCost() %>"></td>
					</tr>
					<tr>
						<td width="120">판매희망가</td>
						<td width="500"><%= p.gethCost() %>
						<input type="hidden" name="hCost" value="<%= p.gethCost() %>"></td>
					</tr>
					<%-- <tr>
						<td width="120">메모</td>
						<td width="500"><%= p.getMemo() %>
						<input type="hidden" name="Memo" value="<%= p.getMemo() %>"></td>
					</tr> --%>					
					
					<tr>
						<td width="120">상품명</td>
						<td width="500"><input name="pName" size="50"></td>
					</tr>
					<tr>
						<td width="120">상품등급</td>
						<td width="500">
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
						<td width="120">치수 및 비고</td>
						<td width="500"><textarea name="pContent" cols="120px" rows="5"></textarea></td>
					</tr>					
				</table>
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
				
				$("#mImg1").click(function(){
					$("#thumbnailImg1").click();
				});
				$("#mImg2").click(function(){
					$("#thumbnailImg2").click();
				});
				$("#mImg3").click(function(){
					$("#thumbnailImg3").click();
				});
				$("#mImg4").click(function(){
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
			
			/*  $(function(){
				$(".btnArea").click(function(){
					location.href="/insertAdminPAttachment.do";
				});
			}); */ 
			
			
		</script>
		
	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>
</body>
</html>