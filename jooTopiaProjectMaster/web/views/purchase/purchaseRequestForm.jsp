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

<link rel="stylesheet" href="/jootopia/css/user/common.css">
<title>JooTopia</title>
<style>
	#tableArea{
		width: 70%;
		margin: 0 auto;
		padding : 70px;
		background : rgba(205, 38, 21, 0.18); 
	}
	table tr{
		height : 50px;
		font-size : 1.2em;
	}
	tr>td:nth-child(1){
		font-weight: bold;
		width : 200px;
		text-align : center;
	}
	tr>td:nth-child(2){
		color: green;
		width: 300px;
	}
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<form method="post">
			<h2 align="center" class="title">매입 신청서</h2>
			<br><br>
			<div id="tableArea">
				<table align="center" action="">
					<tr>
						<td><label>신청자 명</label></td>
						<td><input type="text" class="form-control" name="name" value="홍길동" class=""></td>
					</tr>			
					<tr>
						<td><label>주소</label></td>
						<!--  주소 불러오는자리에 주소 불러오고 border 없애기  -->
						<td><input type="text" class="form-control" name="address" value="불러올거야" readonly></td>
					</tr>
					<tr>
						<td><label>연락처</label></td>
						<td><input type="tel" class="form-control" name="phone" placeholder="-를 뼤고 입력해주세요"></td>
					</tr>
					<tr>
						<td><label>신청품목</label></td>
						<td>
							<select id="majorKind">
								<option>-- 대분류 --</option>	
								<option value="bedRoom">침실</option>
								<option value="library">서재</option>
								<option value="kitchen">주방</option>
								<option value="livingRoom">거실</option>
								<option value="etc">기타</option>
							</select>
							&nbsp;&nbsp;
							<select id="subKind">
								<option>-- 중분류 --</option>
								<option value="">옵션1</option>
								<option value="">옵션2</option>
								<option value="">옵션3</option>							
								<option value="">옵션3</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label>브랜드</label></td>
						<td><input type="text" class="form-control" name="brand"></td>
					</tr>
					<tr>
						<td><label>모델명</label></td>
						<td><input type="text" class="form-control" name="productName"></td>
					</tr>
					<tr>
						<td><label>사용기간</label></td>
						<td>
							<input list="userDays" class="form-control" >
						
							<datalist id="userDays">
						  		<option value="3개월 미만">
						  		<option value="3개월 ~ 6개월">
							</datalist>
						</td>
					</tr>
					<tr>
						<td><label>구매 가격</label></td>
						<td><input text="number" class="form-control" name="buyPrice">원</td>
					</tr>
					<tr>
						<td><label>희망 가격</label></td>
						<td><input type="number" class="form-control" name="hopePrice">원</td>
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
							<textarea class="form-control" name="pcExplain" cols="20" rows="5" style="resize:none"></textarea>
						</td>
					</tr>
					<br><br>
					<tr>
						<td><label>매입 요청사항</label></td>
						<td>
							<textarea class="form-control" name="pcRequset" cols="20" rows="5" style="resize:none"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="btnArea" align="center">
				<button onclick="return purchaseApply();" class="jBtn">신청하기</button>
				&nbsp;&nbsp;&nbsp;
				<button onclick="return purchaseCancle();" class="jBtn">취소하기</button>
			</div>
		</form>
	</section>
	<script>
		function purchaseApply(){
			location.href='/jootopia/views/purchase/purchaseFin.jsp';
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
