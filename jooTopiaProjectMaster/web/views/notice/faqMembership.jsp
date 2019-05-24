<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*"%>
    
    
    <%
		ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
    
	%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<style>
.bgstick {
  background-color: coral;
  
  height:200px;
 /*  width:2000px; */
  
}

.notice {
	text-align: center;
	
	padding: 50px;
}
 .notice button {
	width:100px;
	height:100px;
	border:1px solid black;
	margin-bottom: 200%;
	margin-left: 3%;
	margin-right: 3%;
} 

.checkboxgroup{
	margin-left:10%;
}

table th{
		text-align: center;
	}

</style>

<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	
	<br>
		<h1 align="center">회원가입 FAQ</h1>
		
		<br>
		
		 <div class = "bgstick" align="center">
			
			
			<div class="notice">
			<%-- <button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqMembership.jsp'">회원가입</button> --%>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqPersonal.jsp'">개인정보</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqPurchase.jsp'">상품구매</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqOrderCancle.jsp'">주문/취소</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqPaymentSending.jsp'">결제/배송</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqRefunding.jsp'">교환/환불</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqTheothers.jsp'">기타</button>
			
			</div>
			
			
		</div>
		
		<br><br><br><br>
		
		<div class="container">
		
		
		  <!-- <h2>Hover Rows</h2>
		  <p>The .table-hover class enables a hover state on table rows:</p>   -->          
		  <table class="table table-hover">
		   
		      <tr>
		        <th>글번호</th>
		        <th>분류</th>
		        <th>제목</th>		        
		        <th>조회수</th>
		      </tr>


			<%for(int i = 0; i < list.size(); i++){ %>
			<tr>
				<td><%=list.get(i).getbId() %></td>
				<td><%=list.get(i).getfCategory() %></td>
				<td><%=list.get(i).getbTitle() %></td>
				<td><%=list.get(i).getbCount() %></td>
			</tr>
			
			<%} %>
				 
			
		  </table>
		</div>
		
		<br>
		<div class="checkboxgroup">
		
		<input type="checkbox" name="chk_info" value="title" checked="checked">제목
		<input type="checkbox" name="chk_info" value="content">내용
		<input type="text">&nbsp;
		<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqMembership.jsp'">검색</button>
		</div> 
		
		
		<div class ="paging button" align="center">
			<button type="submit"><<</button>&nbsp;
			<button type="submit"><</button>&nbsp;
			<button type="submit">1</button>&nbsp;
			<button type="submit">2</button>&nbsp;
			<button type="submit">3</button>&nbsp;
			<button type="submit">4</button>&nbsp;
			<button type="submit">5</button>&nbsp;
			<button type="submit">></button>&nbsp;
			<button type="submit">>></button>
		</div>
	
	 <script>
			 
			 
			 $(".table td").click(function() {
				 
				 console.log("ddddd");
				 var num = $(this).parent().children().eq(0).text();
				 console.log(num);
				 location.href="<%=request.getContextPath()%>/selectFaqMembershipList.do?num="+num;
				 
				/*  $('',this).triger('click'); */
				 
			 });
			
			
				
				
				
				
			</script> 
	
	
	
	
	
	
		
	</section>
	<br>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>