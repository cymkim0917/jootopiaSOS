<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/adminCommon.css">
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div id="adminSection" class="col-sm-10">
      <h3 class="title">매입대기</h3>
	    	<hr>
      
      <div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">매입대기리스트</th></tr>
				<tr>
					<td>검색 분류</td>
					<td colspan="2">
						&nbsp;<select id="searchCondition" >
							<option value="pName">상품명
							<option value="pCode">상품코드
							<option value="userName">주문자명
							<option value="userId">주문자 아이디
							<option value="phone">주문자 전화번호
						</select>
						<input type="search" placeholder="검색 단어를 입력하세요." width="20px">
					</td>
				</tr>
				<tr>
					<td>상품 카테고리</td>
					<td colspan="2">
						&nbsp;<select id="searchCategory" onchange="smallCategoty(this.value)">
							<option value="">- 대분류 -
							<option value="bedRoom">침실
							<option value="livingRoom">거실
							<option value="kitchen">주방
							<option value="study">서재
						</select>
						<select id="small">
							<option value="">- 중분류 -
						</select>
					</td>
				</tr>
				<tr>
					<td>상품 등록일</td>
					<td id="selectDate" colspan="2">
						&nbsp;<a href="#" class="btnDate" period="0"><span>오늘</span></a>
						<a href="#" class="btnDate" period="7"><span>7일</span></a>
						<a href="#" class="btnDate" period="30"><span>1개월</span></a>
						<a href="#" class="btnDate" period="90"><span>3개월</span></a>
						<a href="#" class="btnDate" period="365"><span>1년</span></a>
						<a href="#" class="btnDate" period="-1"><span>전체</span></a> &nbsp;&nbsp;
						<input type="date" id="startDate" name="startDate" class="date" <%-- value="<%= startDay %>" --%>> ~ 
						<input type="date" id="endDate" name="endDate" class="date" <%-- value="<%= endDay %>" --%>>
					</td>
				</tr>
				<tr>
					<td>상품 상태</td>
					<td colspan="2">
						&nbsp;<input type="radio" name="pType" id="all"><label>전체</label>
						<input type="radio" name="pType" id=""><label>판매중</label>
						<input type="radio" name="pType" id=""><label>판매안함</label>
					</td>
				</tr>
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
		</div>
		
		<br><br><br><br>
      
      <br><br>
	
	<div class="container">
	<table class="table table-striped">
		<thead>
		<tr>
			<th>No</th>
			<th>상품바코드</th>
			<th>회원ID</th>
			<th>회원명</th>
			<th>대분류</th>
			<th>중분류</th>
			<th>지역</th>
			<th>신청날짜</th>
			
		</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>A001</td>
				<td>aaa</td>
				<td>김채굼</td>
				<td>가구</td>
				<td>침대</td>
				<td>서울</td>
				<td>18/12/24</td>
			</tr>
			<tr>
				<td>2</td>
				<td>B002</td>
				<td>bbb</td>
				<td>신소굼</td>
				<td>가전</td>
				<td>티비</td>
				<td>서울</td>
				<td>19/01/01</td>
			</tr>
			<tr>
				<td>3</td>
				<td>C003</td>
				<td>ccc</td>
				<td>육라라</td>
				<td>가전</td>
				<td>세탁기</td>
				<td>서울</td>
				<td>19/02/01</td>
			</tr>
		</tbody>
	</table>
	
	<!-- db 생기면 적용 -->
	<%-- <script>
				$(function(){
					<% for(Member m : list){ %>
					
					var $tableBody = $("table tbody");
					
					var $tr = $("<tr>");
					var $idTd = $("<td>").text('<%= m.getUserId()%>');
					var $nameTd = $("<td>").text('<%= m.getUserName()%>');
					var $genderTd = $("<td>").text('<%= m.getGender()%>');
					var $ageTd = $("<td>").text('<%= m.getAge() %>');
					var $emailTd = $("<td>").text('<%= m.getEmail() %>');
					var $phoneTd = $("<td>").text('<%= m.getPhone() %>');
					var $addressTd = $("<td>").text('<%= m.getAddress() %>');
					var $hobbyTd = $("<td>").text('<%= m.getHobby() %>');
					var $enrollDateTd = $("<td>").text('<%= m.getEnrollDate() %>');
					
					$tr.append($idTd);
					$tr.append($nameTd);
					$tr.append($genderTd);
					$tr.append($ageTd);
					$tr.append($emailTd);
					$tr.append($phoneTd);
					$tr.append($addressTd);
					$tr.append($hobbyTd);
					$tr.append($enrollDateTd);
					
					$tableBody.append($tr);
					
					
					<% } %>
				});
			</script> --%>
	
	
	<hr>
	<div align="center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div>
	</div>
	</div>
      
   </section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>