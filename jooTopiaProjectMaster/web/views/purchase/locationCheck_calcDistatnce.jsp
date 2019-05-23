<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c2488cad71f1f6c00791ef5c930b3e9&libraries=services"></script>
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<script src="/jootopia/js/external/bootstrap.min.js"></script>

<link rel="stylesheet" href="/jootopia/css/user/common.css">
<link rel="stylesheet" href="/jootopia/css/user/purchase.css">

<title>JooTopia</title>
<style>
	.mapArea{
		padding-left: 50px;
		padding-top : 40px;
	}
	#infoMap{
		width : 500px;
		height : 320px;
	}
	.locationExplain{
		padding-left : 50px;
	}
	#map{
		width:100%; 
		height:100%;
	}
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<h2 class="title">용달 금액 산정</h2>
		<br>
		<div class="locationArea" >
		<div class="mapArea">
			<div id="infoMap"></div>
		</div>
			<script>
				// 위도 : 37.49901218802032
				// 경도 : 127.03297649871936 
				var container = document.getElementById('infoMap'),
			    options = {
			         center: new daum.maps.LatLng(37.49901218802032, 127.03297649871936),
			         level: 3
			    };
				var infoMap = new daum.maps.Map(container, options);
				infoMap.setDraggable(false); // 지도 이동 금지    
				infoMap.setLevel(3)
				infoMap.setMaxLevel(3);
				infoMap.setMinLevel(3);
				
				var markerPosition  = new daum.maps.LatLng(37.49901218802032, 127.03297649871936); 
				var marker = new daum.maps.Marker({
				    position: markerPosition
				});
				marker.setMap(infoMap);				
				
				function getInfo() {
				    var center = infoMap.getCenter(); 
				    // 지도의 현재 영역을 얻어옵니다 
				    var bounds = infoMap.getBounds();
				    
				    var message = '지도 중심좌표는 위도는 ' + center.getLat() + ', 경도는 ' + center.getLng() + ' 이다 ';
				    console.log(message);
				}
			</script>
			<div class="locationExplain" >
			<br>
				<h3>주토피아 위치 안내</h3>
				<p>주소 : 서울특별시 강남구 역삼동 KH리사이클링</p>
				<br>
				<br>
				<h4>요금안내</h4>	
				<table align="center" border="1">
					<tr>
						<th>거리</th>
						<td>요금</td>						
					</tr>
					<tr>
						<td>5km이내</td>
						<td>무료</td>
					</tr>
					<tr>
						<td>7km이내</td>
						<td>10,000원</td>
					</tr>
					<tr>
						<td>10km이내</td>
						<td>30,000원</td>
					</tr>
					<tr>
						<td>15km이내</td>
						<td>50,000원</td>
					</tr>
					<tr>
						<td>15km 초과</td>
						<td>고객센터 문의</td>
					</tr>
				</table>		
				<button onclick="getInfo();">지도 정보 불러오기</button>				
			</div>
		</div>
		<br clear="both"> 
		<div class="row">
			<div class="col-sm-5">
				<div class="searchArea">
					<h2>주소 검색</h2>
					<div id="addressArea" align="center">
						<input type="text" id="postNum" name="postNum" value="우편번호를 검색해주세요" class="form-control" readonly>
						<button onclick="postSearch()">검색</button><br><br><br>
						<input type="text" id="address1" name="address1" size="35" placeholder="기본주소" class="form-control" readonly><br>
						<input type="text" id="address2" name="address2" size="35" placeholder="상세주소를 입력하세요" class="form-control"><br>
					</div>
					<div class="mapSearchResult">
					<Br><br>
						<h4><%-- loginUser.getNickName() --%><span>김채연</span> 고객님의 위치에서 주토피아까지 <br> 거리는 14.2km입니다.<br>
							<br> 매입기사 배송금액은 <%  %>10,000원 입니다.
						</h4>
					</div>
				</div>
			</div> 
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
				
			</script>
			<div class="col-sm-7" >
				<div id="map"></div>
			</div>
		</div>
		<script>
			var jootopiaX = 37.49901218802032;
			var jootopiaY = 127.03297649871936;
			var container = document.getElementById('map'),
		    options = {
		         center: new daum.maps.LatLng(jootopiaX, jootopiaY),
		         level: 3
		    };
			map = new daum.maps.Map(container, options);
			// map.setDraggable(false); // 지도 이동 금지    
			// 도로 지도 추가 
			// map.addOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);   
			
			// 확대 축소 컨트롤 생성
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			map.setMaxLevel(9);
			
			var markerPosition  = new daum.maps.LatLng(37.49901218802032, 127.03297649871936); 
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});
			marker.setMap(map);
			
			function moveLocation(){
				var locationX, locationY;
				var geocoder = new daum.maps.services.Geocoder();
				geocoder.addressSearch($("#address1").val(), function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
				    	 console.log("status OK");
				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        
				        var imageSrc = '<%= request.getContextPath() %>/images/arriveMarker.png', // 마커이미지의 주소입니다    
						    imageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
						    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
						      
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
						
						// 마커를 생성합니다
						var userMarker = new daum.maps.Marker({
							map: map,
						    position: markerPosition, 
						    image: markerImage, // 마커이미지 설정 
						    position: coords
						});
				        
						console.log(coords);
						locationX = coords[Object.keys(coords)[1]];  // jb
						locationY = coords[Object.keys(coords)[0]];  // ib
						// console.log("locationX : " + locationX);
						// console.log("locationY : " + locationY);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        var calcX = (jootopiaX + locationX)/2;
				        var calcY = (jootopiaY + locationY) / 2;
						// console.log("clacX : " + calcX);
						// console.log("clacY : " + calcY);
						var newCenter = new daum.maps.LatLng(calcX, calcY);
				        map.setCenter(new daum.maps.LatLng(calcX, calcY));
				        map.setLevel(7);
				        
				        // 거리 계산하기 
				        var powX = Math.pow((jootopiaX - locationX) * 88907.949, 2);
				        var powY = Math.pow((jootopiaY - locationY) * 110979.309, 2);
				        console.log("powX : " + powX);
				        console.log("powY : " + powY);
				        
				        var distance = calcDistance(locationX, locationY, jootopiaX, jootopiaY);
				        // 거리 계산하기 
				        // var distance = Math.sqrt(powX + powY);
				        console.log("distance : " + distance);
				    } 
				});    
			}
			// 우편번호 조회 
			function postSearch(){
			    new daum.Postcode({
			        oncomplete: function(data) {
			            $("#postNum").val(data.postcode);
			            $("#address1").val(data.address);
			            moveLocation();
			        }
			    }).open();
			}
			// 위도, 경도로 거리 계산하기
			 function calcDistance(lat1, lon1, lat2, lon2) {
			      var R = 6371; // 1km를 의미 
			      var dLat = (lat2-lat1).toRad();
			      var dLon = (lon2-lon1).toRad(); 
			      var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
			              Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * 
			              Math.sin(dLon/2) * Math.sin(dLon/2); 
			      var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
			      var d = R * c;
			      return d;
			  }
			  Number.prototype.toRad = function() {
			     return this * Math.PI / 180;
			  }
			  // 식의 출처 : http://hochulshin.com/distance-between-two-coordinates/ 
		</script>
		<div class="btnArea" align="center">
			<button onclick="location.href='/jootopia/views/purchase/purchaseRequestForm.jsp'" class="jBtn">신청하기</button>
			<button onclick="location.href='/jootopia'" class="jBtn">취소하기</button>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>


