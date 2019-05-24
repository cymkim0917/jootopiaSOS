<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*"%>
    
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
	ArrayList<Member> mList = (ArrayList<Member>) hmap.get("mList");
	ArrayList<Notice> nList = (ArrayList<Notice>) hmap.get("nList");
	
	/* PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int currentPage = pageInfo.getCurrentPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage(); */
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
.checkboxgroup{
	margin-left:10%;
}
.container {
	border:1px solid black;
	text-align:center;
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
	<br><br>
      <h1 align="center">공지사항/이벤트</h1>
      <br>
       <div class="container">
       <table class="table table-hover">
            <tr>
              <th>글번호</th>
              <th>유형</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>조회수</th>
            </tr>
            <% for(int i = 0; i < nList.size(); i++){ %>
               <tr>
                 <td><%= nList.get(i).getbNo() %></td>
                 <td><%if(nList.get(i).getnType()=="공지사항"){ %>
                    공지사항
                    <%}else{ %>
                    이벤트
                    <%} %>
                 </td>
                 <td><%=nList.get(i).getbTitle() %></td>
                 <td><%=mList.get(i).getUserId() %></td>
                 <td><%=nList.get(i).getModifyDate() %></td>
                 <td><%=nList.get(i).getbCount() %></td>
               </tr>
            <%} %>   
        </table>
      
      
     
      </div>  
		<br>
		<br>
		<div class="checkboxgroup">
			<input type="checkbox" name="chk_info" value="title" checked="checked">제목
			<input type="checkbox" name="chk_info" value="content">내용
			<input type="text">&nbsp;
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/noticeList.jsp'">검색</button>
		</div>
		 <script>
		 $(".table td").click(function() {
			 console.log("ddddd");
			 var num = $(this).parent().children().eq(0).text();
			 console.log(num);
			 location.href="<%=request.getContextPath()%>/selectNoticeOne.do?num="+num;
			 
			/*  $('',this).triger('click'); */
		 });
		</script> 
	</section>
	
	<br><br>
	
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>