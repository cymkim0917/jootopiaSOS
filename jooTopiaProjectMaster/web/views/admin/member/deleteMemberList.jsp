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
	#updateBtnArea>input {
		width: 90px;
		height: 35px;
		border: none;
		background: rgb(224, 224, 224);
		border-radius: 10px;
		cursor: pointer;
		margin-left: 20px;
		margin-right: 20px;
	}
	#updateBtnArea>input:hover {
		background: rgb(92, 55, 39);
		color: white;
	}
	#memberList{
		text-align:center;
	}
	#memberList tr{
		height:50%;
	}
</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      <h3 class="title">탈퇴회원관리</h3>
	  <hr>
       <div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">　</th></tr>
				<tr>
					<td>탈퇴사유</td>
					<td colspan="2">
						&nbsp;<select id="searchCondition" >
							<option value="">이용빈도 낮음
							<option value="">배송지연
							<option value="">신뢰도 하락
							<option value="">제품 품질 불만
							<option value="">혜택부족
							<option value="">군입대
							<option value="">강퇴
						</select>
					</td>
				</tr>
				<tr>
					<td>탈퇴 유형</td>
					<td colspan="2">
						&nbsp;<select id="searchCategory" onchange="smallCategoty(this.value)">
							<option value="">자진
							<option value="bedRoom">강퇴
						</select>
					</td>
				</tr>
				<tr>
					<td>탈퇴일자</td>
					<td id="selectDate" colspan="2">
						&nbsp;<a href="#" class="btnDate" period="0"><span>오늘</span></a>
						<a href="#" class="btnDate" period="7"><span>7일</span></a>
						<a href="#" class="btnDate" period="30"><span>1개월</span></a>
						<a href="#" class="btnDate" period="90"><span>3개월</span></a>
						<a href="#" class="btnDate" period="365"><span>1년</span></a>
						<a href="#" class="btnDate" period="-1"><span>전체</span></a> &nbsp;&nbsp;
						<input type="date" id="startDate" name="startDate" class="date" value=""> ~ 
						<input type="date" id="endDate" name="endDate" class="date" value="">
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td colspan="2">
						<input type="search" placeholder="아이디를 입력하세요." width="20px">
					</td>
				</tr>
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
		</div>
		<hr>
		<div id="resultArea">
			<form>
		   		<table id="memberList" border="1" align="center" width="100%"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="100px;">아이디</th>
		   				<th width="100px;">이름</th>
		   				<th width="100px;">탈퇴일</th>
		   				<th width="150px;">탈퇴사유</th>
		   				<th width="200px;">탈퇴유형</th>
		   				<th width="300px;">강퇴사유</th>
		   			</tr>
		   			<tr>
		   				<td><input type="checkbox"></td>
		   				<td>kyu</td>
		   				<td><a href="/jootopia/views/admin/member/deleteMemberList.jsp">김규형</a></td>
		   				<td>990302</td>
		   				<td>01022223333</td>
		   				<td>kyu@co.kr</td>
		   				<td>서울시 서대문구</td>
		   			</tr>
		   		</table>
		   	</form>
		   	<br>
		   	<div id="updateBtnArea" align="center">
		   		<input type="button" value="복구">
		   	</div>
		</div>	
		<hr>
		
	
      </div>
   </section>
   
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>