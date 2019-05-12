<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">

<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/jquery-3.4.0.min.js"></script>
<script src="/jootopia/js/external/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<style>
	input{
	 width:100%;
	}
	
	#memberList{
		width:100%;
		text-align:center;
	}

</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
	<%@ include file="/views/common/adminSideMenu.jsp" %>
    <div class="col-sm-10">
    <h3 class="title">회원관리</h3>
	<hr>
		<div>
			<form>
			<table id="searchBox" border="1">
				  <tr>
				    <td width="15%"><label class="titleName">아이디</label></td>
				    <td><input type="text" width="100%"></td>
				    <td width="15%"><label class="titleName">전화번호</label></td>
				    <td><input type="phone"></td>
				  </tr>
				  <tr>
				    <td><label class="titleName">이메일</label></td>
				    <td><input type="email"></td>
				    <td><label class="titleName">생년월일(ex 991225)</label></td>
				    <td><input type="text"></td>
				  </tr>
				  <tr>
				    <td><label class="titleName">주소</label></td>
				    <td colspan="3"><input type="text"></td>
				  </tr>
			</table>
			<br>
			<div id="searchBtnArea" align="right">
				<input type="submit" value="조회">
			</div>
			</form>
		</div>
		<hr>
		<div id="resultArea">
			<form>
		   		<table id="memberList" border="1" align="center"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="100px;">아이디</th>
		   				<th width="100px;">이름</th>
		   				<th width="100px;">생년월일</th>
		   				<th width="150px;">전화번호</th>
		   				<th width="200px;">email</th>
		   				<th width="300px;">주소</th>
		   			</tr>
		   			<tr>
		   				<td><input type="checkbox"></td>
		   				<td>kyu</td>
		   				<td>김규형</td>
		   				<td>990302</td>
		   				<td>01022223333</td>
		   				<td>kyu@co.kr</td>
		   				<td>서울시 서대문구</td>
		   			</tr>
		   		</table>
		   	</form>
		   	<hr>
		   	<div id="searchBtnArea" align="right">
		   		<input type="submit" value="강퇴">
		   		<input type="button" value="수정" onclick="location.href='/jootopia/views/admin/member/detailMember.jsp'">
		   	</div>
		
		
		</div>
      	
   </div>
   
   <script>
   	$(".memberList").click(function(){
   		location.href="detailMemberList.jsp"
   	});
   
   </script>
      
      
   </section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>







