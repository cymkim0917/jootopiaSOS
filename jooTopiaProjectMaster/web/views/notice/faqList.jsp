<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%--페이지 처리 --%>
   <%--  <%
	ArrayList<Board> list = 
		(ArrayList<Board>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	%> --%>
    
    
    
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

</style>

<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	
	
	<section>
	<br>
		<h1 align="center">FAQ LIST</h1>
		
		<br>
		
		 <div class = "bgstick" align="center">
			
			
			<div class="notice">
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqMembership.jsp'">회원가입</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqPersonal.jsp'">개인정보</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqPurchase.jsp'">상품구매</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqOrderCancle.jsp'">주문/취소</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqPaymentSending.jsp'">결제/배송</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqRefunding.jsp'">교환/환불</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqTheothers.jsp'">기타</button>
			
			</div>
			
			
		</div>
		
		
		
		<!--  <div class = "bgstick" align="center">
			<button style="submit" height="100px" width="200px">공지사항</button>&nbsp;
			<button style="submit">상품후기</button>&nbsp;
			<button style="submit">FAQ</button>
			<input type="submit" value="회원가입" style="height:50px; width:100px; margin-top:50px;">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="개인정보" style="height:50px; width:100px; margin-top:50px;">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="상품구매" style="height:50px; width:100px; margin-top:50px;">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="주문절차/취소" style="height:50px; width:100px; margin-top:50px;">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="결제/배송" style="height:50px; width:100px; margin-top:50px;">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="교환/환불" style="height:50px; width:100px; margin-top:50px;">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="기타" style="height:50px; width:100px; margin-top:50px;">&nbsp;&nbsp;&nbsp;&nbsp;
		</div>  -->
		
		<br><br><br><br>
		
		
		
		
		
		
		
		<div class="container">
		
		
		  <!-- <h2>Hover Rows</h2>
		  <p>The .table-hover class enables a hover state on table rows:</p>   -->          
		  <table class="table table-hover">
		    <thead>
		      <tr>
		        <th>글번호</th>
		        <th>분류</th>
		        <th>제목</th>
		        <th>작성일</th>
		        <th>조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>John</td>
		        <td>교환/환불</td>
		        <td>john@example.com</td>
		        <td>John</td>
		        <td>Doe</td>
		      </tr>
		      <tr>
		        <td>Mary</td>
		        <td>상품구매</td>
		        <td>mary@example.com</td>
		        <td>John</td>
		        <td>Doe</td>
		      </tr>
		      <tr>
		        <td>July</td>
		        <td>주문절차/취소</td>
		        <td>july@example.com</td>
		        <td>John</td>
		        <td>Doe</td>
		      </tr>
		    </tbody>
		    
		    <tbody>
		      <tr>
		        <td>John</td>
		        <td>주문절차/취소</td>
		        <td>john@example.com</td>
		        <td>John</td>
		        <td>Doe</td>
		      </tr>
		      <tr>
		        <td>Mary</td>
		        <td>개인정보</td>
		        <td>mary@example.com</td>
		        <td>John</td>
		        <td>Doe</td>
		      </tr>
		      <tr>
		        <td>July</td>
		        <td>회원가입</td>
		        <td>july@example.com</td>
		        <td>John</td>
		        <td>Doe</td>
		      </tr>
		    </tbody>
		     
		    <tbody>
		      <tr>
		        <td>John</td>
		        <td>회원가입</td>
		        <td>john@example.com</td>
		        <td>John</td>
		        <td>Doe</td>
		      </tr>
		      <tr>
		        <td>Mary</td>
		        <td>상품구매</td>
		        <td>mary@example.com</td>
		        <td>John</td>
		        <td>Doe</td>
		      </tr>
		      <tr>
		        <td>July</td>
		        <td>교환/환불</td>
		        <td>july@example.com</td>
		        <td>John</td>
		        <td>Doe</td>
		      </tr>
		    </tbody>
		  </table>
		</div>
		
		<br>
		<div class="checkboxgroup">
		<input type="checkbox" name="chk_info" value="name">이름
		<input type="checkbox" name="chk_info" value="title" checked="checked">제목
		<input type="checkbox" name="chk_info" value="content">내용
		<input type="text">&nbsp;
		<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqList.jsp'">검색</button>
		</div>
		
		
		<%--페이지 처리 --%>
		
      <%-- <div class="pagingArea" align="center">
         <button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1'"> << </button>
         <% if(currentPage <= 1) { %>
         <button disabled> < </button>
         <% }else { %>
         <button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= currentPage - 1 %>'"> < </button>
         <% } %>
         
         <%for(int p = startPage; p <= endPage; p++){ 
         		if(p == currentPage){      
         %>
         
         	<button disabled><%= p %></button>
         
         <%}else{ %>
         	<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=<%=p %>'"><%=p %></button>
         
         <%    } %>
         
         <% } %>
         
         
         
         
         
         <% if(currentPage >= maxPage) { %>
         <button disabled> > </button>
         <% }else { %>
         <button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= currentPage + 1 %>'"> > </button>
         <% } %>
         <button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= maxPage %>'"> >> </button>
      </div>
		 --%>
		
		
		
		
		
		
		
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
		
	</section>
	
	<br>
	
	
	
		
	
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>