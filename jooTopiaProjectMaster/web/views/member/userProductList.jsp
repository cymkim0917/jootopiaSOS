<%@page import="com.kh.jooTopia.board.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<HashMap<String,Object>> procList = (ArrayList<HashMap<String,Object>>)request.getAttribute("procList"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int cid =(int) request.getAttribute("cid");
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<div class="row">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-6">
			
				<% if(procList.get(0).get("cgroup") != null) {%>
			
				<h1 style="font-wieght:bold;"><%=  procList.get(0).get("cgroup")%></h1>
				<% }  %>				
			
				<br /><br />
				<br /><br />
				<table id="productArea">
					<tbody>
					
					</tbody>				
				</table>
				<div clas="pagingArea" align="center">
			<button
				onclick="location.href='<%= request.getContextPath() %>/productList.do?currentPage=1&cid=<%= cid %>'"><<</button>

			<% 
			//1페이지를 보고 있다면 ?
			if(currentPage <= 1){ %>
			<button disabled><</button>
			<% } 
			//1페이지가 아니라면 ?
			//이전 페이지로 이동하려는 로직
			//3페이지를 보고 있다면 2페이지로 이동한다는 뜻
			else {%>
			<button
				onclick="location.href='<%=request.getContextPath() %>/productList.do?currentPage=<%= currentPage-1 %>&cid=<%= cid %>'"><</button>
			<% } %>

			<% for(int p = 1; p<=maxPage; p++){ 
				if(p==currentPage){
			%>
			<button disabled><%= p %></button>

			<% }else { %>
			<button
				onclick="location.href='<%=request.getContextPath()%>/productList.do?currentPage=<%= p %>&cid=<%= cid %>'"><%= p %></button>

			<% 		
					}
				 }
			 %>

			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% }else { %>
			<button
				onclick="location.href='<%= request.getContextPath() %>/productList.do?currentPage=<%= currentPage + 1 %>&cid=<%= cid %>'">></button>
			<% } %>
			<button
				onclick="location.href='<%=request.getContextPath() %>/productList.do?currentPage=<%= maxPage %>&cid=<%= cid %>'">>></button>
		</div>
				
			</div>			
			<div class="col-sm-3"></div>
		</div>
		
		
		<script>
			$(function(){
				$table = $("#productArea > tbody");
				$table.html('');
				
				var index = 0;
				var $tr = $('<tr>');
				
				<% for (int i=0; i<procList.size();i++){ %>
						var $div = $('<div>');
						var $td = $('<td>');		    			
		    			var $img = $('<img>');
		    			var $pnamep = $('<p>').text('<%= procList.get(i).get("pname") %>');
		    			var $pprice = $('<p>').text(<%= procList.get(i).get("pprice") %>);
		    			var $pbrand = $('<p>').text('<%= procList.get(i).get("pbrand") %>');
					if(index < 3){		    		
		    			$img.attr('src','<%= request.getContextPath() %>/images/product/<%= procList.get(i).get("change_name") %>');
		    			$img.attr('width','300px');
		    			$img.attr('height','300px');
		    			
		    			$div.append($img);
		    			$div.append($pnamep);
		    			$div.append($pprice);
		    			$div.append($pbrand);
		    			$div.css('marginLeft','20px');
		    			$div.attr('onclick','location.href="<%= request.getContextPath() %>/detailProduct.do?num=<%= procList.get(i).get("pid") %>"')
		    			$td.append($div);
		    			$tr.append($td);
		    			
		    			if(index ==2){
		    				$table.append($tr);
		    				$tr = $('<tr>');
		    				index = -1;
		    				
		    			}
		    			index++;
					}
				<%} %>
				
				if(index >= 1){
					$table.append($tr);
				}
			})
		
		</script>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>