<%@page import="com.kh.jooTopia.member.model.vo.KakaoMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% KakaoMember kakao = (KakaoMember) request.getAttribute("kakao");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
</head>
<style>
	#modifyBtn{
		width:100px;
		background-color: #FFBB00;
	   border: none;
	   color:#fff;
	   padding: 15px 0;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 15px;
	   margin: 4px;
	   cursor: pointer;
	   border-radius:10px;
	}
	
	#delBtn{
		width:100px;
		background-color: #7A7A7A;
		border: none;
		color:#fff;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
	}	
	
	#btnArea{
		text-align:center;
	}
</style>
<body>
<%@ include file="/views/common/navigation.jsp" %>
   <section>
         <div id="wrapper">
      <div id="joinModal" role="dialog">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title" style="font-weight: bold;" align="center">
                     회원가입</h4>
      </div>
               <form action="<%= request.getContextPath() %>/kakaoInsert.do"
                  method="post" id="joinForm">
                  <div class="modal-body">
                           <input type="hidden" name="userId" id="userId" value="<%= kakao.getUserId() %>" />
                         <input type="hidden" name="userPwd" id="userPwd" value="<%= kakao.getUserPwd() %>"/>
                           
                           <input type="hidden" name="userName" id="userName" value="<%= kakao.getUserName() %>" />
               
                     <table id="joinArea" align="center">

                        <tr>
                           <td><label>생년월일</label></td>
                           <td><input type="date" name="date" /></td>
                        </tr>
                        <tr>
                           <td><label>핸드폰 번호</label></td>
                           <td><input type="tel" name="tel1" size="3" /> - <input
                              type="tel" name="tel2" size="4" /> - <input type="tel"
                              name="tel3" size="4" /> <br /></td>
                        </tr>
                        <tr>
                           <td><label for="">성별</label></td>
                           <td><input type="checkBox" value="M" id="gender"
                              value="gender" /> <label for="">남자</label> <input
                              type="checkBox" value="F" id="gender" value="gender" /> <label
                              for="">여자</label></td>
                        </tr>
                        <tr>
                           <td><label for="">우편번호</label></td>
                           <td><input type="text" name="zipCode" id="zipCode"></td>
                           <td><div id="ckZip" class="ckZip"
                                 onclick="searchAddress()">검색</div></td>
                        </tr>
                        <tr>
                           <td><label for="">주소</label></td>
                           <td><input type="text" name="address1" id="address1"></td>
                           <td></td>
                        </tr>
                        <tr>
                           <td><label for="">상세주소</label></td>
                           <td><input type="text" name="address2" id="address2"></td>
                           <td></td>
                        </tr>
                        <tr>
                           <td><label for="">이메일</label></td>
                           <td><input type="email" name="email" /></td>
                        </tr>
                     </table>


                     <br> <input type="submit" class="btn btn-info"> 
                        <input type="reset" class="btn btn-info" value="Reset">

                  </div>
                   <div class="modal-footer" id="btnArea">
             		   <input type="button" class="btn btn-info" id="modifyBtn"
                        value="Submit" onclick="checkPassword();"> <input
                        type="reset" class="btn btn-info" id = "delBtn" value="Reset"><br />
               
               </div>
               </form>
       
            </div>
   

   </section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>