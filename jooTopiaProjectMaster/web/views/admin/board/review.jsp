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
	    #reviewList>tr{
	    	height:30px;
	    
	    }
	    #reviewList{
	    	width:100%;
	    	text-align:center;
	    }
	    .replyModalTable > tbody{
			width: 200px;
		}
		.replyModalTable th, .replyModalTable td{
			background: rgb(224, 224, 224);
			text-align: left;
			padding: 3px;
			height: 20px;
			align: center;
		}
		#replyTb{
			align:center;
		}

</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      <h3 class="title">후기게시판 관리</h3>
	  <hr>
      	<div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">　</th></tr>
				<tr>
					<td>작성자</td>
					<td colspan="2">
						&nbsp;
						<input type="search" placeholder="작성자를 입력하세요." width="20px">
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="2">
						&nbsp;
						<input type="search" placeholder="제목을 입력하세요." width="20px">
					</td>
				</tr>
				<tr>
					<td>상품 카테고리</td>
					<td colspan="2">
						&nbsp;<select id="searchCategory" onchange="smallCategoty(this.value)">
							<option value="">--- 대분류 ---</option>
							<option value="bedRoom">침실</option>
							<option value="livingRoom">거실</option>
							<option value="kitchen">주방</option>
							<option value="study">서재</option>
						</select>
						<select id="small">
							<option value="">--- 중분류 ---</option>
							
						</select>
					</td>
				</tr>
				<tr>
					<td>후기 등록일</td>
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
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
		</div>
		<hr>
		<div id="resultArea">
		<h3>후기글 목록</h3>
			<form>
		   		<table id="reviewList" border="1" align="center"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="100px;">글쓴이</th>
		   				<th width="200px;">제목</th>
		   				<th width="150px;">상품카테고리</th>
		   				<th width="100px;">작성일</th>
		   				<th width="100px;">평점</th>
		   			</tr>
		   			<tr id="detailreviews">
		   				<td width="50px;"><input type="checkbox"></td>
		   				<td width="100px;">kyukyu</td>
		   				<td width="200px;"></td>
		   				<td width="150px;">침실>침대</td>
		   				<td width="100px;">2019-05-09</td>
		   				<td width="100px;">4.5</td>
		   			</tr>
		   			
		   		</table>
		   	</form>
		   	<br>
		   	<div id="updateBtnArea" align="center">
		   		<input type="button" onclick="location.href='<%= request.getContextPath()%>/views/admin/board/detailReview.jsp'" value="삭제">
		   	</div>
		</div>	
      </div>
   </section>
   <!-- The Modal -->
	<div id="memoModal" class="memoModal">
	<div class="memoModalContent">
	<div class="memoModalHeader">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<table>
		<tr>
			<td width="400px;"><h3>글제목</h3></td>
			<td width="100px;">카테고리</td>
			<td width="100px;">작성자</td>
			<td width="100px;">작성일</td>
		</tr>
	
	
	</table>
	<hr>
	</div>
	<!-- Modal content -->
	    <div class="memoModalBody" align="center">
	    	<table class="memoModalTable">
	    		<tr>
	    			<td>
	    				<textarea cols="90%" rows="20" style="resize:none;"></textarea>
	    			</td>
	    		</tr>
	    	</table>
	    	<br>
	        <div id="replyTb">
	        <table class="replyModalTable">
	    		<tr>
	    			<th colspan="3">댓글</th>
	    		</tr>	    		
	    		<tr>
	    			<td>
	    				<input type="checkbox" >
	    			</td>
	    			<td>아이디</td>
	    			<td><textarea cols="85%" rows="1" style="resize:none"></textarea></td>
	    		</tr>
	    	</table>
	    	</div>
	    	<br>
	    	<div class="modalBtnArea" align="center">
					<input type="submit" value="삭제" onclick="">
					<input type="reset" value="닫기">
			</div>
	    </div>
	    </div>
	</div>
   <script>
   	$("#detailreviews").click(function() {
   		
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
		
	});
   
   
   </script>
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>