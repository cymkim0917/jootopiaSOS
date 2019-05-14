<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">

<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/bootstrap.min.js"></script>

<link rel="stylesheet" href="/jootopia/css/user/common.css">
<link rel="stylesheet" href="/jootopia/css/user/purchase.css">
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section class="pcRequestForm">
		<form method="post" action="<%= request.getContextPath() %>/insertPurchase.do" id="purchaseRequest">
			<h2 align="center" class="title">매입 신청서</h2>
			<br><br>
			<div id="tableArea">
				<table align="center">
					<tr>
						<td><label>신청자 명</label></td>
						<td><input type="text" class="form-control" name="name" value="홍길동" class=""></td>
					</tr>			
					<tr>
						<td><label>주소</label></td>
						<!--  주소 불러오는자리에 주소 불러오고 border 없애기  -->
						<td><input type="text" class="form-control" name="address" value="임시주소지롱 불러올거야" readonly></td>
					</tr>
					<tr>
						<td><label>연락처</label></td>
						<td><input type="tel" class="form-control" name="phone" placeholder="-를 뼤고 입력해주세요" value="01012345678"></td>
					</tr>
					<tr>
						<td><label>신청품목</label></td>
						<td>
							<select id="cGroup">
								<option selected>-- 대분류 --</option>	
								<option value="침실">침실</option>
								<option value="서재">서재</option>
								<option value="주방">주방</option>
								<option value="거실">거실</option>
								<option value="기타">기타</option>
							</select>
							&nbsp;&nbsp;
							<select id="cName">
								<option>-- 중분류 --</option>
							</select>
							<script>
								$("#cGroup").change(function(){
									var cGroup = $(this).children("option:selected").val();
									var $cName = $("#cName");
									$.ajax({
										url:"<%= request.getContextPath() %>/selectNameList.do",
										data:{cGroup:cGroup},
										type:"get",
										success:function(data){
											console.log("서버 전송 성공!");
											var options = ""; 
											for(var i = 0; i < data.length; i++){
												if(i == 0){
													options += "<option value=\"" + data[i] + "\" selected>" + data[i] + "</option>";
												}else{
													options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
												}
											}	
											$cName.html(options);
										},error:function(data){
											console.log("서버 전송 실패!");
										}
									});
								});
							</script>
						</td>
					</tr>
					<tr>
						<td><label>브랜드</label></td>
						<td><input type="text" class="form-control" name="brand" value="kh"></td>
					</tr>
					<tr>
						<td><label>모델명</label></td>
						<td><input type="text" class="form-control" name="model" value="라꾸라꾸"></td>
					</tr>
					<tr>
						<td><label>사용기간</label></td>
						<td>
							<input list="userDays" name="usePeriod" class="form-control" placeholder="해당사항이 없으면 년수로 입력해주세요." value="5">
							<datalist id="userDays">
						  		<option value="3개월 미만">
						  		<option value="3개월 ~ 6개월">
						  		<option value="6개월 ~ 1년">
						  		<option value="1년 ~ 3년">
							</datalist>
						</td>
					</tr>
					<tr>
						<td><label>구매 가격</label></td>
						<td><input text="number" class="form-control" name="primePrice" value="10000">원</td>
					</tr>
					<tr>
						<td><label>희망 가격</label></td>
						<td><input type="number" class="form-control" name="hopePrice" value="10000">원</td>
					</tr>
					<tr>
						<td><label>이미지 첨부</label></td>
						<td>
							<input type="file" class="form-control" name="imgFile1" style="width:200px;">
							<input type="file" class="form-control" name="imgFile2" style="width:200px;">
							<input type="file" class="form-control" name="imgFile3" style="width:200px;">
							<button>이미지 추가하기</button>
						</td>
					</tr>
					<tr>
						<td><label>상품 특이사항</label></td>
						<td>
							<textarea class="form-control" name="content" cols="20" rows="5" style="resize:none">ㅎㅎㅎ</textarea><br><br>
						</td>
					</tr>
					
					<tr>
						<td><label>매입 요청사항</label></td>
						<td>
							<textarea class="form-control" name="pcRequset" cols="20" rows="5" style="resize:none">ㅋㅋㅋ</textarea>
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
	</section>
	<script>
		function purchaseApply(){
			$("#purchaseRequest").submit();
			return false;
		}
		function purchaseCancle(){
			location.href='/jootopia/views/purchase/purchaseInfo.jsp';
			return false;
		}
	</script>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>
