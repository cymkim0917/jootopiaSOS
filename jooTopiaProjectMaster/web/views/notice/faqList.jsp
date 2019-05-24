<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*"%>
    
<%
		ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
%>
    
    
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
			<%-- <button onclick="location.href='<%=request.getContextPath()%>/selectFaqMembershipList.do'">회원가입</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqPersonal.jsp'">개인정보</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqPurchase.jsp'">상품구매</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqOrderCancle.jsp'">주문/취소</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqPaymentSending.jsp'">결제/배송</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqRefunding.jsp'">교환/환불</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqTheothers.jsp'">기타</button>
			 --%>
			<button onclick="faqList('회원가입')">회원가입</button>
			<button onclick="faqList('개인정보')">개인정보</button>
			<button onclick="faqList('상품구매')">상품구매</button>
			<button onclick="faqList('주문취소')">주문취소</button>
			<button onclick="faqList('결제배송')">결제배송</button>
			<button onclick="faqList('교환환불')">교환환불</button>
			<button onclick="faqList('기타')">기타</button>
			</div>
		</div>
		<br><br><br><br>
		<div class="container">
		  <!-- <h2>Hover Rows</h2>
		  <p>The .table-hover class enables a hover state on table rows:</p>   -->          
		  <table class="table table-hover" id="faqList">
		      <tr>
		        <th>글번호</th>
		        <th>분류</th>
		        <th>제목</th>
		        <th>작성일</th>
		        <th>조회수</th>
		      </tr>
		   
		    <% for(Board b: list){ %>
		      <tr>
		        <td><%=b.getbId() %></td>
		        <td><%=b.getfCategory() %></td>
		        <td><%=b.getbTitle() %></td>
		        <td><%=b.getbDate() %></td>
		        <td><%=b.getbCount() %></td>
		      </tr>
		      <%} %>
		   
		  </table>
		</div>
		<br>
		<div class="checkboxgroup">
			<input type="checkbox" name="chk_info" value="title" checked="checked">제목
			<input type="checkbox" name="chk_info" value="content">내용
			<input type="text">&nbsp;
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/faqList.jsp'">검색</button>
		</div>
		<!--  <div class ="paging button" align="center">
			<button type="submit"><<</button>&nbsp;
			<button type="submit"><</button>&nbsp;
			<button type="submit">1</button>&nbsp;
			<button type="submit">2</button>&nbsp;
			<button type="submit">3</button>&nbsp;
			<button type="submit">4</button>&nbsp;
			<button type="submit">5</button>&nbsp;
			<button type="submit">></button>&nbsp;
			<button type="submit">>></button>
		</div>  -->
		<script>
			 $(".table td").click(function() {
				 console.log("ddddd");
				 var num = $(this).parent().children().eq(0).text();
				 console.log(num);
				 location.href="<%=request.getContextPath()%>/SelectOneFaqTotalList.do?num="+num;
			 });
			 
			 
			 
			 
			 
			 
			 
			 function faqList (fCategory){
					console.log(fCategory);
					 $.ajax({
						 type:"POST",
						 url:"selectFaqCategoryList.do", 
						 data:{fCategory:fCategory},
						 success:function(data){
							/*  console.log(data);
						 /* location.href:"selectFaqTotal.do" */
						 //console.log(data[0]); */
						 
						 $tableBody = $("#faqList tbody"); //tbody는 자동으로 생성되있고 눈에는 보이지 않는다.
						 $tableBody.html('');//초기화
						 
						 var $tr1=$("<tr>")
						 var $noTh=$("<th>").text("글번호");
						 var $fCategoryTh=$("<th>").text("분류");
						 var $bTitleTh=$("<th>").text("제목");
						 var $bDateTh=$("<th>").text("작성일");
						 var $bCountTh=$("<th>").text("조회수");
						 
						 $tr1.append($noTh);
						 $tr1.append($fCategoryTh);
						 $tr1.append($bTitleTh);
						 $tr1.append($bDateTh);
						 $tr1.append($bCountTh);
						 $tableBody.append($tr1);
						 
						 $.each(data,function(index,value){
							 var $tr=$("<tr>");
							 var $noTd=$("<td>").text(value.bNo);
							 var $fCategoryTd=$("<td>").text(value.fCategory);
							 var $bTitleTd=$("<td>").text(decodeURIComponent(value.bTitle));
							 var $bDateTd=$("<td>").text(value.bDate);
							 var $bCountTd=$("<td>").text(value.bCount);
							 
							 
							 $tr.append($noTd);
							 $tr.append($fCategoryTd);
							 $tr.append($bTitleTd);
							 $tr.append($bDateTd);
							 $tr.append($bCountTd);
							 $tableBody.append($tr);
						 })
			 
			 
			 
			 
			 /*  원본시작 ----------------------------- */
			/* function faqList (fCategory){
				console.log(fCategory);
				 $.ajax({
					 type:"POST",
					 url:"selectFaqCategoryList.do", 
					 data:{fCategory:fCategory},
					 success:function(data){
						/*  console.log(data);
					 /* location.href:"selectFaqTotal.do" */
					 //console.log(data[0]); */
					 
					 /* $tableBody = $("#faqList tbody"); //tbody는 자동으로 생성되있고 눈에는 보이지 않는다.
					 $tableBody.html('');//초기화
					 
					 var $tr1=$("<tr>")
					 var $noTh=$("<th>").text("글번호");
					 var $fCategoryTh=$("<th>").text("분류");
					 var $bTitleTh=$("<th>").text("제목");
					 var $bDateTh=$("<th>").text("작성일");
					 var $bCountTh=$("<th>").text("조회수");
					 
					 $tr1.append($noTh);
					 $tr1.append($fCategoryTh);
					 $tr1.append($bTitleTh);
					 $tr1.append($bDateTh);
					 $tr1.append($bCountTh);
					 $tableBody.append($tr1);
					 
					 $.each(data,function(index,value){
						 var $tr=$("<tr>");
						 var $noTd=$("<td>").text(value.bId);
						 var $fCategoryTd=$("<td>").text(value.fCategory);
						 var $bTitleTd=$("<td>").text(decodeURIComponent(value.bTitle));
						 var $bDateTd=$("<td>").text(value.bDate);
						 var $bCountTd=$("<td>").text(value.bCount);
						 
						 
						 $tr.append($noTd);
						 $tr.append($fCategoryTd);
						 $tr.append($bTitleTd);
						 $tr.append($bDateTd);
						 $tr.append($bCountTd);
						 $tableBody.append($tr);
					 }) */ 
					/*  원본 끝 ----------------------------- */
					 
			<%-- $("td").click(function() {
				 console.log("ddddd");
				 var num = $(this).parent().children().eq(0).text();
				 console.log(num);
				 location.href="<%=request.getContextPath()%>/selectFaqCList.do?num="+num;
			 }); --%>
			 
			 
			 $("td").click(function() {
				 console.log("ddddd");
				 var num = $(this).parent().children().eq(0).text();
				 console.log(num);
				 location.href="<%=request.getContextPath()%>/selectFaqCList.do?num="+num;
			 
			 }); 
			 
					 }
				 });
			  
			 } 
			
			
			
			
			</script> 
	</section>
	<br>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>