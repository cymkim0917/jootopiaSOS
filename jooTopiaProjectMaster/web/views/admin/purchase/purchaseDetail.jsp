<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	      				<td>pc.getpcName</td>
	      			</tr>
	      			<tr>
	      				<td>신청일자</td>
	      				<td>pc.getpcDate</td>
	      			</tr>
	      			<tr>
	      				<td>주소</td>
	      				<td>pc.getpcAddress</td>
	      			</tr>
	      			<tr>
	      				<td>연락처</td>
	      				<td>010-9120-3120</td>
	      			</tr>
	      			<tr>
	      				<td>카테고리</td>
	      				<td>침실가구 > 침대</td>
	      			</tr>
	      			<tr>
	      				<td>사용기간</td>
	      				<td>
	      					<span>2019-05-01</span> ~ 
	      					<span>2019-05-10</span>
	      				</td>
	      			</tr>
					<tr>
						<td>브랜드</td>
						<td>KH가구</td>
					</tr>	
					<tr>
						<td>모델명</td>
						<td>KH123456</td>
					</tr>      	
					<tr>
						<td>사용기간</td>
						<td>1년미만</td>
					</tr>		
					<tr>
						<td>희망가격 / 구매정가</td>
						<td> 
							<span>30,000</span> / <span>200,000</span>
						</td>
					</tr>
					<tr>
						<td>상품 특이사항</td>
						<td>스크래치 있음 <br> 하지만 인기상품이었음<br>딸이 사용하던걸로 깔끔함</td>
					</tr>
					<tr>
						<td>매입 요청 사항</td>
						<td>
							기사님이 오전시간에 와주시면 좋을 것 같습니다<br>
							기사님이 집에 들어오실때 신발 신고 들어오시는 분들이 간혹 있는데<br>
							오셔서 물품이나 집을 깨끗히 다뤄주실 기사님이 오셨으면 좋겠습니다.<br>
							힘드신데 기사님들 고생 많으십니다 ㅎㅎ	
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
	      			<button class="jBtn" onclick="location.href='/jootopia/views/admin/purchase/purchaseAccept.jsp'">매입하기</button>
	      			<button class="jBtn" data-toggle="modal" data-target="#denyModal">매입거절</button>
	      		</div>
	      		<div class="moveBtnArea">
					<ul class="pagination">
						<li><a href="#">이전</a></li>
						<li>
							<a href="/jootopia/views/admin/purchase/purchaseList.jsp">
								&nbsp;&nbsp;&nbsp;목록으로&nbsp;&nbsp;&nbsp;
							</a>
						</li>
						<li><a href="#">다음</a></li>
					</ul>

	      			<!-- <button class="jBtnSide">이전</button>
	      			<button class="jBtnMid">목록으로</button>
	      			<button class="jBtnSide">다음</button> -->
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







