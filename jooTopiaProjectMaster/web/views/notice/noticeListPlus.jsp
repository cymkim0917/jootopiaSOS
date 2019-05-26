<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*"%>
    
<%
	HashMap<String, Object> notice = (HashMap<String, Object>) request.getAttribute("notice");
	Notice n = (Notice) notice.get("n");
	ArrayList<Attachment> aList = (ArrayList<Attachment>) notice.get("aList");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">
<title>JooTopia</title>

<style>
   .outer{
      width:1000px;
      height: 100%;
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
  .detail td {
      text-align:center;
      width:1000px;
      border:1px solid #ddd;
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
		  <div class="outer">
		  
		  <form action="" id="noticeForm">
		      <table class="detail" align="center" >
		     
		         <tr>
		         	<td colspan="1" style="display:none;"><input type="hidden" value=<%= n.getbId() %> name="bid">제목</td>
		            <td colspan="10"><h3><%= n.getbTitle() %></h3></td>
		         </tr>
		         <tr>
		            
		            <td>조회수</td>
		            <td><label><%=n.getbCount() %></label></td>
		            <td>작성일</td>
		            <td><label><%=n.getModifyDate() %></label></td>
		         </tr>
		         

		         <tr>
		         	<td colspan="4">
		         	<br>
		            <% for(int i = 0; i < aList.size(); i++) { %>
			            <div id="noticeImg" align="center">
			            	<img id="NoticeImg" src="<%=aList.get(i).getFilePath()%>/<%=aList.get(i).getChangeName()%>" style="width: 350px">
				         </div>
				         <br>
		           <% } %>
		           	 <textarea rows="5" style="width: 100%; height:100%; border: 0; text-align: center; font-size:2em; ; resize: none;"><%= n.getbContent() %></textarea>
		           	 </td>
		         </tr>

		         
		      </table>
	      </form>
   </div>
   <br><br><br>
       <div class="notice" align="center">
	         <button style="background-color:hsla(9, 100%, 64%, 0.6); color:#32435F; font-weight:bold; border:none;" type="button" class="btn btn-primary btn-lg" onclick="location.href='<%=request.getContextPath()%>/selectList.do'">목록</button>
	         <button style="background-color:hsla(9, 100%, 64%, 0.6); color:#32435F; font-weight:bold; border:none;" type="button" class="btn btn-primary btn-lg" onclick="review_delete();">삭제</button>
			      <script>
			      function review_delete(){
			    	  <% if(loginUser== null){ %>
			    	  	alert('로그인 후 이용가능한 서비스입니다');
			    	  	return false;
			    	  <% }else{%>
			    	  
			    	  var uno = <%=loginUser.getUno()%>		
			    	  
			    	  if(uno==1){
			    	  
			         alert("게시물을 삭제하시겠습니까?");
			         $("#noticeForm").attr("action","<%= request.getContextPath() %>/deleteNotice.do").submit();
			    		  
			    	  }else{
			    		  alert('권한이 없습니다.');
			    	  }
			         
			         <% } %>
			      }
			      
			      </script>
         </div>
			
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>