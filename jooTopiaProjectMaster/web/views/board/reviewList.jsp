<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="java.util.*,com.kh.jooTopia.board.model.vo.*"%>
<%
   ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
/* .outer {
   width: 1200px;
   height: 1500px;
   background: coral;
   color: white;
   margin-left: auto;
   margin-right: auto;
   margin-top: 50px;
} */
.thumbnailArea {
   width: 760px;
   height: 550px;
   margin: 0 auto;
}

.searchArea {
   width: 420px;
   margin: 0 auto;
}

.thumb-list {
   width: 30%;
   border: 3px solid white;
   display: inline-block;
   margin: 10px;
   align: center;
   padding: 10px;
   display: inline-block;
   margin: 10px;
   align: center;
   margin: 10px;
   align: center;
   align: center;
}

.thumb-list:hover {
   opacity: 0.8;
   cursor: pointer;
   background: rgb(255, 128, 128);
   font-weight: bold;
}

.thumb-list:hover .thumb-list p {
   font-weigt: bold;
   color: black;
}

.checkboxgroup {
   margin-left: 350px;
   margin-rignt: 150px;
}

.newWriting {
   margin-left: 1400px;
}

.boxArea {
   background: rgba(205, 38, 21, 0.18);
}
</style>

<title>JooTopia</title>
</head>
<body>
   <%@ include file="/views/common/navigation.jsp"%>
   <section>
      <div class="outer boxArea">
         <br>
         <h1 align="center">상품후기</h1>

         <br>

         <div class="thumbnailArea">
            <%
               for (int i = 0; i < list.size(); i++) {
                  HashMap<String, Object> hmap = list.get(i);
                  System.out.println("listSize : " + list.size());
            %>

            <div class="thumb-list" align="center">

               <input type="hidden" name="bno" value="<%=hmap.get("bid")%>"
                  id="bno">

               <%
                  System.out.println("reviewList : " + hmap.get("bid"));
               %>

               <img
                  src="<%=request.getContextPath()%>/images/review/<%=hmap.get("change_name")%>"
                  width="200px" height="150px">
               <p>
                  No.
                  <%=hmap.get("bno")%>
                  <br> 제목 :
                  <%=hmap.get("btitle")%><br> 글쓴이 :
                  <%=hmap.get("user_id")%><br> 조회수 :
                  <%=hmap.get("bcount")%>
               </p>
            </div>
            <%
               }
            %>
         </div>
      </div>
      <br> <br>



      <div class="searchArea">
         <% if(loginUser != null) { %>
         <button class="jBtn"
            onclick="location.href='<%=request.getContextPath()%>/views/board/reviewInsertForm.jsp'">작성하기</button>
         <% } %>
      </div>


      <br>
      <script>
         $(".thumb-list").on("click",function(){
            var num = $(this).children("#bno").val();
      
            location.href="<%=request.getContextPath()%>/selectOneReview.do?num="+ num;
         });
      </script>
   </section>

   <br>
   <br>
   <%@ include file="/views/common/footer.jsp"%>
</body>
</html>