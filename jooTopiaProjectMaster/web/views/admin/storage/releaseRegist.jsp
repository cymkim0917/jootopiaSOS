<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.release.model.vo.*, java.util.*"%>
	
	<% ReleaseAdmin r = (ReleaseAdmin) request.getAttribute("r"); %>
	
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

.imgArea img {
	width: 500px;
	height: 400px;
	margin-bottom: 20px;
	border: 2px solid orangered;
	
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

			<h3 class="title">출고등록</h3>
			<hr>
			<br />
 
			<div class="imgArea" align="center">
				<div id="ImgArea1">
					<img src="/jootopia/images/product/<%= r.getChangeName() %>">					
				</div>
			</div>

			<div class="listArea1" align="center">
			<form action="<%=request.getContextPath()%>/insertAdminRelease.do" method="post">
			
				<table class="separate" border="1">
				<%-- <% for(ReleaseAdmin r : list){ %> --%>
				
					<tr>
						<td width="120">상품번호</td>
						<td width="500"><%= r.getpId() %>
						<input type="hidden" name="pId" value="<%= r.getpId() %>">
						</td>
					</tr>
					<tr>
						<td width="120">주문번호</td>
						<td width="500"><%= r.getPoId() %>
						<input type="hidden" name="poId" value="<%= r.getPoId() %>">
						</td>
					</tr>
					<tr>
						<td width="120">배송번호</td>
						<td width="500"><%= r.getdId() %>
						<input type="hidden" name="dId" value="<%= r.getdId() %>">
						</td>
					</tr>
					<tr>
						<td width="120">적치번호</td>
						<td width="500"><%= r.gethId() %>
						<input type="hidden" name="hId" value="<%= r.gethId() %>">
						</td>
					</tr>
					<tr>
						<td width="120">위치바코드</td>
						<td width="500"><%= r.getlBarcode() %>
						<input type="hidden" name="lBarcode" value="<%= r.getlBarcode() %>">
						</td>
					</tr>
					
					<!-- <tr>
						<td width="120">출고번호</td>
						<td width="500">
							<input type="text" id="releaseNo" name="releaseNo" placeholder="자동생성 버튼을 누르세요" 
								   size="30" readonly/>&nbsp;&nbsp;
							<input type="button" id="releaseBtn" name="releaseBtn" value="자동생성"/>
						</td>
					</tr> -->
					 
					<!-- <tr>
						<td width="120">출고일자 등록</td>
						<td id="selectDate" colspan="2">									
						<input type="date" id="releaseDate" name="releaseDate">						
					</td>
					</tr>	 -->
					<%-- <% } %>	 --%>
				</table>
				<br />
				
			<div align="center" class="btnArea">
				<button type="submit">출고등록</button>
			</div>
				</form>
			</div>
			
			
		</div>
		
	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>
	
	
	
</body>
</html>