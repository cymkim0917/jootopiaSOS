<%@page import="com.kh.jooTopia.product.model.vo.*"%>
<%@page import="com.kh.jooTopia.board.model.vo.Attachment"%>
<%@ page import = "java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% HashMap<String, Object> detailProc = (HashMap<String, Object>)request.getAttribute("detailProc"); 
	ArrayList<Attachment> attList = (ArrayList<Attachment>)detailProc.get("attachment");	
	
	Product product = (Product)detailProc.get("product");
	Category category = (Category)detailProc.get("category");
	String useDate = String.valueOf(detailProc.get("useDate"));


	HashMap<String, Object> recentProc = (HashMap<String, Object>)request.getAttribute("recentProc");
	ArrayList<HashMap<String,Object>> recentProcList = null;
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/user/common.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>JooTopia</title>
<style>
.detailTable{
	width: 100%;
	border: 10px solid rgba(51, 26, 0, .2);
}
.detailTable *{
	border : 0px solid black;
}
.detailTable td img{ 
}
.category{
	text-align: left;
	font-weight: bold;
	font : 20px;
	padding : 10px 30px;
	padding-top : 20px;
}
.imgTd{
	padding-left : 2%;
	padding-right : 2%;
	padding-top: 0;
}
.productInfo{
	padding-top: 0px !important;
	margin-top: 0px;
}
.infoTable{
	border-collapse: collapse;
}
.infoTable tr td:nth-child(1){
	text-align: center;
	font-weight : bold;
	font-size : 1.3em;
	padding: 15px;
	width: 50%;
}
.infoTable tr td:nth-child(2){
	font-size : 1.1em;
}
.imgTd img{
	position : relative;
	width : 100%;
}
.imgTd {
	padding-top: 0 !important;
}
.jBtn{
	margin : 0px;
	width : 70%;
	font-size : 80%;
}
</style>
</head>
<body>
	<%@ include file="/views/common/navigation.jsp" %> 
	<section>
		<br>
		<div class="product" align="center" style="text-align:center;">
		<input type="hidden" value="<%= product.getpId() %>" />
		<table border="1px" class="detailTable">
			<tr style="width">
				<td class="category" colspan="2">
					카테고리  &nbsp;&nbsp;&nbsp;&nbsp; <span> <%= category.getcGroup() %></span> &nbsp;>&nbsp; <span><%= category.getName() %></span>
				</td>
			</tr>
			<tr>
				<td class="imgTd" style="width: 60%">
					<img src="<%= request.getContextPath() %>/images/product/<%= attList.get(0).getChangeName() %>"/>
				</td>
				<td align="center" class="productInfo">
					<label for=""><h1 style="font-weight: bold;"><%= product.getpName() %></h1></label>
					<br><Br><br><Br>
					<table class="infoTable">
						<tr>
							<td>제조사</td>
							<td><%= product.getpBrand() %></td>
						</tr>
						<tr>
							<td>모델명</td>
							<td><%= product.getpModelName() %></td>
						</tr>
						<tr>
							<td>분류</td>
							<td><%= category.getName() %></td>
						</tr>
						<tr>
							<td>사용 일수</td>
							<td><%= useDate %></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><%= product.getpPrice() %></td>
						</tr>
						<tr>
							<td colspan="2">
							<br>
								<button onclick="cartInsert()" class="jBtn">장바구니 넣기</button>
								<br><br>
								<button type="submit" class="jBtn">구매하기</button>
								<Br><br><br><br>
							</td>
						</tr>
					</table>	
				</td>
			</tr>
		</table>
		</div>
		<Br><br><br>
		<h2 style="padding-left : 50px;">상품 상세</h2>
		<hr>
		<Br><br>
		<div class ="productMenual" align="center">
			<table>
				<tr>
					<td align="center">상세 설명 : <span><%= product.getpContent()  %></span></td>
				</tr>
				<% if(attList.size() > 1){ %>
					<% for(int i=0; i<attList.size();i++) { %>
					<tr>
						<td>
							<img src="<%= request.getContextPath() %>/images/product/<%= attList.get(i).getChangeName() %>" width="770" height="660" alt="" 
							style="margin-top:5%;"/>
						</td>
					</tr>
					<% } 
					} %>
			</table>
		</div>

		<script>
			$(function(){	
				var recentProcList= new Array();
				if(localStorage.getItem('recentProcList')=== null){
					var recentProc = { pid : <%= recentProc.get("pid") %>,
							change_name : '<%= recentProc.get("att") %>',
							date : '<%= recentProc.get("day") %>'
					};
					recentProcList.push(recentProc);
				}else{
					recentProcList = JSON.parse(localStorage.getItem('recentProcList'));					
				
					var recentProc = { pid : <%= recentProc.get("pid") %>,
										change_name : '<%= recentProc.get("att") %>',
										date : '<%= recentProc.get("day") %>'
					};
					recentProcList.push(recentProc);
				}
					localStorage.setItem("recentProcList",JSON.stringify(recentProcList));
					console.log(localStorage.getItem('recentProcList'));
			})
			
			function cartInsert(){
				<% if(loginUser != null){ %>
				$.ajax({
					url:"<%= request.getContextPath() %>/insertCart.do?num=<%= product.getpId() %>",
					type:"post",
					success:function(data){
						console.log('ajax실행 완료');
						
						if(data == "success"){
							alert('장바구니를 성공적으로 추가하였습니다');
						}
					}
				})
				<% } else { %>
					alert('로그인 후 장바구니 추가하실 수 있습니다.');
				<% } %>
			}
		</script>
		
	</section>
	

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>