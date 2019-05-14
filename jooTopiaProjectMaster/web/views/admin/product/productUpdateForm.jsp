<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%-- import="com.kh.jooTopia.product.model.vo.*, java.util.*, java.lang.*" --%>
<%
	/* Product productList = (Product) session.getAttribute("productList");
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yy-MM-dd");
	String startDay = dateFormat.format(date);
	String endDay = dateFormat.format(date); */
	
	String value = "bedRoom";

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">

<title>JooTopia</title>

</head>
<body>
	
	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		
		<h3 class="title">상품상세 수정</h3>
		<hr>
		
		<div class="pInfo1Area">
		<table id="pInfo1">
			<tr>
				<th>상품명</th>
				<td><%= "상품명 임시" %></td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><%= "상품코드 임시" %></td>
			</tr>
			<tr>
				<th>상품상태</th>
				<td><%= "상품상태 임시" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
	
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px"><%= "[" + "상품코드 임시" + "]" %>  <%= "상품명 임시" %></th></tr>
			<tr>
				<th>상품카테고리</th>
				<td>
					<select id="big" onchange="smallCategoty(this.value)">
						<option value="">- 대분류 -
						<option value="bedRoom" selected="selected">침실
						<option value="livingRoom">거실
						<option value="kitchen">주방
						<option value="study">서재
					</select>
					<select id="small">
						<option value="">- 중분류 -
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>
				<input type="text" size="45" name="pName" placeholder="<%= "상품명 임시" %>">
				</td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><%= "상품코드 임시" %></td>
			</tr>
			<tr>
				<th>상품 판매가</th>
				<td>
				<input type="number" size="45" name="pName" placeholder="<%= "상품판매가 임시" %>"> (원)
				</td>
			</tr>
			<tr>
				<th>할인가</th>
				<td><%= "할인률 임시" %> (%)</td>
			</tr>
			<tr>
				<th>상품 수량</th>
				<td><%= "상품수량 임시" %> (개)</td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo3Area">
		<table id="pInfo3">
			<tr>
				<th colspan="2">상세정보</th>
			</tr>
			<tr>
				<th>상품 상세설명</th>
				<td>
				<textarea name="" rows="30" cols="88em" style="resize: none"><%= "상품 상세설명 임시 블라블라" %></textarea>
				</td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo4Area">
		<table id="pInfo4" border="1">
			<tr>
				<th colspan="2">이미지 정보</th>
			</tr>
			<tr>
				<th>
				대표 이미지
				<br>
				<button id="mainImgArea">이미지 파일 수정</button>
				</th>
				<td>
				<img src="/jootopia/images/logo2.png" width="60px" height="60px">
				</td>
			</tr>
			<tr>
				<th>
				상세 이미지
				<br>
				<button id="detailImgArea">이미지 파일 수정</button>
				</th>
				<td>
				<img src="/jootopia/images/logo2.png" width="60px" height="60px">
				</td>
			</tr>
		</table>
		</div>
		
		<br>
		
		<div id="fileArea" align="center">
				<input type="file" id="mainImg" name="mainImg">
				<!-- onchange="loadImg(this, 1);" -->
				<input type="file" id="detailImg" name="detailImg">
				<!--  onchange="loadImg(this, 2);" -->
		</div>
		
		<div class="btnArea" align="center">
			<button type="submit" onclick="location.href='productDetail.jsp'">수정</button>
			<button type="reset" onclick="location.href='productList.jsp'">취소</button>
		</div>
		
		</div>
		
	</section> <!-- row -->

	
	<%@ include file="/views/common/adminFooter.jsp" %>
	
	<script>

		$(document).ready(function() {
			
			<% if(value.equals("bedRoom")) { %>
			$("#big>option[value=" + '<%= value %>' + "]").attr("selected", true);
			<% } %>
		});
		
		$(document).ready(function() {
			
			var big = $("#big>option[selected='selected']").val();

			var bedRoom = ["침대", "옷장", "화장대", "수납장"];
			var livingRoom = ["테이블", "거실장", "쇼파", "수납장"];
			var kitchen = ["식탁", "식탁의자", "수납장", "렌지대"];
			var study = ["책상", "책장", "사무용의자", "수납장"];
			
			if(big == "") {
				smallCategory = [];
			}else if(big == "bedRoom") {
				smallCategory = bedRoom;
			}else if(big == "livingRoom") {
				smallCategory = livingRoom;
			}else if(big == "kitchen") {
				smallCategory = kitchen;
			}else if(big == "study") {
				smallCategory = study;
			}
			
			$("#small").empty();
			$("#small").append("<option value=''>- 중분류 -</option>");
			
			for(var i = 0; i < smallCategory.length; i++) {
				var option = $("<option>" + smallCategory[i] + "</option>");
				$("#small").append(option);
			}
		})
		
		$(function() {
			$("#fileArea").hide();
			
			$("#mainImgArea").click(function() {
				$("#mainImg").click();
			})
			
			$("#detailImgArea").click(function() {
				$("#detailImg").click();
			})
		})
		
		/* function loadImg(value, num) {
			if(value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch(num) {
					case 1 :
						$("#mainImg").attr("src", e.target.result);
						break;
					case 2 :
						$("#detailImg").attr("src", e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		} */
	</script>
</body>
</html>