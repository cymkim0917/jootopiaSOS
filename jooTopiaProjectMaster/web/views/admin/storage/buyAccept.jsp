<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.board.model.vo.*, java.util.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
	String status = (String) hmap.get("status");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
	System.out.println("hmap : " + hmap);
	System.out.println("status : " + status);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/jquery-3.4.0.min.js"></script>
<script src="/jootopia/js/external/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<title>JooTopia</title>
<style>
.statusArea{
	width: 70%;
	margin: 10px auto 40px;
}
.statusArea table{
	width: 100%;
	box-sizing: border-box;
	text-align: center;
}
.statusArea table th{
	border-top: 2px solid black;
	border-bottom: 1px solid black;
	height : 45px;
}
.statusArea > table td{
	border-bottom: 2px solid black;
	display: table-cell;
	height : 80px;
	line-height : 30px;
}
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
#modalTable tr{
	height : 35px;
}
#modalTable textarea{
	height : 50px;
}
#modalTable td:nth-child(1){
	width: 40%;
	text-align:center;
}
#modalTable td:nth-child(2){
	padding-left:5%; 
	text-align:center;
}
#modalTable td:nth-child(2) input{
	text-align:center;
}
#modalTable img{
	display: block;
	width: 250px;
	height : 100px;
	margin-left:10%;
}
.modalBtn{
	padding: 0 !important;
	width: 80% !important;
	margin : 0 !important;
	margin-left : 20px !important;		
}
#barCodeModal {
	padding-top: 200px;
}
</style>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">
			<h3 class="title">상품매입</h3>
			<hr>
			<% if(status.equals("현장거절")){ %>
			<div class="statusArea">	
	    		<table align="center">
	    			<tr>
	    				<th>매입 거절 사유</th>
	    			</tr>
	    			<tr>
	    				<td><%= hmap.get("denyPersonReason") %></td>
	    			</tr>
	    		</table>
	    	</div>
			<% } %>
			
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
						<td>구매정가  / 희망가격</td>
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
						<% if(hmap.get("memo") != null){ %>
							<%= hmap.get("memo") %>
						<% }else{ %>
							없음
						<% } %>
						</td>
					</tr>
					<tr>	
						<td>이미지</td>
						<td>
							<% for(Attachment at : fileList){ %>
							<div class="detailImgBox">
								<img src="/jootopia/images_upload/<%= at.getChangeName() %>">
								<% System.out.println("/jootopia/images/" +  at.getChangeName() ); %>
							</div>
							<% } %>
						</td>
					</tr>
	      		</table>
	      	</div>
	      	<div class="btnArea" align="center"> 
		      	<% if(status.equals("매입대기중")){ %>
		      	<form>
		      	</form>
	    		<div class="submitBtnArea">
	      			<button class="jBtn" data-toggle="modal" data-target="#buyModal">매입하기</button>
	      			<button class="jBtn" data-toggle="modal" data-target="#denyModal">매입거절</button>
	      		</div>
		    	<% } %>
	      		<div class="moveBtnArea">
					<ul class="pagination">
						<li>
							<a href="<%= request.getContextPath() %>/selectAdminBuy.do">
								&nbsp;&nbsp;&nbsp;목록으로&nbsp;&nbsp;&nbsp;
							</a>
						</li>
					</ul>
	      		</div>
	      	</div>
	    </div><!-- col-sm-10 -->
		<div id="buyModal" class="modal fade" role="dialog" data-backdrop="static">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-body">
						<br>
						<form action="<%= request.getContextPath() %>/insertPCDAccept.do?no=<%= hmap.get("pcid") %>" id="purchaseAccept" method="post">
							<h3 align="center">매입수락</h3>
							<br>
							<table align="center" width="60%" id="modalTable">
								<tr>
									<td><label>구매정가</label></td>
									<td><%=hmap.get("primeCost")%></td>
								</tr>
								<tr>
									<td><label>거리 / 용달비용</label></td>
									<td><%=hmap.get("appDistance")%> / <%=hmap.get("dPrice")%></td>
								</tr>
								<tr>
									<td><label>매입금액</label></td>
									<td><input type="number" name="buyPrice" value="" width="100%"></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center; font-weight: bold"><br>매입전달사항<br></td>
								</tr>
								<tr>
									<td colspan="2"><br>
									<textarea name="message" style="width: 100%; height: 100px; resize: none;"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center; font-weight: bold"><br>바코드
										<input type="hidden" id="bCodeCheck" value="N">
									</td>
								</tr>
								<tr>
									<td><img
										src="/jootopia/images/barcode/<%=hmap.get("pBarcode")%>.PNG">
										<span><%=hmap.get("pBarcode")%></span></td>
									<td>
										<button style="height: 100px;" class="jBtn modalBtn"
											id="barBtn" data-toggle="modal" data-target="#barCodeModal"
											onclick="return false;">상품확인</button>
									</td>
								</tr>
							</table>
						</form>
					</div><br><br>
					<div class="modal-footer">
						<button class="btn btn-danger" onclick="applyCheck()">매입완료</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="barCodeModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" align="center">바코드 확인</h4>
					</div>
					<div class="modal-body" align="center">
						<input type="text" id="checkBcode" placeholder="바코드를 스캔해주세요">
					</div>
					<div class="modal-footer" align="center">
						<button type="button" class="btn btn-danger" id="okay">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<div id="denyModal" class="modal fade" role="dialog" data-backdrop="static">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-body">
						<br>
						<h3 align="center">매입 거절 이유를 작성해주세요</h3><br><br>
						<textarea cols="60%" rows="10" name="denyReason" id="denyReason" style="resize: none;">매입거절 사유를 작성해주세요.</textarea>
					</div><br><br>
					<div class="modal-footer" align="center">
						<button class="btn btn-danger" onclick="purchaseDeny();">매입거절</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div> <!-- denyModal -->
		<script>
	      	$("#okay").click(function(){
	      		var inputCode = $("#checkBcode").val();
	      		console.log("inputCode : " + inputCode);
	      		console.log(<%= hmap.get("pBarcode")%> == inputCode);
	      		if(<%= hmap.get("pBarcode")%> == inputCode ){
	      			$("#barBtn").html("바코드 일치!");
	      			$("#barBtn").attr("disabled", true);
	      			$("#barBtn").css("background", "gray").css("color", "white");
	      			$("#bCodeCheck").val("Y");
	      			$("#barCodeModal").hide();
	      		}else{
	      			alert("바코드가 일치하지 않습니다.");
	      		}
	      	})
	      	$("#denyReason").focus(function(){
	      		$(this).html("");
	      	});
	      	function applyCheck(){
	      		if($("#bCodeCheck").val() == "Y"){
	      			$("#purchaseAccept").submit();
	      		}else{
	      			alert("바코드를 확인해주세요.");
	      		}
	      	}
			function purchaseDeny(){
				var denyReason = $("#denyReason").val();
				location.href="<%= request.getContextPath() %>/insertPersonDeny.do?no=<%= hmap.get("pcid") %>&denyReason=" + denyReason;
			}
		</script>
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>



