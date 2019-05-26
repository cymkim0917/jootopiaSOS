<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.release.model.vo.*, com.kh.jooTopia.heap.model.vo.*, java.util.*"%>
	
<% ArrayList<ReleaseAdmin> list = (ArrayList<ReleaseAdmin>) request.getAttribute("list"); 
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
#test1 {
	text-align: center;
}
table th, td {
    border-top: 1px solid #ccc;  	
}
</style>
</head>
<body>
	<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">

			<h3 class="title">출고대기</h3>
			<hr>
			<br>

			<div class="listArea">

				<table class="table table-hover" id="test1">
				<thead >
					<tr>
						<th>배송번호</th>
						<th>주문번호</th>
						<th>상태</th>
						<th>배송중 처리</th>
					</tr>
				</thead>
				<% for(ReleaseAdmin r : list){ %>
				<tbody>
					<tr>
						<td><%= r.getdId() %></td>
						<td><%= r.getPoId() %></td>
						<td><%= r.getStatus() %></td>
						<th>
						<div id="memo" class="memo">MEMO
						</div>
						<input type="hidden" id="dMsg" value="<%= r.getdMessage() %>">
						</th>				
					</tr>
					<% } %>
				</tbody>
			</table>

		</div>
		
		<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="<%=request.getContextPath()%>/selectAdminRelease.do?currentPage=<%=currentPage-1%>">이전</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminRelease.do?currentPage=1">1</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminRelease.do?currentPage=2">2</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminRelease.do?currentPage=3">3</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminRelease.do?currentPage=4">4</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminRelease.do?currentPage=5">5</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminRelease.do?currentPage=<%=currentPage+1%>">다음</a></li>
		</ul>
		</div>
		</div>
		  
	</section>
	
	<%@ include file="/views/common/adminFooter.jsp"%>
	
	<!-- The Modal : 배송정보 관련 모달 -->
	<div id="memoModal" class="memoModal">
		<div class="memoModalContent">
		<div class="memoModalHeader">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4>배송정보 수정</h4>
		<hr>
		</div>
		<!-- Modal content -->
	    <div class="memoModalBody">
	    	<table class="memoModalTable">
	    		<tr>
	    			<th>배송코드 : <span id="modalDId">배송코드임시</span><br>
	    			주문코드 : <span id="modalPoId">주문코드임시</span>
	    		</tr>
	    	</table>
	    	<br>
	        <table class="memoModalTable">
	        	<tr>
	        		<th colspan="2">배송지 정보</th>
	        	</tr>
	        	<tr>
	    			<th>수령자명</th>
	    			<td>
	    			<input type="text" id="modalName" name="modalName" value="">
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>연락처</th>
	    			<td>
	    			<input type="text" id="modalPhone" name="modalPhone" value="">
					</td>
	    		</tr>
	    		<tr>
	    			<th>배송지 주소</th>
	    			<td>
	    			<input type="text" id="modalAddress" name="modalAddress" value="">
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>배송메시지</th>
	    			<td>
	    			<input type="text" id="oMemo" name="oMemo" placeholder="배송메시지를 입력하세요" value="">
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>배송시작일</th>
	    			<td>
	    			<input type="date" id="dStartDate" name="dStartDate" value="">
	    			</td>
	    		</tr>
	    	</table>
	    	<br>
	    	<div class="modalBtnArea" align="center">
					<input type="submit" value="수정" onclick="changeDelivery();">
					<input type="reset" value="닫기">
			</div>
	    </div>
	    </div>
	</div>
	
	<script>
		$(function(){
			$("#test1 td").mouseenter(function(){
				$(this).parent();
			}).mouseout(function(){
				$(this).parent();
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();				
				console.log(num);
				<%-- location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num; --%>
				<%-- location.href="<%=request.getContextPath()%>/insertAdminRelease.do"; --%>
				location.href="<%=request.getContextPath()%>/selectRLOne.do?num=" + num;
				/* location.href="views/admin/storage/releaseRegist.jsp"; */
			})
		});
		
		//배송정보 모달용 펑션
		$(".memo").click(function() {
			var dId = $(this).parent().parent().children().eq(0).text();
			
			//배송정보 출력용 에이젝스
			$.ajax({
				url : "selectDeliveryModal.do",
				type : "post",
				data : {dId : dId},
				success : function(data) {
					
					console.log(data);
					console.log(data["o"]);
					console.log(data["d"]);
					
					var order = data["o"];
					var delivery = data["d"];
					var startDate = data["startDate"];
					
					//조회 성공 시 모달에 넣어주기
					$(function() {
						$("#modalDid").text(delivery.dId);
						$("#modalPoId").text(order.poId);
						$('#modalPoDate').text(order.poDate);
						
						$("#modalName").val(order.name);
						$("#modalPhone").val(order.phone);
						$("#modalAddress").val(order.address);
						$("#oMemo").val(order.dMessage);
						if(startDate != null) {
							$("#dStartDate").val(startDate);
						}else {
							var today = new Date().toISOString().substr(0, 10);
							console.log("오늘날짜 : " + today);
							$("#dStartDate").val(today);
						}
						$("#modalDId").text(dId);
					});
				},
				error : function(data) {
					alert(data);
				}
			});
			
			$("#memoModal").css("display", "block");
			
			$(".close").click(function() {
				$("#memoModal").css("display", "none");
			});
			
			$(".modalBtnArea>input[type=reset]").click(function() {
				$("#memoModal").css("display", "none");
			});
		});
		
		//배송정보 변경 및 배송중 처리
		function changeDelivery() {
			
			var poId = $("#modalPoId").text();
			var name = $("#modalName").val();
			var phone = $("#modalPhone").val();
			var address = $("#modalAddress").val();
			var dMessage = $("#oMemo").val();
			var startDate = $("#dStartDate").val();
			
			$.ajax({
				url : "updateAdminDeliveryModal.do",
				type : "post",
				data : {poId : poId, name : name, phone : phone, address : address, dMessage : dMessage, startDate : startDate},
				success : function(data) {
					location.href='selectAdminRelease.do';
					alert(data);
				},
				error : function(data) {
					alert("에이젝스 접속실패");
				}
			});
		};
	</script>
	
</body>
</html>