<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*"%>
    
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
	ArrayList<Member> mList = (ArrayList<Member>) hmap.get("mList");
	ArrayList<Notice> nList = (ArrayList<Notice>) hmap.get("nList");
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

.snip1535 {
  background-color: #c47135;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
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
</style>

<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	<br><br>
      <h1 align="center">공지사항/이벤트</h1>
      <br>
       <div>
       <table class="table table-hover" id="listTable">
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
                 <td><%if(nList.get(i).getnType().equals("공지사항")){ %>
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
			<button class="snip1535" onclick="location.href='<%=request.getContextPath()%>/views/notice/noticeList.jsp'">검색</button>
		</div>
		
		<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="#">이전</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">다음</a></li>
		</ul>
		</div>
		
		 <script>
		 $(".table td").click(function() {
			 console.log("ddddd");
			 var num = $(this).parent().children().eq(0).text();
			 console.log(num);
			 location.href="<%=request.getContextPath()%>/selectOneNotice2.do?num="+num;
			 
			/*  $('',this).triger('click'); */
		 });
		</script> 
	</section>
	
	<br><br>
	
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>