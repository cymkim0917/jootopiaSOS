<%@page import="com.kh.jooTopia.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>	
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap연결 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/bootstrap.min.js"></script>

<link rel="stylesheet" href="/jootopia/css/user/header.css" type="text/css" >
<!-- 모달용  css-->
<link rel="stylesheet" href="/jootopia/css/user/modal.css" type="text/css" >

<title>JooTopia</title>
</head>
<body>
	<header class="row">
		<span class="col-lg-1"></span> 
		<span class="col-lg-1" onclick="location.href='/jootopia/views/notice/csMain.jsp'">
			고객센터
		</span> 
		<span class="col-lg-1" onclick="location.href='/jootopia/views/purchase/purchaseInfo.jsp'"> 
			매입신청
		</span> 
		<span class="col-lg-1" onclick="location.href='/jootopia/views/member/userInfomationPage.jsp'"> 
			마이페이지
		</span> 
		<span class="col-lg-1" onclick="location.href='<%= request.getContextPath()%>/selectAllCart.do'"> 
			장바구니
		</span> 
		<span class="col-lg-3 logo"> 
			<img src="/jootopia/images/logo.png" onclick="location.href='/jootopia'">
		</span>
		<span class="col-lg-1" onclick="location.href='/jootopia/views/main/AdminMainPage.jsp'"> 
			Admin
		</span> 
		<span class="col-lg-1"data-toggle="modal" data-target="#logModal"> 
			Login
		</span> 
		<span class="col-lg-1" href="#joinModal" data-toggle="modal"  data-target="#joinModal"> 
			Join us
		</span> 
		<span class="col-lg-1"></span>
	</header>

	<nav class="navbar navbar-inverse mainNav">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li class="dropdown">
					<a class="dropdown-toggle"
					data-toggle="dropdown" href="/jootopia/views/notice/productList.jsp">침실 가구 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/jootopia/views/notice/productList.jsp">침대</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">옷장</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">수납장</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">화장대</a></li>
					</ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="/jootopia/views/notice/productList.jsp">서재 가구 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/jootopia/views/notice/productList.jsp">책상</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">책장</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">수납장</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">사무용의자</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="/jootopia/views/notice/productList.jsp">주방 가구 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/jootopia/views/notice/productList.jsp">식탁</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">전자레인지</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">수납장</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">식탁의자</a></li>
					</ul>
				</li>
				
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="/jootopia/views/notice/productList.jsp">거실 가구 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/jootopia/views/notice/productList.jsp">테이블</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">거실장</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">소파</a></li>
						<li><a href="/jootopia/views/notice/productList.jsp">수납장</a></li>
					</ul>
				</li>
				
				
				
				
			</ul>

			<!-- 상품검색 시작 -->
			<form class="navbar-form navbar-left" action="/action_page.php">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>

			<!-- 상품검색 끝 -->
		</div>
	</nav>
	<script>
      $(document).ready(function() {
			var nav = $('.mainNav').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > nav.top) {
					$('.mainNav').addClass('fixNav');
				} else {
					$('.mainNav').removeClass('fixNav');
				}
			});
		});
	</script>
	
	<!-- loginModal -->
	<div id="wrapper">
		<div id="logModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Login</h4>
					</div>
					<div class="modal-body">
						<form action="<%= request.getContextPath() %>/loginCheck.do" method="post">
							<table align="center">
								<tr><td colspan="2"><p>아이디</p></td></tr>
								<tr>
									<td><input type="text" name="userId" placeholder="ID">    </td>
									<td><input type="submit" value="로그인" colspan="2"></td>
								</tr>
								<tr><td colspan="2"><p>비밀번호</p></td></tr>
								<tr>
									<td><input type="password" name="userPwd"
										placeholder="Password"></td>
								</tr>
								
			

							</table>
							
						</form>
						<div id="searchArea">
							<p id="searchId">아이디 찾기</p>
							<p id="searchPwd">비밀번호 찾기</p>
						</div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- joinModal -->
	<div id="wrapper">
		<div class="modal fade" id="joinModal" role="dialog">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
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
									<td><input type="password" name="userPwd2" id="userPwd2" /> &nbsp; &nbsp; &nbsp;</td>
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
									<td><input type="text" name="zipCode"></td>
									<td><div id="ckZip" class="ckZip">검색</div></td>
								</tr>
								<tr>
									<td><label for="">주소</label></td>
									<td><input type="text" name="address1"></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="">상세주소</label></td>
									<td><input type="text" name="address2"></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="">이메일</label></td>
									<td><input type="email" name="email" /></td>
								</tr>
							</table>


							<br> <input type="button" class="btn btn-info"
								value="Submit" onclick="checkPassword();"> <input
								type="reset" class="btn btn-info" value="Reset">
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>


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
	    	$("#joinForm").submit();
	    }	    
	}

	</script>
	
	
</body>
</html>
