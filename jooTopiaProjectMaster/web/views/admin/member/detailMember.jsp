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
	#orderListTb{
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
		      	<select id="selectFormBox" onchange="SetSelectBox();" height="30%;">
		      		<option value="orderList">주문</option>
		      		<option value="reviewList">후기</option>
		      		<option value="sellingList">매입</option>
		      		<option value="qnaList">1:1문의글</option>
		      	</select>
		      	&nbsp;
		      		<a href="#" class="btnDate" period="7"><span>7일</span></a>
					<a href="#" class="btnDate" period="30"><span>1개월</span></a>
					<a href="#" class="btnDate" period="90"><span>3개월</span></a>
					<a href="#" class="btnDate" period="365"><span>1년</span></a>
					<a href="#" class="btnDate" period="-1"><span>전체</span></a> &nbsp;&nbsp;
					<input type="date" id="startDate" name="startDate" class="date" > ~ 
					<input type="date" id="endDate" name="endDate" class="date" >
					<br> 
					<div id="searchBtnArea" style="margin-left:41%; margin-top:1%">
						<input type="submit" value="검색">
					</div>
      		</div>
      		<hr>
      		<div id="resultArea">
      			<form>
      				<table id="orderListTb" border="1px;">
      					<tr>
      						<th width="300px;" height="30px">주문번호</th>
      						<th width="300px;" height="30px">상품명</th>
      						<th width="300px;" height="30px">상품 카테고리</th>
      						<th width="300px;" height="30px">주문일자</th>
      						<th width="300px;" height="30px">상태</th>
      					</tr>
      				</table>
      			</form>
      				<table id="sellingListTb" border="1px;" style="display:none">
      					<tr>
      						<th width="300px;" height="30px">카테고리</th>
      						<th width="300px;" height="30px">신청일</th>
      						<th width="300px;" height="30px">매입여부</th>
      						<th width="300px;" height="30px">입고여부</th>
      						<th width="300px;" height="30px">비고</th>
      					</tr>
      				</table>
      				<table id="reviewListTb" border="1px;" style="display:none">
      					<tr>
      						<th width="300px;" height="30px">글번호</th>
      						<th width="300px;" height="30px">제목</th>
      						<th width="300px;" height="30px">후기제품</th>
      						<th width="300px;" height="30px">작성일</th>
      						<th width="300px;" height="30px">평점</th>
      					</tr>
      				</table>
      				<table id="qnaListTb" border="1px;" style="display:none">
      					<tr>
      						<th width="300px;" height="30px">작성일</th>
      						<th width="300px;" height="30px">제목</th>
      						<th width="300px;" height="30px">문의유형</th>
      						<th width="300px;" height="30px">답변여부</th>
      						<th width="300px;" height="30px">비고</th>
      					</tr>
      				</table>
      			</form>
      		</div>
     
			
      	 
      
      
      
      </div><!-- "col-sm-10" -->
			
			
			
      	
      	<script>
      		function SetSelectBox(){
      			var schField = $("#selectFormBox option:selected").val();
      			
      			console.log(schField);
      			
      			if(schField=="orderList"){
      				document.getElementById('orderListTb').style.display  = 'block';
      				document.getElementById('reviewListTb').style.display  = 'none';
      				document.getElementById('sellingListTb').style.display  = 'none';
      				document.getElementById('qnaListTb').style.display  = 'none';
      				
      			}else if(schField == "reviewList"){
      				document.getElementById('orderListTb').style.display  = 'none';
      				document.getElementById('reviewListTb').style.display  = 'block';
      				document.getElementById('sellingListTb').style.display  = 'none';
      				document.getElementById('qnaListTb').style.display  = 'none';
      				
      				
      			}else if(schField == "sellingList"){
      				document.getElementById('orderListTb').style.display  = 'none';
      				document.getElementById('reviewListTb').style.display  = 'none';
      				document.getElementById('sellingListTb').style.display  = 'block';
      				document.getElementById('qnaListTb').style.display  = 'none';
      				
      			}else{
      				document.getElementById('orderListTb').style.display  = 'none';
      				document.getElementById('reviewListTb').style.display  = 'none';
      				document.getElementById('sellingListTb').style.display  = 'none';
      				document.getElementById('qnaListTb').style.display  = 'block';
      				
      			}
      			
      		}	
      	
      		
      		/* $(function(){
      			$("#selectBox").change(function(){
      				var tableSelect = $("#selectBox option:seleted").val();
      				if( tableSelect == 'qnaListTb'){
      				document.getElementById('reviewListTb').style.display  = 'none';
      					
      				}
      			});
      		});
      	 */
      	
      	
      	</script>
   </section>
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>