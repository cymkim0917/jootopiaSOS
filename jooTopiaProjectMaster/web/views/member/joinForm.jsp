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
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
   <section>
         <div id="wrapper">
      
                  <h4  style="font-weight: bold;" align="center">
                     회원가입</h4>
     		
               
          <form method="post" id="joinForm" action="<%= request.getContextPath() %>/insert.do">
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

               
                         <div class="modal-footer" id="btnArea">
             		   <input type="button" class="btn btn-info" id="modifyBtn" value="회원가입" onclick="checkPassword();"> 
             		   <input type="reset" class="btn btn-info" id = "delBtn" value="Reset"><br />
              
               </div>
               </form>
		 </div>
                     <br>
				
	<script>
function checkPassword(){
	    
		var userPwd = $("#userPwd").val();
		var userId = $("#userId").val();
		var userPwd2 = $("#userPwd2").val(); 
		var isCheck = 1;
		
 	    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(userPwd)){            
 		   	$("#pwdArea").text('비밀번호 입력 형식에 어긋납니다.');
	        $('#password').val('').focus();
	        isCheck = 0;
	    }   
	    var checkNumber = userPwd.search(/[0-9]/g);
	    var checkEnglish = userPwd.search(/[a-z]/ig);
	    if(checkNumber <0 || checkEnglish <0){
	    	$("#pwdArea").text('비밀번호 입력 형식에 어긋납니다.');
	        $('#userPwd').val('').focus();
	        isCheck = 0;
	    }
	    if(/(\w)\1\1\1/.test(userPwd)){
	     	$("#pwdArea").text('같은 문자를 4번 이상 사용하실 수 없습니다.');
	        $('#userPwd').val('').focus();
	        isCheck = 0;
	    }

	        
	    if(userPwd.search(userId) > -1){
	       	$("#pwdArea").text('비밀번호에 아이디가 들어가있습니다.');
	        $('#userPwd').val('').focus();
	        isCheck = 0;
	    }
	    
        if(userPwd!=userPwd2){
        	$("#pwdArea2").text('비밀번호 불일치');
        	$('#userPwd2').val('').focus();
        	isCheck=0;
           }
	    
	    if(isCheck == 1){
	    	$("#joinForm").attr('action','<%= request.getContextPath() %>/insert.do').submit();
	    }else{
	    	alert('gg');
	    }   
	}
	</script>
   </section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>