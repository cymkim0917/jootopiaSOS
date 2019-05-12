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
		#qnaList{
			text-align:center;
			width:100%;
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
      <h3 class="title">1:1질문 관리</h3>
      		<div class="searchArea">
      			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">　</th></tr>
				<tr>
					<td colspan="2">
						&nbsp;<input type="radio" name="qType" value="all"><label>전체</label>
						&nbsp;<input type="radio" name="qType" value="yes"><label>답변Yes</label>
						&nbsp;<input type="radio" name="qType" value="no"><label>답변No</label>
					</td>
					<td colspan="2">
						&nbsp;
						<input type="search" placeholder="아이디를 입력하세요." width="20px">
					</td>
				</tr>
			</table>
      		<br>
      		</div>
      		<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
	  <hr>
	  <div id="resultArea">
			<form>
		   		<table id="qnaList" border="1"> 
		   			<tr>
		   				<th width="50px;">선택</th>
		   				<th width="100px;">아이디</th>
		   				<th width="50px;">글번호</th>
		   				<th width="100px;">글제목</th>
		   				<th width="150px;">작성일</th>
		   				<th width="100px;">답변여부</th>
		   				
		   			</tr>
		   			
		   		</table>
		   	</form>
		</div>	
		   	<br>
		   	<hr>
		   	<div id="updateBtnArea" align="right">
		   		<input type="button" value="답변"   onclick="showModal();">
		   		<input type="button" value="삭제">
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
			<td width="100px;">아이디</td>
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
	    			<th colspan="3">답변</th>
	    		</tr>	    		
	    		<tr>
	    			<td><textarea cols="90%" rows="5" style="resize:none"></textarea></td>
	    		</tr>
	    	</table>
	    	</div>
	    	<br>
	    	<div class="modalBtnArea" align="center">
					<input type="submit" value="답변" onclick="">
					<input type="reset" value="닫기">
					
			</div>
	    </div>
	    </div>
	</div>
   <script>
  	 function showModal(){
  		 
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
  		 
  	 }
   		
   
   
   </script>
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>