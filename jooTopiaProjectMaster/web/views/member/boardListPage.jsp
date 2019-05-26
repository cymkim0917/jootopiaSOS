<%@page import="com.kh.jooTopia.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
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
	}	#orderBtn{
		width:200px;
		background-color: white;
		border: 1px solid black;
		color:black;
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
</head>

<body>
<%@ include file="/views/common/navigation.jsp" %>
<%@ include file="/views/member/temp.jsp" %>

<% ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 
	int boardIndex = 1;//
%>
	<section>
	<br />
		<div class="row">
			
			<div class="col-sm-7" id="tableArea" style="text-align:center;">
			<h1 >게시글 조회</h1><br /><br />
			
			
				<div id="searchArea">

				
				<table class="table" id="myTable" >
						<tr>
							<td colspan="2" rowspan="2"><br />
							<br /> <label for="">게시글 카테고리</label> <select name="btype"id="btype">
									<option value="1">FAQ</option>
									<option value="2">공지</option>
									<option value="3">1:1문의</option>
									<option value="4">후기</option>
									<option value="5">매입요청</option>

							</select><br />

							<label for="">검색 유형</label>
							 <select name="searchType" id="searchType">
									<option value="1">제목</option>
									<option value="2">내용</option>
									<option value="3">내용+제목</option>
							</select>						
							<label for="">검색 내용</label>
							<input type="text" name="searchText" id="searchText"/> &nbsp;
							<input type="button" value="검색" onclick="searchBoard()" />
							</td>							

						</tr>
					</table>
				</div>
				
				<div id="myTable">
				<table class="table" id="printTable">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성 일자</th>
						<th>조회수</th>
						<th>게시글 타입</th>
					</tr>
					</thead>
					<tbody>
					<% 
					if(list != null) {
					for(int i=0; i<list.size(); i++){ %>
					
					<tr>
						
						<td><label><%= boardIndex %><% boardIndex++; %></label>
						
						<input type="hidden" name="bid" value="<%= list.get(i).getbId() %>"/>
						</td>
						<% int num = list.get(i).getbType();  
							switch(num){
							case 3: %>
						<td><a href="<%= request.getContextPath() %>/selectQaA.do?num=<%=list.get(i).getbId() %>"><%= list.get(i).getbTitle() %></a></td>	
							<% break; 
							case 1: %>
								<td><a href="<%= request.getContextPath() %>/SelectOneFaqTotalList.do?num=<%=list.get(i).getbId() %>"><%= list.get(i).getbTitle() %></a></td>
							<% break; case 2: %>
							<td><a href="<%= request.getContextPath() %>/selectNoticeOne.do?num=<%=list.get(i).getbNo() %>"><%= list.get(i).getbTitle() %></a></td>
							<%  break; case 4: %>
							<td><a href="<%= request.getContextPath() %>/selectOneReview.do?num=<%=list.get(i).getbId() %>"><%= list.get(i).getbTitle() %></a></td>
							<% break; case 5: %>
							<td><a href="#"><%= list.get(i).getbTitle() %></a></td>
							
							<% break;} %>

						<td><label for=""><%= list.get(i).getbDate() %></label></td>
						<td><label for=""><%= list.get(i).getbCount() %></label><td>
							<% 
							   String bType = "";
							
								switch(num){
								case 1: bType = "FAQ"; break;
								case 2: bType = "공지"; break;
								case 3: bType = "1:1문의"; break;
								case 4: bType = "후기"; break;
								case 5: bType = "매입요청"; break;
								}
							
							%>
						<td>
						<label for=""><%= bType %></label>
						
						</td>
					<% 
						}
					} %>
					</tr>
					</tbody>
				</table>
				</div>
				<div align="center" id="btnArea">
					<ul class="pagination">
						<li><a href="">1</a> </li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">4</a></li>
						<li><a href="">5</a></li>
					</ul>
				</div>
			</div>
		<div class="col-sm-2"></div>
	</div>

	</section>
	
	<script>
		function searchBoard(){
			 var btype = $("#btype").val();
			 var searchType = $("#searchType").val();
			 var searchText  = $("#searchText").val();
/* 			 console.log(btype);
			 console.log(searchType);
			 console.log(searchText); */
			 
			 $.ajax({
				url:"<%= request.getContextPath() %>/searchBoard.do",
				type:"post",
				data:{btype:btype,searchType:searchType,searchText:searchText},
				success:function(data){
					console.log(data);
					var $printTable = $("#printTable tbody");
					$printTable.html('');
					
					if(data.length == 0){
						
					}else{
							var index = 1;
						for(var key in data){
							var bid = data[key].bId;
							var $tr = $("<tr>");
							var $td = $("<td>");
							var $noLabel = $("<td>").text(index);
							var $titleLabel = $("<td>").text(data[key].bTitle);
							
							var $dateLabel = $("<td>").text(data[key].bDate);
							var $countLabel = $("<td>").text(data[key].bCount);
							
							index++;
							var type = "";
							switch(data[key].bType){
							case 1: type = "FAQ"; break;
							case 2: type = "공지"; break;
							case 3: type = "1:1문의"; break;
							case 4: type = "후기"; break;
							case 5: type = "매입요청"; break;
							}
							var $typeLabel = $("<td>").text(type);
							
							$tr.append($noLabel);
							

						 	$tr.append($titleLabel);
							
							$tr.append($dateLabel);
						
							$tr.append($countLabel);
						
							$tr.append($typeLabel);
						
							$printTable.append($tr);
							
							$titleLabel.css("cursor","pointer");
							
							$titleLabel.click(function(){
								location.href = '<%= request.getContextPath() %>/selectQaA.do?num=' + bid;
							});
						}
					}
				},
				error:function(){
					console.log("실패");
				}
			 });	
		}
		
	</script>
<%@ include file="/views/common/footer.jsp"%>
</body>
</html>