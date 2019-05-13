<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap연결 -->
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/jquery-3.4.0.min.js"></script>
<script src="/jootopia/js/external/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="/jootopia/css/admin/adminHeader.css">

<title>JooTopia</title>
</head>
<body>
	<header class="row" contextmenu="">
		<span class="col-lg-1" onclick="location.href='/jootopia/views/main/AdminMainPage.jsp'">
			<img id="navHomeBtn" src="/jootopia/images/adminMenuHomeBtn.png">
		</span>
		<span class="col-lg-1" onclick="location.href='/jootopia/views/admin/member/member.jsp'">
			회원관리
		</span>
		<span class="col-lg-1" onclick="location.href='/jootopia/adminBoardList.do'">
			게시판관리
		</span>
		<span class="col-lg-1" onclick="location.href='/jootopia/views/admin/purchase/purchaseList.jsp'">
			매입관리
		</span>
		<span class="col-lg-1" onclick="location.href='/jootopia/views/admin/product/productList.jsp'">
			상품관리
		</span>
		<span class="col-lg-1" onclick="location.href='/jootopia/views/admin/order/orderMain.jsp'">
			주문관리
		</span>
		<span class="col-lg-1" onclick="location.href='/jootopia/views/admin/storage/momo.jsp'">
			창고관리
		</span>
	</header>
	
	<!-- loginModal -->
	<div id="logModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Login</h4>
	      </div>
	      <div class="modal-body">
	        <form action="" method="post">
	        	<table align="center">
	        		<tr>
	        			<td><input type="text" name="userId" placeholder="ID"></td>
	        			<td><input type="submit" value="로그인" colspan="2"></td>
	        		</tr>
	        		<tr>
	        			<td><input type="password" name="password" placeholder="Password"></td>
	        		</tr>
	        	</table>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div> <!-- loginModal End -->
</body>
</html>


<%--
a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}
 
style 소스의 type = text를 제어하는 css로 한다.
a:link : 클릭하지 않은 링크
a:visited : 한번 클릭했던 혹은 다녀갔던 링크
a:hover : 링크를 클릭하려고 마우스를 가져갔을 때
decoration : 밑줄
none : 없는 상태
underline : 있는 상태

a:active : 링크부분에서 마우스를 누르고 있는 동안의 상태
 --%>
