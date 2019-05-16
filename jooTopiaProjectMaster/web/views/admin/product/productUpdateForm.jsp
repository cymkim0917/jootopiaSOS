<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="com.kh.jooTopia.product.model.vo.*, com.kh.jooTopia.board.model.vo.* ,java.util.*, java.lang.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
	HashMap<String, Object> p = (HashMap<String, Object>) hmap.get("p");
	ArrayList<Attachment> imgList = (ArrayList<Attachment>) hmap.get("img");
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
		
		<form action="<%=request.getContextPath()%>/updateDetailAdminProduct.do" method="post" encType="multipart/form-data">
		
		<div class="pInfo1Area">
		<table id="pInfo1">
			<tr>
				<th>상품명</th>
				<td><%= p.get("pName") %></td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><%= p.get("pId") %></td>
			</tr>
			<tr>
				<th>상품상태</th>
				<td><%= p.get("status") %></td>
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
					<select id="cGroup" name="cGroup">
						<option selected>-- 대분류 --</option>	
						<option value="침실">침실</option>
						<option value="서재">서재</option>
						<option value="주방">주방</option>
						<option value="거실">거실</option>
						<option value="기타">기타</option>
					</select>
					<select id="cName" name="cName">
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
				<th>상품명</th>
				<td>
				<input type="text" size="45" name="pName" value="<%= p.get("pName") %>">
				</td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><%= p.get("pId") %></td>
			</tr>
			<tr>
				<th>상품 판매가</th>
				<td>
				<input type="number" size="45" name="pName" value="<%= p.get("pPrice") %>"> (원)
				</td>
			</tr>
			<tr>
				<th>할인가</th>
				<td><%= p.get("salePrice") %> (원) / <%= p.get("sale") %> (%)</td>
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
				<textarea name="" rows="30" cols="88em" style="resize: none"><%= p.get("pContent") %></textarea>
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
				</th>
				<td align="center" width="300px">
				<div id="mainImgArea">
					<img id="mainImg" name="mainImg" src="/jootopia/images/product/<%= imgList.get(0).getChangeName() %>" width="50%">
					<input type="hidden" name="mainFId" value="<%= imgList.get(0).getfId() %>">
				</div>
				</td>
			</tr>
			<tr>
				<th>
				상세 이미지
				</th>
				<td align="center" width="300px">
				<div id="detailImgArea">
					<img id="detailImg" name="detailImg" src="/jootopia/images/product/<%= imgList.get(1).getChangeName() %>" width="50%">
					<input type="hidden" name="detailFId" value="<%= imgList.get(1).getfId() %>">
				</div>
				</td>
			</tr>
		</table>
		</div>
		
		<br>
		
		<div id="fileArea" align="center">
			<input type="file" id="img1" name="img1" onchange="loadImg(this, 1);">
			<input type="file" id="img2" name="img2" onchange="loadImg(this, 2);">
		</div> <!-- fileArea -->
		
		<div class="btnArea" align="center">
			<button type="submit">수정</button>
			<button type="reset" onclick="location.href='/jootopia/adminProductOne.do?num=<%= p.get("pId") %>'">취소</button>
		</div>
		</form>
		</div> <!-- col-sm-10 -->
		
	</section> <!-- row -->

	
	<%@ include file="/views/common/adminFooter.jsp" %>
	
	<script>
	
	$(function() {
		var cGroup = '<%= p.get("cGroup") %>';
		var cName = '<%= p.get("cName") %>';
		var cNameArr = [];
		
		var bedRoom = ["침대", "옷장", "화장대", "침실수납장", "기타"];
		var study = ["책상", "책장", "사무용의자", "서재수납장", "기타"];
		var kitchen = ["식탁", "식탁의자", "주방수납장", "렌지대", "기타"];
		var livingRoom = ["테이블", "거실장", "쇼파", "거실수납장", "기타"];
		var etc = ["기타"];
		
		if(cGroup == "") {
			cNameArr = [];
		}else if(cGroup == "침실") {
			$("#cGroup option[value='침실']").attr("selected", true);
			cNameArr = bedRoom;
		}else if(cGroup == "서재") {
			$("#cGroup option[value='서재']").attr("selected", true);
			cNameArr = study;
		}else if(cGroup == "주방") {
			$("#cGroup option[value='주방']").attr("selected", true);
			cNameArr = kitchen;
		}else if(cGroup == "거실") {
			$("#cGroup option[value='거실']").attr("selected", true);
			cNameArr = livingRoom;
		}else if(cGroup == "기타") {
			$("#cGroup option[value='기타']").attr("selected", true);
			cNameArr = etc;
		};
		
		$("#cName").empty();
		
		var option = "";
		
		for(var i = 0; i < cNameArr.length; i++) {
			
			option = $("<option value='" + cNameArr[i] + "'>" + cNameArr[i] + "</option>");
			$("#cName").append(option);
			
			var cNameOp = $("#cName option").eq(i);
			if( cName == cNameOp.val() ) {
				cNameOp.attr("selected", true);
			};
		};
		
	});
		
		$(function() {
			$("#fileArea").hide();
			
			$("#mainImgArea").click(function() {
				$("#img1").click();
			})
			
			$("#detailImgArea").click(function() {
				$("#img2").click();
			})
		});
		
		function loadImg(value, num) {
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
		};
	</script>
</body>
</html>