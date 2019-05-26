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
						<td>3km이내</td>
						<td>무료</td>
					</tr>
					<tr>
						<td>5km이내</td>
						<td>10,000원</td>
					</tr>
					<tr>
						<td>7km이내</td>
						<td>30,000원</td>
					</tr>
					<tr>
						<td>10km이내</td>
						<td>50,000원</td>
					</tr>
					<tr>
						<td>10km이상</td>
						<td>고객센터 문의</td>
					</tr>
				</table>		
				<!-- <button onclick="getInfo();">지도 정보 불러오기</button>				 -->
			</div>
		</div>
		<br clear="both"> 
		<div class="row">	
			<div class="col-sm-5">
				<div class="searchArea">
					<h2>주소 검색</h2>
					<div id="addressArea" align="center">
						<input type="text" id="postNum" name="postNum" value="우편번호를 검색해주세요" class="form-control" readonly onclick="postSearch()">
						<button onclick="postSearch()">검색</button><br><br><br>
						<input type="text" id="address1" name="address1" size="35" placeholder="우편번호를 겁색하면 자동입력됩니다." class="form-control" readonly onclick="postSearch()"><br>
						<input type="text" id="address2" name="address2" size="35" placeholder="상세주소를 입력해주세요" class="form-control"><br>
					</div>
					<div class="mapSearchResult">
					<Br><br>
						<h4><span><%= loginUser.getUserName() %></span> 고객님의 위치에서 주토피아까지 <br> 거리는 <span id="distance">0</span>km입니다.<br>
							<br> 매입기사 배송금액은 <span id="delivaryPrice">-</span>원 입니다.
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
			
			// 확대 축소 컨트롤 생성
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			map.setMaxLevel(9);
			
			var markerPosition  = new daum.maps.LatLng(37.49901218802032, 127.03297649871936); 
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});
			marker.setMap(map);
			
			// 도착지점에 사용할 마커 
			var imageSrc = '<%= request.getContextPath() %>/images/arriveMarker.png',    
			    imageSize = new daum.maps.Size(50, 50), // 마커이미지 크기
			    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션, 마커의 좌표와 일치시킬 이미지 안에서의 좌표 설정
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
			var userMarker = new daum.maps.Marker({
				map: map,
			    position: markerPosition, 
			    image: markerImage // 마커이미지 설정 
			});
			userMarker.setMap(null);
			
			function moveLocation(){
				userMarker.setMap(null);
				var locationX, locationY;
				var geocoder = new daum.maps.services.Geocoder();
				geocoder.addressSearch($("#address1").val(), function(result, status) {
				     if (status === daum.maps.services.Status.OK) {
				    	 console.log("status OK");
				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				        
				        userMarker.setPosition(coords);
				        userMarker.setMap(map);
				        
						console.log(coords);
						locationX = coords[Object.keys(coords)[1]];  // jb
						locationY = coords[Object.keys(coords)[0]];  // ib
				        var calcX = (jootopiaX + locationX)/2;
				        var calcY = (jootopiaY + locationY) / 2;
						var newCenter = new daum.maps.LatLng(calcX, calcY);
				        map.setCenter(new daum.maps.LatLng(calcX, calcY));
				        
				     	// 거리 계산하기 
				        var distance = calcDistance(locationX, locationY, jootopiaX, jootopiaY);
				        distance = Math.round(distance * 10)/10;
				        var delivaryPrice;
				        
				        if(distance < 3){
				        	map.setLevel(6);	
				        	delivaryPrice = 0;
				        }else if(distance <= 5){
				        	map.setLevel(7);
				        	delivaryPrice = 10000;
				        }else if(distance <= 7){
				        	map.setLevel(7);
				        	delivaryPrice = 30000;
				        }else if(distance <= 10){
				        	map.setLevel(7);
				        	delivaryPrice = 50000;
				        }else if(distance <= 15){
				        	map.setLevel(9);
				        	delivaryPrice = 10000000;
				        }else{
				        	map.setLevel(12);
				        	delivaryPrice = 10000000;
				        }
						$("#distance").html(distance);
						$("#delivaryPrice").html(delivaryPrice);
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
			      var a = (Math.sin(dLat / 2) * Math.sin(dLat/2)) + Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * Math.sin(dLon/2) * Math.sin(dLon/2); 
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
			<button onclick="locationForm();" class="jBtn">신청하기</button>
			<button onclick="location.href='/jootopia'" class="jBtn">취소하기</button>
		</div>
	</section>
	<script>
		function locationForm(){
			var post = $("#postNum").val();
			var address = $("#address1").val() + " " + $("#address2").val();
			var distance = $("#distance").html();
			var delivaryPrice = $("#delivaryPrice").html();
			console.log("post : " + post);
			console.log("address : " + address);
			console.log("distance : " + distance);
			console.log("delivaryPrice : " + delivaryPrice);
			
			location.href='<%= request.getContextPath() %>/requestForm.do?post=' + post + '&address=' + address + '&distance=' + distance + '&dPrice=' + delivaryPrice;
		}
	</script>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>


