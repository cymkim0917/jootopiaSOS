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
}

.notice {
	text-align: center;
	padding: 50px;
}
 .notice button {
  	ailgn:center;
	border:1px solid black;
	margin-bottom: 200%;
	margin-left: 3%;
	margin-right: 3%;
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 20px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
} 
 .notice button:hover{
 	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
 }
.checkboxgroup{
	margin-left:10%;
}
.snip1535 {
  background-color: #c47135;
  border: none;
  color: #ffffff;
  cursor: pointer;
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 1em;
  font-size: 13px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 12px 40px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: #c47135;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: #c47135;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: #c47135;
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}
#cateArea1,#cateArea2,#cateArea3,#cateArea4,#cateArea5,#cateArea6,#cateArea7 {
	align: center;
	float:left;
	width : 13%;
	padding : 0 12px !important;
}
.bgstick button {
	padding : 10% 5%;
	width : 100%;
}
.bgstick{
	text-align : center;
}
.notice{
	margin-left: 10px;
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
			<div class="notice" align="center">
				<div id="cateArea1">
					<button onclick="faqList('회원가입')">회원가입</button>
				</div>
				<div id="cateArea2"> 
					<button onclick="faqList('개인정보')">개인정보</button>
				</div>
				<div id="cateArea3">
					<button onclick="faqList('상품구매')">상품구매</button>
				
				</div>
				<div id="cateArea4">
					<button onclick="faqList('주문취소')">주문취소</button>
				
				</div>
				<div id="cateArea5">
					<button onclick="faqList('결제배송')">결제배송</button>
				
				</div>
				<div id="cateArea6">
					<button onclick="faqList('교환환불')">교환환불</button>
				
				</div>
				<div id="cateArea7">
					<button onclick="faqList('기타')">기타</button>
				</div>
			</div>
		</div>
		<br><br><br><br>
		<div>
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
		        <td><%=b.getbNo() %>
		        	<input type="hidden" name="bid" id="bid" value="<%= b.getbId()%>">
		        </td>
		        <td><%=b.getfCategory() %></td>
		        <td><%=b.getbTitle() %></td>
		        <td><%=b.getbDate() %></td>
		        <td><%=b.getbCount() %></td>
		      </tr>
		      <%} %>
		   
		  </table>
		</div>
		<br>
		<script>
			 function faqList (fCategory){
					console.log(fCategory);
					 $.ajax({
						 type:"POST",
						 url:"selectFaqCategoryList.do", 
						 data:{fCategory:fCategory},
						 success:function(data){
							 
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
							 var bidAndBno = value.bNo + "<input type='hidden' id='bid' value='" + value.bId + "'>";
							 var $tr=$("<tr>");
							 var $noTd=$("<td>").html(bidAndBno);
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
			 
						 $("td").click(function() {
							 var num = $("#bid").val();
							 console.log(num);
							 location.href="<%=request.getContextPath()%>/SelectOneFaqTotalList.do?num="+num;
						 });
					 }, fail : function(){
						 console.log("실패");
					 }, complete : function(){
						 console.log("컴플리트");
					 }
				 });
			 } 
			 $(".table td").click(function() {
				 var num = $("#bid").val();
				 location.href="<%=request.getContextPath()%>/SelectOneFaqTotalList.do?num="+num;
			 });
			
			</script> 
	</section>
	<br>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>









