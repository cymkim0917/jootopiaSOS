<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<link rel="stylesheet" href="/jootopia/css/user/common.css">
<title>JooTopia</title>
<style>
.container2{
	position : relative;
	top: -20px;
	width: 85%;	
	margin : 0 auto;
}
.carousel-indicators.active{
    background-color: blue;
} 
.photogroup1{
	margin-left:10%;
	margin-right:10%;
	
}
</style>
</head>
<body>
	<%@ include file="/views/common/navigation.jsp" %>
	<div class="conatiner container2">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<a href=""><img src="/jootopia/images/event11.jpg" alt="event"
						style="width: 100%; margin: 0 auto;"></a>
				</div>
				<div class="item">
					<a href=""><img src="/jootopia/images/event22.jpg" alt="event"
						style="width: 100%; margin: 0 auto;"></a>
				</div>

				<div class="item">
					<a href=""><img src="/jootopia/images/notice1.jpg" alt="notice"
						style="width: 100%; margin: 0 auto;"></a>
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<section>
	<hr>
	  <h2 align="center">NEW PRODUCT</h2>
	  <div id="myCarousel1" class="carousel slide" data-ride="carousel">
	  
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner">
	      <div class="item active">
	        <a href=""><img src="/jootopia/images/bed1.jpg" alt="bed" style="width:50%; margin:0 auto;"></a>
	      </div>
	
	      <div class="item">
	        <a href=""><img src="/jootopia/images/chair1.jpg" alt="chair" style="width:50%; margin:0 auto;"></a>
	      </div>
	    
	      <div class="item">
	        <a href=""><img src="/jootopia/images/desk1.jpg" alt="desk" style="width:50%; margin:0 auto;"></a>
	      </div>
	      
	      <div class="item">
	        <a href=""><img src="/jootopia/images/desk2.jpg" alt="desk" style="width:50%; margin:0 auto;"></a>
	      </div>
	      
	      <div class="item">
	        <a href=""><img src="/jootopia/images/shelf1.jpg" alt="shelf" style="width:50%; margin:0 auto;"></a>
	      </div>
	      
	      <div class="item">
	        <a href=""><img src="/jootopia/images/shelf1.jpg" alt="sofa" style="width:50%; margin:0 auto;"></a>
	      </div>
	      
	      <div class="item">
	        <a href=""><img src="/jootopia/images/light1.jpg" alt="light" style="width:50%; margin:0 auto;"></a>
	      </div>
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel1" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
	    
	    <!-- Indicators -->
	 <ol class="carousel-indicators">
	      <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel1" data-slide-to="1"></li>
	      <li data-target="#myCarousel1" data-slide-to="2"></li>
	      <li data-target="#myCarousel1" data-slide-to="3"></li>
	      <li data-target="#myCarousel1" data-slide-to="4"></li>
	      <li data-target="#myCarousel1" data-slide-to="5"></li>
	      <li data-target="#myCarousel1" data-slide-to="6"></li>
	      <li data-target="#myCarousel1" data-slide-to="7"></li>
	    </ol> 
	 </div>
		<br>
		<div class = "totalList">
			<div class = "photogroup">
				<table class="photogtoup1" align="center">
					<tr>
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/bed1.jpg"  width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td> 
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/chair1.jpg" width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td>
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/desk1.jpg" width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td>
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/desk2.jpg" width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td> 
					</tr>
					<tr>
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/bed1.jpg"  width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td> 
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/chair1.jpg" width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td>
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/desk1.jpg" width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td>
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/desk2.jpg" width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td> 
					</tr>
					<tr>
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/bed1.jpg"  width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td> 
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/chair1.jpg" width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td>
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/desk1.jpg" width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td>
						<td align="center">
							<a href="/jootopia/views/notice/productListPlus.jsp"><img src="/jootopia/images/desk2.jpg" width="300px" height="300px"></a>
							<p>삼성 15인치 세탁기</p>
							<p>125,000원</p>
						</td> 
					</tr>
				</table>
			</div>
		</div>
	</section>
	
	<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>