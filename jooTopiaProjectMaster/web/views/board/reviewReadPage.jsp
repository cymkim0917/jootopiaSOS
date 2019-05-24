<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.board.model.vo.* , java.util.*"%>
<%	
	HashMap<String,Object> hmap = (HashMap<String,Object>) request.getAttribute("list");
	//Board b = (Board) request.getAttribute("b");
    ArrayList<Member> mList = (ArrayList<Member>) hmap.get("mList");
    ArrayList<Board> bList = (ArrayList<Board>) hmap.get("bList");
    // ArrayList<Attachment> aList = (ArrayList<Attachment>) list.get("aList");
   // ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
   // Attachment titleImg = fileList.get(0);
   // Attachment detailImg1 = fileList.get(1);
   //ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
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

<title>JooTopia</title>


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
      <h1 align="center">상품 후기</h1>
      <br>
      
       <div class="outer">
	      <table class="detail" align="center">
	         <tr>
	            <td width="50">제목</td>
	            <td colspan="5"><label><%=hmap.put("btitle","btitle") %></label></td>
	         </tr>
	         <tr>
	            <td>작성자</td>
	            <td><label><%= hmap.put("user_id","user_id") %></label></td>
	            <td>조회수</td>
	            <td><label><%= hmap.put("bcount","bcount") %></label></td>
	            <td>작성일</td>
	            <td><label><%= hmap.put("bdate","bdate") %></label></td>
	         </tr>
	         <tr>
	            <td>대표사진</td>
	            <td colspan="6" align="center">
	               <div id="titleImg" align="center">
	                  <img id="titleImg"
	                     src="<%=request.getContextPath() %>/images_upload/=titleImg.getChangeName()"/>
	               </div>
	            </td>
	         </tr>
	         <tr>
	            <td>사진메모</td>
	            <td colspan="6" height="200px" align="center">
	               <p id="contentArea"><%=hmap.put("bcontent","bcontent")%></p>
	            </td>
	         </tr>
	    	 <tr>
	            <td colspan="6">
	               <div class="detailImgArea" align="center" >
	                  <img id="detailImg1" class="detailImg"
	                  src="<%=request.getContextPath()%>/images_upload/=detailImg1.getChangeName()"/>
	               </div>
	            </td>
	         </tr>
	      </table>
   </div>
   <br><br><br>
       <div class="notice" align="center">
	         <button onclick="location.href='<%=request.getContextPath()%>/selectReviewTotalList.do'">목록</button>
	         <%-- <button onclick="location.href='<%=request.getContextPath()%>/views/notice/reviewWrite.jsp'">수정</button> --%>
	         <button onclick="delconfirm();">삭제</button>
			      <script>
			    
			      
			      function delconfirm(){
			    	  var message = confirm("정말 삭제하시겠습니까?");
			    	  if(message == true){
			    		  alert("삭제되었습니다.");
			    		  location.href=<%= hmap.%>
			    		  
			    		  
			    	  }else{
			    		  
			    	  }
			    	  return false;			    	  
			      }
			      
			     
			      
			      </script>
         </div>
        
   <br><br>
   </section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>