<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.lang.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/jquery-3.4.0.min.js"></script>
<script src="/jootopia/js/external/bootstrap.min.js"></script>
 
<title>JooTopia</title>
</head>
<body>
 
	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		
		<h3 class="title">상품등록</h3>
		<hr>
		
		<form action="<%=request.getContextPath()%>/updateAdminProduct.do" method="post" encType="multipart/form-data">
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr>
			<th colspan="2" height="40px">기본정보</th>
			<td hidden="hidden"><input type="text" name="pId" value="<%= hmap.get("pId") %>"></td>
			</tr>
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
				<input type="text" size="45" name="pName" value="<%= hmap.get("pName") %>">
				</td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><%= hmap.get("pId") %></td>
			</tr>
			<tr>
				<th>상품 매입가</th>
				<td name="pcPrice"><%= hmap.get("pcPrice") %> (원)</td>
			</tr>
			<tr>
				<th>상품등급</th>
				<td name="pGrade"><%= hmap.get("pGrade") %></td>
			</tr>
			<tr>
				<th>상품 판매가</th>
				<td>
				<input type="number" size="45" name="pPrice" value="<%= hmap.get("pPrice") %>"> (원)
				</td>
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
				<textarea name="pContent" rows="30" cols="88em" style="resize: none"><%= hmap.get("pContent") %></textarea>
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
				</th>
				<td align="center" width="300px">
				<div id="mainImgArea">
					<img id="mainImg" src="/jootopia/images/product/<%= hmap.get("changeName") %>" width="50%">
					<input type="hidden" name="fId" value="<%= hmap.get("fId") %>">
				</div>
				</td>
				
				<th>
				상세 이미지
				<div id="helpDetailImg" class="help">i</div>
				</th>
				<td align="center" width="300px">
				<div id="detailImgArea">
					<img id="detailImg" src="/jootopia/images/product/detailImg.jpg" width="50%">
				</div>
				</td>
			</tr>
		</table> <!-- pInfo4 -->
		</div> <!-- pInfo4Area -->
		
		<br>
		
		<div class="btnArea" align="center">
			<button type="submit">등록</button>
			<button type="reset">취소</button>
		</div> <!-- btnArea -->
		
		<div id="fileArea" align="center">
				<input type="file" id="img1" name="img1" onchange="loadImg(this, 1);">
				<input type="file" id="img2" name="img2" onchange="loadImg(this, 2);">
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

	$(function() {
		
		var cGroup = '<%=hmap.get("cGroup")%>';
		var cName = '<%=hmap.get("cName")%>';
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