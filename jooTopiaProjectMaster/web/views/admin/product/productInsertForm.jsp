<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String value = "bedRoom";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<!-- <link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js"> -->
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<title>JooTopia</title>
</head>
<body>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		
		<h3 class="title">상품등록</h3>
		<hr>
		
		<form action="" method="post">
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">기본정보</th></tr>
			<tr>
				<th>상품카테고리</th>
				<td>
					<select id="big" onchange="smallCategoty(this.value)">
						<option value="">- 대분류 -
						<option value="bedRoom">침실
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
				<th>상품 매입가</th>
				<td><%= "상품 매입가 임시" %> (원)</td>
			</tr>
			<tr>
				<th>상품등급</th>
				<td><%= "상품등급 임시" %></td>
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
				<th colspan="4">이미지 정보</th>
			</tr>
			<tr>
				<th>
				대표 이미지
				<div id="helpMainImg" class="help">i</div>
				<br>
				<button class="mainImgArea">이미지 파일 추가</button>
				</th>
				<td align="center">
				<div class="mainImgArea">
					<img src="/jootopia/images/logo2.png" width="50%">
				</div>
				</td>
				
				<th>
				상세 이미지
				<div id="helpDetailImg" class="help">i</div>
				<br>
				<button class="detailImgArea">이미지 파일 추가</button>
				</th>
				<td align="center">
				<div class="detailImgArea">
					<img src="/jootopia/images/logo2.png" width="50%">
				</div>
				</td>
			</tr>
		</table> <!-- pInfo4 -->
		</div> <!-- pInfo4Area -->
		
		<br>
		
		<div class="btnArea" align="center">
			<button type="submit" onclick="location.href='productInsertList.jsp'">등록</button>
			<button type="reset" onclick="location.href='productInsertList.jsp'">취소</button>
		</div> <!-- btnArea -->
		
		<div id="fileArea" align="center">
				<input type="file" id="mainImg" name="mainImg">
				<!-- onchange="loadImg(this, 1);" -->
				<input type="file" id="detailImg" name="detailImg">
				<!--  onchange="loadImg(this, 2);" -->
		</div> <!-- fileArea -->
		
		
		</form>
		</div> <!-- col-sm-10 -->
	
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>

<!-- The Modal -->
<div id="helpModal" class="helpModal">
	<!-- Modal content -->
    <div class="helpModalBody">
    	<span class="helpModalClose">&times;</span><br>
        <h4 id="helpModalTitle">모달 타이틀</h4>
        <hr>
        <span id="helpModalText">모달 테스트</span>
    </div>
</div>

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
			
			$(".mainImgArea").click(function() {
				$("#mainImg").click();
			})
			
			$(".detailImgArea").click(function() {
				$("#detailImg").click();
			})
		});
		
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
		
 
        $(".help").click(function() {
			
        	if($(this).attr("id") == "helpMainImg") {
        		$("#helpModalTitle").text("상품 대표 이미지");
        		$("#helpModalText").text("권장 150px * 150px");
        	}else {
        		$("#helpModalTitle").text("상품 상세 이미지");
        		$("#helpModalText").text("권장 700px * 1500px");
        	}

        	$("#helpModal").css("display","block");
        	
        	$(".helpModalClose").click(function() {
        		$("#helpModal").css("display","none");
        	});
        	
        	$(".helpModal").click(function() {
			$("#helpModal").css("display","none");
		});
		
        });

		
</script>

</body>
</html>