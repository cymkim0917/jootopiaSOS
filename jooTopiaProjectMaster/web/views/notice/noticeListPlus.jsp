<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*"%>
    
<%
	Notice n = (Notice) request.getAttribute("n");
	/* 
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int currentPage = pageInfo.getCurrentPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage(); 
	*/
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">
<title>JooTopia</title>

<!-- <style>



.containaer{
	margin-left:15%;
	margin-right:150px;
	margin-top:50px;
	width:1000px;
	height:800px;
	border:1px solid black;
	text-align:center;
}

.table-bordered tr th{
	 background-color:lightgray;
	 width:80px;
}
</style> -->

<style>
   <!--게시판 형식 -->
   /* .containaer{
   margin-left:250px;
   margin-right:150px;

   width:1000px;
   height:800px;
   }

   .table-bordered tr th{
    background-color:lightgray;
    width:80px;
   
   } */
   <!--게시판 형식 -->
   .outer{
      width:1000px;
      height:650px;
      background:black;
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
  .detail td {
      text-align:center;
      width:1000px;
      border:1px solid black;
   } 
   #titleImgArea {
      width:500px;
      height:300px;
      margin:0 auto;
   }
   #contentArea {
      height:30px;
   }
   .detailImgArea {
      width:250px;
      height:210px;
      margin:0 auto;
   }
   #titleImg {
      width:500px;
      height:300px;
   }
   .detailImg {
      width:250px;
      height:180px;
   }
   
</style>


</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<h1 align="center">공지사항/이벤트</h1>
		<br>
		<%-- <div class="containaer" align="center">
			<table class="listArea">
				<tbody>
					<tr>
						<th>제목</th>
						<td><%= n.getbTitle() %></td>
						<td><%=n.getModifyDate() %></td>
						<!-- <td><input type="text" placeholder="제목을 입력하세요" name="subject" style="width:900px;"></td> -->
					</tr>
					<tr>
						<th>내용</th>
						<ht><%=n.getbContent() %></ht>
						<!-- <td><textArea cols="10" placeholder="내용을 입력하세요" name="content" style="width:1000px; height:500px"></textArea></td> -->
						<!-- <td height="500px">내용입니다.</td> -->
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>
		<div class ="newWriting" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.do'">목록</button> 
		</div>	
		/////////////////////////////////
		(신테이블) --%>
		
		  <div class="outer">
	      <table class="detail" align="center">
	         <tr>
	            <td width="50">제목</td>
	            <td colspan="5"><label><%= n.getbTitle() %></label></td>
	         </tr>
	         <tr>
	            
	            <td>조회수</td>
	            <td><label><%=n.getbCount() %></label></td>
	            <td>작성일</td>
	            <td><label><%=n.getModifyDate() %></label></td>
	         </tr>
	         <tr>
	            <td>내용</td>
	            <td><label><%=n.getbContent() %></label></td>
	         </tr>
	         
	      </table>
   </div>
   <br><br><br>
       <div class="notice" align="center">
	         <button onclick="location.href='<%=request.getContextPath()%>/selectReviewTotalList.do'">목록</button>
	         <button onclick="location.href='<%=request.getContextPath()%>/views/notice/reviewWrite.jsp'">수정</button>
	         <button onclick="review_delete();">삭제</button>
			      <script>
			      function review_delete(){
			         alert("게시물을 삭제하시겠습니까?");
			      }
			      </script>
         </div>
		
		
		
		
		
		 <%-- <script>
			 
			 
			 $(".table td").click(function() {
				 
				 console.log("ddddd");
				 var num = $(this).parent().children().eq(0).text();
				 location.href="<%=request.getContextPath()%>/selectOne.do?num="+num;
				 
				/*  $('',this).triger('click'); */
				 
			 });
		</script>
		 --%>
				
			
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>