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
				// 도로 지도 추가 
				// map.addOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);   
				
				// 확대 축소 컨트롤 생성
				var zoomControl = new daum.maps.ZoomControl();
				infoMap.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
				infoMap.setMaxLevel(5);
				
				var markerPosition  = new daum.maps.LatLng(37.49901218802032, 127.03297649871936); 
				var marker = new daum.maps.Marker({
				    position: markerPosition
				});
				marker.setMap(infoMap);
				
				var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:100px; text-align:center; padding:6px 0;">주토피아</div>'
		        });
		        infowindow.open(infoMap, marker);
				
				
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
						<td>10km이내</td>
						<td>무료</td>
					</tr>
					<tr>
						<td>15km이내</td>
						<td>10,000원</td>
					</tr>
					<tr>
						<td>20km이내</td>
						<td>20,000원</td>
					</tr>
					<tr>
						<td>30km이내</td>
						<td>30,000원</td>
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
			var container = document.getElementById('map'),
		    options = {
		         center: new daum.maps.LatLng(37.49901218802032, 127.03297649871936),
		         level: 3
		    };
			map = new daum.maps.Map(container, options);
			// map.setDraggable(false); // 지도 이동 금지    
			// 도로 지도 추가 
			// map.addOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);   
			
			// 확대 축소 컨트롤 생성
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			map.setMaxLevel(5);
			
			var markerPosition  = new daum.maps.LatLng(37.49901218802032, 127.03297649871936); 
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});
			marker.setMap(map);
			
			var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:100px; text-align:center; padding:6px 0;">주토피아</div>'
	        });
	        infowindow.open(map, marker);
			
			
			function getInfo() {
			    var center = map.getCenter(); 
			    // 지도의 현재 영역을 얻어옵니다 
			    var bounds = map.getBounds();
			    
			    var message = '지도 중심좌표는 위도는 ' + center.getLat() + ', 경도는 ' + center.getLng() + ' 이다 ';
			    console.log(message);
			}
			function moveLocation(){
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch($("#address1"), function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });

				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new daum.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">검색한 곳</div>'
				        });
				        infowindow.open(map, marker);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
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
		</script>
		<div class="btnArea" align="center">
			<button onclick="location.href='/jootopia/views/purchase/purchaseRequestForm.jsp'" class="jBtn">신청하기</button>
			<button onclick="location.href='/jootopia'" class="jBtn">취소하기</button>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>


