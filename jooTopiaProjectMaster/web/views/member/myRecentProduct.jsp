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
	#recentProductListArea td{
		border:1px solid black;
	}
	
	#recentProductListArea tbody {
			text-align:center;
	}
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	
	<div class="row">
	<br /><br />
		<h1 align="center" style="font-weight:bold;">최근 본 상품</h1>
		<p align="center" style="font-size:15px;">회원님이 조회하신 상품내역입니다.</p><br />
		<div class="col-sm-2"></div>
	
		<div class="col-sm-8" class="">		
			<table id="recentProductListArea" style="text-align:center;">
				
				
				<tbody>
					
				</tbody>
			</table>		
		</div>
	
		<div class="col-sm-2"></div>
	</div>
	
	<script>
		
		$(function(){
			var recentProcList = JSON.parse(localStorage.getItem('recentProcList'));
			console.log(recentProcList);	
			//var pidList = recentProcList.pop('pid');
			var index = 0;
				
			var $table = $("#recentProductListArea > tbody");
			$table.html('');
			var $tr = $('<tr>');

			
			
			var selectRecentProcList;
			var selectPidList = new Array();
			
			for(var i=0; i< recentProcList.length;i++){
				selectPidList.push(recentProcList[i].pid);
			}
			
			selectPidList = selectPidList.slice()
			.sort(function(a,b){
				return a-b;
			})	
			.reduce(function(a,b){
				if(a.slice(-1)[0]!= b) a.push(b);
				return a;
			},[])
			
			
			
			console.log(selectPidList);
			
			for (var i = 0; i < selectPidList.length; i++) {
				for(var j=0; j<recentProcList.length; j++){
					if(selectPidList[i] == recentProcList[j].pid){
						
						if(index<5){					
				
						var $td = $('<td>');
						var $img = $('<img>');
						var $a = $('<a>');
						console.log(recentProcList[i].change_name);
						$a.attr('href',
								'<%= request.getContextPath() %>/detailProduct.do?num='+recentProcList[j].pid);
						$img.attr('src','<%= request.getContextPath() %>/images/product/'+ recentProcList[j].change_name);
		    			$img.attr('width','200px');
		    			$img.attr('height','200px');
		    			
		    			$a.append($img);
		    			$td.append($a);
		    			$tr.append($td);
						index++;
						}else{
			    			$table.append($tr);
							index=0;
							$tr = $('<tr>');
							}	
						
						break;
						}
					}					
				}
				
			
			if(index >= 1){
				$table.append($tr);
			}
			
		})
	</script>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>