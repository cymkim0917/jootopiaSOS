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
		#noticeList{
			text-align:center;
			width:100%;
		}
</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      <h3 class="title">공지사항 게시판 관리</h3>
		<hr>
      	<div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">　</th></tr>
				<tr>
					<td colspan="2">
						&nbsp;<input type="radio" name="pType" id="all"><label>전체</label>
						&nbsp;<input type="radio" name="pType" id=""><label>공지사항</label>
						&nbsp;<input type="radio" name="pType" id=""><label>이벤트</label>
					</td>
					<td colspan="2">
						&nbsp;
						<input type="search" placeholder="검색 단어를 입력하세요." width="20px">
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
		   		<table id="noticeList" border="1" align="center"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="50px;">글번호</th>
		   				<th width="100px;">제목</th>
		   				<th width="100px;">날짜</th>
		   				<th width="50px;">조회수</th>
		   				<th width="100px;">분류</th>
		   				
		   			</tr>
		   			
		   		</table>
		   	</form>
		</div>	
		   	<br>
		   	<hr>
		   	<div id="updateBtnArea" align="right">
		   		<input type="button" value="글쓰기" onclick="location.href='/jootopia/views/admin/board/noticeInsertForm.jsp'">
		   		<input type="button" value="수정"   onclick="location.href='/jootopia/views/admin/board/updateNotice.jsp'">
		   		<input type="button" value="삭제">
		   	</div>
		
		
		
		
		
      </div>
   </section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>