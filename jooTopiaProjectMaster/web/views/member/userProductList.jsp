<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<HashMap<String,Object>> procList = (ArrayList<HashMap<String,Object>>)request.getAttribute("procList"); %>    
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