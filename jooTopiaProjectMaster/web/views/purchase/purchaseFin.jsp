<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">
<title>JooTopia</title>
<style>
table *, table th {
	text-align: center;
}
table th {
	font-weight: bold;
	background: lightgray;
}
table th:nth-child(1), table td:nth-child(1) {
	width: 180px;
	height: 40px;
}

table th:nth-child(2), table td:nth-child(2) {
	width: 450px;
}

table {
	border: none;
	margin: 0 auto;
	margin-top: 50px;
	border-collapse: collpase;
}

table>tr {
	border-bottom: 2px solid gray;
	border-top: 2px solid gray;
}
</style>
</head>
<body>
	<%@ include file="/views/common/navigation.jsp"%>
	<section>
		<h3 align="center" style="font-weight:bold;">매입신청이 완료되셨습니다.</h3>
		<div>
			<table border="1">
				<tr>
					<th>항목</th>
					<th>상세정보</th>
				<tr>
				<tr>
					<td>신청일자</td>
					<td></td>
				<tr>
				<tr>
					<td>주소</td>
					<td></td>
				<tr>
				<tr>
					<td>연락처</td>
					<td></td>
				<tr>
				<tr>
					<td>신청 카테고리</td>
					<td></td>
				<tr>
				<tr>
					<td>브랜드</td>
					<td></td>
				<tr>
				<tr>
					<td>모델명</td>
					<td></td>
				<tr>
				<tr>
					<td>사용기간</td>
					<td></td>
				<tr>
				<tr>
					<td>제품정가</td>
					<td></td>
				<tr>
				<tr>
					<td>판매희망가격</td>
					<td></td>
				<tr>
				<tr>
					<td>상품특이사항</td>
					<td></td>
				<tr>
				<tr>
					<td>매입 요청 사항</td>
					<td></td>
				<tr>
			</table>
		</div>
		<div class="btnArea" align="center">
			<button onclick="location.href='#'"class="jBtn">마이페이지에서 확인하기</button>
		</div>

	</section>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>