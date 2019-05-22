<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="java.util.*,java.io.*"%>
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


<!-- 우편 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- kakao -->
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
		
		<% if(loginUser == null){ %>
		<span class="col-lg-1" data-toggle="modal" data-target="#logModal" id="loginBtn"> 
			Login
		</span> 
			
		<span class="col-lg-1" href="#joinModal" data-toggle="modal" data-target="#joinModal"> 
			Join us
		</span> 
			<% } else{ %>
			<span class="col-lg-2" id ="userName" onclick="location.href='<%= request.getContextPath() %>/logout.do'"> <%= loginUser.getUserName() %>님 환영! </span>
			<%} %>
			
		<span class="col-lg-1"></span>
	</header>

	<nav class="navbar navbar-inverse mainNav">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li class="dropdown">
					<a class="dropdown-toggle"
				 href="<%= request.getContextPath() %>/productList.do?cid=6">침실 가구 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a  href="<%= request.getContextPath() %>/productList.do?cid=1">침대</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=2">옷장</a></li>
						<li><a  href="<%= request.getContextPath() %>/productList.do?cid=3">수납장</a></li>
						<li><a  href="<%= request.getContextPath() %>/productList.do?cid=4">화장대</a></li>
					</ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle"
				 href="<%= request.getContextPath() %>/productList.do?cid=16">서재 가구 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=11">책상</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=12">책장</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=13">수납장</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=14">사무용의자</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle"
					 href="<%= request.getContextPath() %>/productList.do?cid=26">주방 가구 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=21">식탁</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=22">전자레인지</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=23">수납장</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=24">식탁의자</a></li>
					</ul>
				</li>
				
				<li class="dropdown"><a class="dropdown-toggle"
					 href="<%= request.getContextPath() %>/productList.do?cid=36">거실 가구 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=31">테이블</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=32">거실장</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=33">소파</a></li>
						<li><a href="<%= request.getContextPath() %>/productList.do?cid=34">수납장</a></li>
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
					<% if(loginUser == null){ %>
						<form action="<%= request.getContextPath() %>/loginCheck.do" method="post">
							<table align="center">
								<!-- <tr><td colspan="2"><p>아이디</p></td></tr> -->
								<tr><Br>
									<td><input type="text" name="userId" placeholder="ID"><br><Br></td>
									<td><input type="submit" value="로그인" rowspan="2"><br><Br></td>
								</tr>
								<tr>
									<td><input type="password" name="userPwd"
										placeholder="Password"><br><Br>
									</td>
								</tr>
							</table>
						</form>
						<div id="searchArea" align="center">
							<span id="searchId" onclick="showSearchId()">아이디 찾기</span> &nbsp;&nbsp;&nbsp;
							<span id="searchPwd" onclick="showSearchPass();">비밀번호 찾기</span>&nbsp;&nbsp;&nbsp;
							<!-- <span id="joinUs">회원가입</span> -->
							<br><Br>	
						</div>
						<div id="loginAPIArea" align="center">
						  <a id="kakao-login-btn"></a> 
						</div>
							<% }else { %>
						<div id="loginUserForm" align="center">
							<p style="font-weight:bold; size:30px; font-color:red;"> Welcome To JooTopia</p>
							<p style="font-weight:bold;" id="nameArea"><%= loginUser.getUserName() %> &nbsp; </p><p>님 환영합니다 ! </p>
						</div>
						<% } %>
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
                     회원가입 유형 선택</h4>
               </div>

                  <div class="modal-body">
                  	<div id="btnArea" align="center">
                  	<table>
                  		<tr>
                  			<td><img src="/jootopia/images/logo2.png" alt="" onclick="location.href='<%= request.getContextPath()  %>/views/member/joinForm.jsp'" width="223px" height="50px"/><br /></td>
                  		</tr>
                  		<tr>
                  			<td>
                  			<br />
                  			<a id="kakao-jogin-btn"></a></td>
                  		</tr>
                  		<tr>
                  			<td>구글이당</td>
                  		</tr>
                  	</table>
					</div>
                  </div>

               <form action="<%= request.getContextPath()  %>/getkakao.do" id="kakaoJoinForm" method="post">
                  <input type="hidden" name="kakaoToken" id="kakaoToken" />
               </form>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>
   </div>
	<script>
	function showSearchId(){
		  cw=450;
	      ch=580;
	      sw=screen.availWidth;
	      sh=screen.availHeight;
	      px=(sw-cw)/2;
	      py=(sh-ch)/2;
		    window.open('views/member/searchIdForm.jsp','','status=no, height='+ch+', width='+cw+', left='+ px + ', top=10');
	 }
	function showSearchPass(){
		  cw=450;
	      ch=580;
	      sw=screen.availWidth;
	      sh=screen.availHeight;
	      px=(sw-cw)/2;
	      py=(sh-ch)/2;
		    window.open('views/member/searchUserPwdForm.jsp','','status=no, height='+ch+', width='+cw+', left='+ px + ', top=10');
	}
    function searchAddress() {
        new daum.Postcode( {
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
    
    $(function(){
       $('.dropdown,.dropdown-menu').hover(function(){
            if($(window).width()>=768){
              $(this).addClass('open').trigger('shown.bs.dropdown')
              return false;
            }
          },function(){
            if($(window).width()>=768){
              $(this).removeClass('open').trigger('hidden.bs.dropdown')
              return false;
            }
          })
	    Kakao.init('788eca70f34bca3f27e5d166c44ff77f');
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	        container: '#kakao-login-btn',
	        success: function (authObj) {
	        	$("#kakaoToken").val(JSON.stringify(authObj));
	        	$("#kakaoJoinForm").submit();
	        },
	        fail: function (err) {
	            alert(JSON.stringify(err));
	        }
	    });
		Kakao.Auth.createLoginButton({
			container : '#kakao-jogin-btn',
			success : function(authObj) {
				alert(JSON.stringify(authObj));
				 $("#kakaoToken").val(JSON.stringify(authObj));
				$("#kakaoJoinForm").submit();
			}, fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	})
	//788eca70f34bca3f27e5d166c44ff77f
</script>
</body>
</html>
