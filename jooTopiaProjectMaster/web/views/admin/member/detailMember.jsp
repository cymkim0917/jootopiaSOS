<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.member.model.vo.*"%>
<%
	Member member = (Member)request.getAttribute("member");

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
	
	.btnDate {
	background: rgb(224, 224, 224);
	color: black;
	padding: 2px;
	margin-left: 5px;
	border-radius: 3px;
	}
	.btnDate.selected {
	background: rgb(241, 196, 15);
	
	}
	
	.date{
		height: 25px;
	
	}
	#orderListTb, #reviewListTb, #sellingListTb, #qnaListTb{
		text-align:center;
	}
	

</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      <h3 class="title">회원상세보기</h3>
		<hr>
      <br>
      <br>
      	<div>
	      <form>
		      <table id="searchBox" border="1">
				  <tr>
				    <td width="15%"><label class="titleName">아이디</label></td>
				    <td><%=member.getUserId() %></td>
				    <td width="15%"><label class="titleName">이름</label></td>
				    <td><%=member.getUserName()%></td>
				  </tr>
				  <tr>
				    <td><label class="titleName">전화번호</label></td>
				    <td><%=member.getPhone()%></td>
				    <td><label class="titleName">생년월일</label></td>
				    <td><%=member.getUserDate()%></td>
				  </tr>
				  <tr>
				    <td><label class="titleName">주소</label></td>
				    <td><%=member.getAddress()%></td>
				    <td><label class="titleName">이메일</label></td>
				    <td><%=member.getEmail()%></td>
				  	<td style="display:none"><input type="text" name="uNo" value="<%=member.getUno() %>"></td>
				  </tr>
			</table>
			<br>
			<div id="searchBtnArea" align="right">
				<input type="submit" value="강퇴">
			</div>
		  </form>
		</div><!--폼 -->
      		<hr>
      		<br>
	      	<div>
	      		<form action="">
		      	<select id="selectFormBox" name="btype"  height="30%;">
		      		<option value="orderList" selected>주문</option>
		      		<option value="reviewList">후기</option>
		      		<option value="sellingList">매입</option>
		      		<option value="qnaList">1:1문의글</option>
		      	</select>
		      	&nbsp;
					<input type="hidden" id="uNo" value="<%=member.getUno()%>">
					<br> 
					<div id="searchBtnArea" style="margin-left:41%; margin-top:1%">
						<input type="button" onclick="searchBoard();" value="검색">
					</div>
				  </form>
      		</div>
      		<hr>
      		<div id="resultArea">
      			<form>
      				<table id="orderListTb" border="1px;">
      					<tr>
      						<th width="300px;" height="30px">주문번호</th>
      						<th width="300px;" height="30px">상품명</th>
      						<th width="300px;" height="30px">주문일자</th>
      						<th width="300px;" height="30px">상태</th>
      						<th width="300px;" height="30px">비고</th>
      					</tr>
      					<tbody id="orderTbody">
      					</tbody>
      				</table>
      			
      				<table id="sellingListTb" border="1px;" style="display:none">
      					<tr>
      						<th width="300px;" height="30px">모델명</th>
      						<th width="300px;" height="30px">신청주소</th>
      						<th width="300px;" height="30px">희망가격</th>
      						<th width="300px;" height="30px">상태</th>
      						<th width="300px;" height="30px">비고</th>
      					</tr>
      					<tbody id="sellingTbody">
      					</tbody>
      				</table>
      				<table id="reviewListTb" border="1px;" style="display:none">
      					<tr>
      						<th width="300px;" height="30px">글번호</th>
      						<th width="300px;" height="30px">제목</th>
      						<th width="300px;" height="30px">상품이름</th>
      						<th width="300px;" height="30px">작성일</th>
      						<th width="300px;" height="30px">평점</th>
      					</tr>
      					<tbody id="reviewTbody">
      					</tbody>
      				</table>
      				<table id="qnaListTb" border="1px;" style="display:none">
      					<tr>
      						<th width="300px;" height="30px">작성일</th>
      						<th width="300px;" height="30px">제목</th>
      						<th width="300px;" height="30px">문의유형</th>
      						<th width="300px;" height="30px">답변여부</th>
      						<th width="300px;" height="30px">비고</th>
      					</tr>
      					<tbody id="qnaTbody">
      					</tbody>
      				</table>
      			</form>
      		</div>
     
			
      	 
      
      
      
      </div><!-- "col-sm-10" -->
      	
      	<script>
      		function searchBoard(){
      			var type = $("#selectFormBox option:selected").val();
      			var uno = $("#uNo").val();
      			
      			if(type=="orderList"){
      				document.getElementById('orderListTb').style.display  = 'block';
      				document.getElementById('reviewListTb').style.display  = 'none';
      				document.getElementById('sellingListTb').style.display  = 'none';
      				document.getElementById('qnaListTb').style.display  = 'none';
      				
      				$.ajax({
      					url:"selectAdminMOrderList.do",
      					data:{
      						type:type,
      						uno:uno
      					},
      					type:"post",
      					success:function(data){
      						$table=$("#orderListTb");
      						$tableBody=$("#orderTbody");
      						
      						$tableBody.empty();
      						
      						for(var key in data){
      							var hmap = data[key];
      							
      							var order = hmap["order"];
      							
      							var poid = order.poId;
      							var podate = order.poDate;
      							var status = order.status;
      							var productName = hmap["pName"];
      							
      							console.log(poid);
      							
      							var $tr = $("<tr>");
      							var $poidTd = $("<td>").text(poid);
      							var $pNameTd = $("<td>").text(productName);
      							var $poDateTd = $("<td>").text(podate);
      							var $statusTd = $("<td>").text(status);
      							var $nullTd = $("<td>").text("");
      							
      							$tr.append($poidTd);
      							$tr.append($pNameTd);
      							$tr.append($poDateTd);
      							$tr.append($statusTd);
      							$tr.append($nullTd);
      							
      							$tableBody.append($tr);
      							$table.append($tableBody);
      						}
      					},
      					error:function(){
      						console.log(data);
      					}
      				});
      				
      				
      			}else if(type == "reviewList"){
      				document.getElementById('orderListTb').style.display  = 'none';
      				document.getElementById('reviewListTb').style.display  = 'block';
      				document.getElementById('sellingListTb').style.display  = 'none';
      				document.getElementById('qnaListTb').style.display  = 'none';
      				
      				$.ajax({
      					url:"selectAdminMReview.do",
      					data:{
      						type:type,
      						uno:uno
      					},
      					type:"post",
      					success:function(data){
      						$table=$("#reviewListTb");
      						$tableBody=$("#reviewTbody");
      						
      						$tableBody.empty();
      						
      						for(var key in data){
      							var hmap = data[key];
      							
      							var board = hmap["board"];
      							
      							var bno = board.bNo;
      							var btitle = board.bTitle;
      							var productName = hmap["pname"];
      							var bdate = board.bDate;
      							var rrating =board.rrating;
      							
      							var $tr = $("<tr>");
      							var $bnoTd = $("<td>").text(bno);
      							var $btitleTd = $("<td>").text(btitle);
      							var $productNameTd = $("<td>").text(productName);
      							var $bdateTd = $("<td>").text(bdate);
      							var $rratingTd = $("<td>").text(rrating);
      							
      							$tr.append($bnoTd);
      							$tr.append($btitleTd);
      							$tr.append($productNameTd);
      							$tr.append($bdateTd);
      							$tr.append($rratingTd);
      							
      							$tableBody.append($tr);
      							$table.append($tableBody);
      						}
      					},
      					error:function(){
      						console.log(data);
      					}
      				});
      				
      				
      				
      			}else if(type == "sellingList"){
      				document.getElementById('orderListTb').style.display  = 'none';
      				document.getElementById('reviewListTb').style.display  = 'none';
      				document.getElementById('sellingListTb').style.display  = 'block';
      				document.getElementById('qnaListTb').style.display  = 'none';
      				
      				$.ajax({
      					url:"selectAdminSellingList.do",
      					data:{
      						type:type,
      						uno:uno
      					},
      					type:"post",
      					success:function(data){
      						$table=$("#sellingListTb");
      						$tableBody=$("#sellingTbody");
      						
      						$tableBody.empty();
      						
      						for(var key in data){
      							var hmap = data[key];
      							
      							var purchase = hmap["purchase"];
      							
      							var pmodel = purchase.model;
      							var address = purchase.appAddress;
      							var cost = purchase.hopeCost;
      							var status = hmap["status"];
      							
      							var $tr = $("<tr>");
      							var $pmodelTd = $("<td>").text(pmodel);
      							var $addressTd = $("<td>").text(address);
      							var $costTd = $("<td>").text(cost);
      							var $statusTd = $("<td>").text(status);
      							var $nullTd = $("<td>").text("");
      							
      							$tr.append($pmodelTd);
      							$tr.append($addressTd);
      							$tr.append($costTd);
      							$tr.append($statusTd);
      							$tr.append($nullTd);
      							
      							$tableBody.append($tr);
      							$table.append($tableBody);
      						}
      					},
      					error:function(){
      						console.log(data);
      					}
      				});
      				
      				
      			}else{
      				document.getElementById('orderListTb').style.display  = 'none';
      				document.getElementById('reviewListTb').style.display  = 'none';
      				document.getElementById('sellingListTb').style.display  = 'none';
      				document.getElementById('qnaListTb').style.display  = 'block';
      				
      				$.ajax({
      					url:"SelectAdminMQnA.do",
      					data:{
      						type:type,
      						uno:uno
      					},
      					type:"post",
      					success:function(data){
      						$table=$("#qnaListTb");
      						$tableBody=$("#qnaTbody");
      						
      						$tableBody.empty();
      						
      						for(var key in data){
      							
      							var bdate = data[key].bDate;
      							var btitle = data[key].bTitle;
      							var qcategory = data[key].qCategory;
      							var astatus = data[key].aStatus;
      							
      							var status ='';
      							
      							if(astatus=='N'){
      								status='미답변'
      							}else{
      								status='답변완료'
      							}
      							
      							var $tr = $("<tr>");
      							var $bdateTd = $("<td>").text(bdate);
      							var $btitleTd = $("<td>").text(btitle);
      							var $qcategoryTd = $("<td>").text(qcategory);
      							var $statusTd = $("<td>").text(status);
      							var $nullTd = $("<td>").text("");
      							
      							$tr.append($bdateTd);
      							$tr.append($btitleTd);
      							$tr.append($qcategoryTd);
      							$tr.append($statusTd);
      							$tr.append($nullTd);
      							
      							$tableBody.append($tr);
      							$table.append($tableBody);
      						}
      					},
      					error:function(){
      						console.log(data);
      					}
      				});
      				
      			} 
      			
      		}	
      	
      		
      	
      	</script>
   </section>
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>