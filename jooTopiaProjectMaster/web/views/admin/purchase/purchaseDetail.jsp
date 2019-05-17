<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<script src="/jootopia/js/external/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<title>JooTopia</title>

<style>
.tableArea{
	width: 80%;
	margin : 0 auto;
}
.tableArea *{
	text-align:center;
}
.tableArea > table{
	width : 100%;
	border: 2px solid gray;
}
.tableArea tr{
	border-bottom: 1px solid lightgray;
}
.tableArea th{
	height : 45px;
}
.tableArea td{
	padding:10px;	
}
.tableArea th:nth-child(1){
	width: 30%;
	border-right: 1px solid lightgray;
}
.tableArea tr td:nth-child(1){
	font-weight:bold;
	border-right: 1px solid lightgray;
}
.detailImgBox{
	width: 40%;
	height: 200px;
	display:inline-block;
	/* vertical-align: top; */
	margin-right: 15px;
	/* border: 3px solid rgba(250, 250, 250, 0.5); */
	/* border: 1px solid black; */
}
.detailImgBox img{
	width: 100%;
	max-width: 100%;
	max-height: 100%;
	vertical-align: middle;
	margin-top: auto;
	margin-bottom:auto;
	align:center;
}
#denyModal .modal-body textarea{
	display: block;
	margin: 0 auto;
}
</style>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
	<section class="row">
	<%@ include file="/views/common/adminSideMenu.jsp" %>
		<div class="col-sm-10">
	    	<h3 class="title">매입신청 상세</h3>
	    	<hr>
	      	<div class="tableArea" align="center">
	      		<table>
	      			<tr>
	      				<th>항목</th>
	      				<th>상세정보</th>
	      			</tr>
	      			<tr>
	      				<td>신청자명</td>
	      				<td><%= hmap.get("applicant") %></td>
	      			</tr>
	      			<tr>
	      				<td>신청일자</td>
	      				<td><%= hmap.get("bDate") %></td>
	      			</tr>
	      			<tr>
	      				<td>주소</td>
	      				<td><%= hmap.get("appAddress") %></td>
	      			</tr>
	      			<tr>
	      				<td>연락처</td>
	      				<td><%= hmap.get("appPhone") %></td>
	      			</tr>
	      			<tr>
	      				<td>카테고리</td>
	      				<td><%= hmap.get("category") %></td>
	      			</tr>
					<tr>
						<td>브랜드</td>
						<td><%= hmap.get("brand") %></td>
					</tr>	
					<tr>
						<td>모델명</td>
						<td><%= hmap.get("model") %></td>
					</tr>      	
					<tr>
						<td>사용기간</td>
						<td><%= hmap.get("usePeriod") %></td>
					</tr>		
					<tr>
						<td>희망가격 / 구매정가</td>
						<td> 
							<span><%= hmap.get("primeCost") %></span> / <span><%= hmap.get("hopeCost") %></span>
						</td>
					</tr>
					<tr>
						<td>상품 특이사항</td>
						<td><%= hmap.get("bContent") %></td>
					</tr>
					<tr>
						<td>매입 요청 사항</td>
						<td>
							<%= hmap.get("memo") %>
						</td>
					</tr>
					<tr>	
						<td>이미지</td>
						<td>
							<div class="detailImgBox">
								<img src="/jootopia/images/sample.PNG">
							</div>
							<div class="detailImgBox">
								<img src="/jootopia/images/b1.jpg">
							</div>
							<div class="detailImgBox">
								<img src="/jootopia/images/s1.jpg">
							</div>
							<div class="detailImgBox">
								<img src="/jootopia/images/notice1.jpg">
							</div>
							<div class="detailImgBox">
								<img src="/jootopia/images/b1.jpg">
							</div>
							<div class="detailImgBox">
								<img src="/jootopia/images/s1.jpg">
							</div>
						</td>
					</tr>
	      		</table>
	      	</div>
	      	<div class="btnArea" align="center"> 
	      		<div class="submitBtnArea">
	      			<button class="jBtn" onclick="location.href='<%= request.getContextPath() %>/insertPurchaseAccept.do?no=<%= hmap.get("pcid")%>'">매입하기</button>
	      			<button class="jBtn" data-toggle="modal" data-target="#denyModal">매입거절</button>
	      		</div>
	      		<div class="moveBtnArea">
					<ul class="pagination">
						<li><a href="#">이전</a></li>
						<li>
							<a href="<%= request.getContextPath() %>/selectPurchaseAdminList.do">
								&nbsp;&nbsp;&nbsp;목록으로&nbsp;&nbsp;&nbsp;
							</a>
						</li>
						<li><a href="#">다음</a></li>
					</ul>
	      		</div>
	      	</div>
	    </div><!-- col-sm-10 -->
	    
		<div id="denyModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-body"><br>
			      <h3 align="center">매입 거절 이유를 작성해주세요</h3><br><br>
			      <textarea cols="60%" rows="10" name="denyReason" style="resize:none;">매입거절 사유를 작성해주세요.</textarea>
		      </div><br><br>
		      <div class="modal-footer">
		      	<button class="btn btn-danger" onclick="location.href='/jootopia/views/admin/purchase/purchaseDeny.jsp'">매입거절</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
	    
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>







