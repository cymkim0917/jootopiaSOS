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
<style>
	div>h1{
		text-align:center;
		font-weight:bold;
	}
	
	#modifyBtn{
		width:100px;
		background-color: #FFBB00;
	   border: none;
	   color:#fff;
	   padding: 15px 0;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 15px;
	   margin: 4px;
	   cursor: pointer;
	   border-radius:10px;
	}
	
	#delBtn{
		width:100px;
		background-color: #7A7A7A;
		border: none;
		color:#fff;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
	}	
	
	#answerBtn{
		width:45px;
		background-color: white;
		border: 1px solid black;;
		color:black;
		padding: 7px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 10px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
	}	
	
	#btnArea{
		text-align:center;
	}
	
	table{
		text-align:center;
	}
	
	#answerTable{
		text-align:center;
	}
	
	#btnArea{
		text-align:center;
	}
	
	table{
		text-align:center;
		width:100%;
	}
	
	#tableArea{
		width:800px;
		height:500px;
	}
	
	#searchArea{
	
		width:100%;
		align:center;
		text-align:center;
	}
	#tempBtnArea{
		text-align:center;
		top:120px;
	}
	#tempBtnArea{
		width:250px;
		top:0;
		left:0;
		background:rgb(53, 15, 15); 
		 margin: 0 auto;
		height:100vh;
		z-index:9999;
		
	}

	#myTable{
		text-align:center;
		align:center;
		position:relative;
		left:80px; 
		
	}
		
		div>h1{
		text-align:center;
		font-weight:bold;
	}
	#modifyBtn{
		width:100px;
		background-color: #FFBB00;
	   border: none;
	   color:#fff;
	   padding: 15px 0;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 15px;
	   margin: 4px;
	   cursor: pointer;
	   border-radius:10px;
	   
	}	#orderBtn{
		width:200px;
		background:rgb(53, 15, 15); 
		
		color:black;
		padding: 15px 0;
		text-align: center;
		color:rgb(241, 196, 15);
		font-weight:bold;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
		
	}	
	
	#delBtn{
		width:100px;
		background-color: #7A7A7A;
		border: none;
		color:#fff;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
	}
	
	#btnArea{
		text-align:center;
	}
	
	table{
		text-align:center;
		width:100%;
	}
	
	#tableArea{
		width:800px;
		height:500px;
	}
	
	#searchArea{
	
		width:100%;
		align:center;
		text-align:center;
	}
	#tempBtnArea{
		text-align:center;
		top:120px;
	}
	#tempBtnArea{
		width:250px;
		top:0;
		left:0;
		background:rgb(53, 15, 15); 
		 margin: 0 auto;
		height:100vh;
		z-index:9999;
		
	}

	#myTable{
		text-align:center;
		align:center;
		position:relative;
		left:80px; 
		
	}
</style>
<body>
<div class="col-sm-3" id="tempBtnArea">
				<a href="<%= request.getContextPath() %>/orderList.do" id="orderBtn">주문내역</a><br />
				<a href="<%= request.getContextPath() %>/selectBoardList.do" id="orderBtn">게시글 조회</a><br />
				<a href="<%= request.getContextPath() %>/views/member/myRecentProduct.jsp" id="orderBtn">최근 본 상품 조회</a><br />
				<a href="<%= request.getContextPath() %>/views/member/insertQaAPage.jsp" id="orderBtn">1:1 문의 작성</a>
			</div>
</body>
</html>