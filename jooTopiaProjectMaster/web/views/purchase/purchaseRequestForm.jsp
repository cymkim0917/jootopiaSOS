<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String post = (String) request.getAttribute("post");
	String address = (String) request.getAttribute("address");
	int dPrice = (int) request.getAttribute("dPrice");
	double distance = (double) request.getAttribute("distance");
%>
<!DOCTYPE html>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">

<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">

<link rel="stylesheet" href="/jootopia/css/user/common.css">
<link rel="stylesheet" href="/jootopia/css/user/purchase.css">
<title>JooTopia</title>
<style>
input[name*=Price]{
	width: 70%;
	display: inline-block;
	text-align:right;
}
select{
	padding: 5px 10px;
}
input[type=file]{
	width: 70%; 
	display: inline-block;
}
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section class="pcRequestForm">
		<form method="post" action="<%= request.getContextPath() %>/insertPurchase.do" id="purchaseRequest" encType="multipart/form-data">
			<h2 align="center" class="title">매입 신청서</h2>
			<br><br>
			<div id="tableArea">
				<table>
					<tr>
						<td><label>신청자 명</label></td>
						<td><input type="text" class="form-control" name="name" value="<%= loginUser.getUserName() %>" class=""></td>
					</tr>			
					<tr>
						<td><label>주소</label></td>
						<td>
							<input type="text" class="form-control" name="address" placeholder="주소를 입력해주세요." value="<%= address %>" readonly>
							<input type="hidden" name="appDistance" value="<%= distance %>">
							<input type="hidden" name="post" value="<%= post %>">
							<input type="hidden" name="dPrice" value="<%= dPrice %>">
						</td>
					</tr>
					<tr>
						<td><label>연락처</label></td>
						<td><input type="tel" class="form-control" name="phone" value="<%= loginUser.getPhone()%>"></td>
					</tr>
					<tr>
						<td><label>신청품목</label></td>
						<td>
							<select id="cGroup" name="cGroup">
								<option selected>-- 대분류 --</option>	
								<option value="침실">침실</option>
								<option value="서재">서재</option>
								<option value="주방">주방</option>
								<option value="거실">거실</option>
								<option value="기타">기타</option>
							</select>
							&nbsp;&nbsp;
							<select id="cName" name="cName">
								<option>-- 중분류 --</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label>브랜드</label></td>
						<td><input type="text" class="form-control" name="brand" placeholder="Brand" value="kh정보가구"></td>
					</tr>
					<tr>
						<td><label>모델명</label></td>
						<td><input type="text" class="form-control" name="model" placeholder="modelName" value="지노"></td>
					</tr>
					<tr>
						<td><label>사용기간</label></td>
						<td>
							<select name="usePeriod">
								<option>---- 선택 ----</option>
								<option value="3개월 이하">3개월 이하 </option>
								<option value="6개월 이하">3개월 ~ 6개월</option>
								<option value="1년 이하">6개월 ~ 1년 </option>
								<option value="3년 이하">1년 ~ 3년</option>
								<option value="3년 초과">3년 ~ </option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label>구매 가격</label></td>
						<td>
							<input type="number" class="form-control" name="primePrice" placeholder="10000" step="10000" min="10000">&nbsp;원
						</td>
					</tr>
					<tr>
						<td><label>희망 가격</label></td>
						<td>
							<input type="number" class="form-control" name="hopePrice" placeholder="0" step="10000" min="0">&nbsp;원
						</td>
					</tr>
					<tr>
						<td><label>이미지 첨부</label></td>
						<td>
							<input type="file" class="form-control" name="imgFile1">
							<input type="file" class="form-control" name="imgFile2">
							<input type="file" class="form-control" name="imgFile3">
							<button id="addImg">이미지 추가</button> &nbsp;&nbsp;
							<button id="removeImg">이미지 삭제</button>
							<br><br>
						</td>
					</tr>
					
					<tr>
						<td><label>상품 특이사항</label></td>
						<td>
							<textarea class="form-control" name="content" id="content" cols="20" rows="5" style="resize:none">상품 특이사항을 입력해주세요</textarea><br><br>
						</td>
					</tr>
					
					<tr>
						<td><label>매입 요청사항</label></td>
						<td>
							<textarea class="form-control" name="pcRequset" id="pcRequset" cols="20" rows="5" style="resize:none">매입요청사항을 입력해주세요.</textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="btnArea" align="center">
				<button onclick="purchaseApply();" class="jBtn">신청하기</button>
				&nbsp;&nbsp;&nbsp;
				<button onclick="return purchaseCancle();" class="jBtn">취소하기</button>
			</div>
		</form>
		<script>
			$("#addImg").click(function(){
				var count = $(this).siblings("input");
				
				if(count.length < 6){
					$(this).before("<input type=\"file\" class=\"form-control\" name=\"imgFile" + (count.length + 1) + "\" style=\"width:230px;\">");
				}else{
					alert("사진은 최대 6장까지 올릴 수 있습니다.");
				}
				return false;
			})
			$("#removeImg").click(function(){
				var count = $(this).siblings("input");
				console
				
				if(count.length > 3){
					$(this).siblings("input").eq(count.length - 1).remove();
				}else{
					alert("사진은 최소 3장 게시하여야 합니다.");
				}
				return false;
			});
		</script>
	</section>
	<script>
		$("#cGroup").change(function(){
			var cGroup = $(this).children("option:selected").val(); // 대분류
			var $cName = $("#cName");  // 소분류
			$.ajax({
				url:"<%= request.getContextPath() %>/selectNameList.do",
				data:{cGroup:cGroup},
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
					var options = "<option selected>-- 중분류 --</option>"; 
					for(var i = 0; i < data.length; i++){
						
						if(i == 0){
							options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
						} else{
							options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
						}
					}	 
					$cName.html(options);
				},error:function(data){
					console.log("서버 전송 실패!");
				}
			});
		});
		function purchaseApply(){
			$("#purchaseRequest").submit();
			return false;
		}
		function purchaseCancle(){
			location.href='/jootopia/views/purchase/purchaseInfo.jsp';
			return false;
		}
		$("#content").click(function(){
			$(this).reset();
		})
		$("#pcRequset").click(function(){
			$(this).reset();
		})
	</script>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>


<!-- 
추가로 해야할 것!!
카테고리 미 선택시 신청서 제출되지 않게 하는것 
사진 갯수가 3개미만일 경우 제출 되지 않게 하는것 
그외에 정규표현식
 -->
