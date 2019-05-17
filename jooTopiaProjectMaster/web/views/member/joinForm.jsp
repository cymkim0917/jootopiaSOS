<%@page import="com.kh.jooTopia.member.model.vo.KakaoMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
   <section>
         <div id="wrapper">
      <div id="joinModal" role="dialog">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title" style="font-weight: bold;" align="center">
                     회원가입</h4>
      </div>
               <form action="<%= request.getContextPath() %>/insert.do"
                  method="post" id="joinForm">
                  <div class="modal-body">
                     <table id="joinArea" align="center">
                        <tr>
                        
                           <td><label for="">아이디</label></td>
                           <td><input type="text" name="userId" id="userId" /></td>
                        </tr>
                        <tr>
                           <td><label for="">비밀번호</label></td>
                           <td><input type="password" name="userPwd" id="userPwd" /></td>

                        </tr>
                        <tr>
                           <td><p>숫자+영문자+특수문자 조합 8자리 이상</p> &nbsp; &nbsp; &nbsp;</td>
                           <td><p id="pwdArea" style="color: red;"></p></td>
                        </tr>
                        <tr>
                           <td><label for="">비밀번호 확인</label></td>
                           <td><input type="password" name="userPwd2" id="userPwd2" />
                              &nbsp; &nbsp; &nbsp;</td>
                           <td><p id="pwdArea2" style="color: red;"></p></td>
                        </tr>
                        <tr>
                           <td><label for="">이름</label></td>
                           <td><input type="text" name="userName" id="userName" /></td>
                        </tr>
         
           
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


                     <br> <input type="submit" class="btn btn-info"
                        value="Submit" onclick="checkPassword();"> <input
                        type="reset" class="btn btn-info" value="Reset">

                  </div>
               </form>
              
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
            </div>
   

   </section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>