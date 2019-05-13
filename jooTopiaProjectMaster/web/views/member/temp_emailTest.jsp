<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
</head>
<body>
	<%@ include file="/views/common/navigation.jsp"%>
	<section>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<form action="<%=request.getContextPath()%>/searchId.do" method="post">
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="userName" /></td>
						</tr>
						<tr>
							<td>이메일</td>

							<td><input type="email" name="email" /></td>
						</tr>
						<tr>

							<td><button onclick="submit">확인</button></td>
						</tr>
					</table>
				</form>
			</div>

			<div class="col-sm-3"></div>
		</div>

	</section>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>