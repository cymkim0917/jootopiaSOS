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

<style>
	#orderProductArea{
		left:860px;
		position:relative;
	}
</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<div class="row">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-6">
				<br />
				<% if(procList.get(0).get("cgroup") != null) {%>
			
				<h1 style="font-wieght:bold;"><%=  procList.get(0).get("cgroup")%></h1>
				<% }  %>				
				
				<br /><br />
				<div id="orderProductArea">
				<select name="orderProduct" id="orderProduct">
					<option value="4">정렬방식</option>
					<option value="1">이름순 정렬</option>
					<option value="2">가격순 정렬</option>
					<option value="3">인기순 정렬</option>
				</select>
				</div>
				<br /><br />
				<table id="productArea">
					<tbody>
					
					</tbody>				
				</table>
				<div class="pagingArea" align="center" id ="pagingArea">
				
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
			<button onclick="location.href='<%=request.getContextPath()%>/productList.do?currentPage=<%= p %>&cid=<%= cid %>'"><%= p %></button>

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


   $("#orderProduct").on("change", function(){
      var orderType = $("#orderProduct").val();
	   console.log('바뀜!' + orderType)
      var cid = <%= cid %>
      var currentPage = <%= currentPage %>
      $.ajax({
         url:"<%= request.getContextPath() %>/orderByProduct.do",
         type:"post",
         data:{orderType:orderType,cid:cid,currentPage:currentPage},
         success:function(data){
            console.log('성공!');
            //pagingArea

			
            //procList
            var procList = data["procList"];
            var pi = data["pi"];

            $table = $("#productArea > tbody");
            $table.html('');

            var index = 0;
            var $tr = $('<tr>');

            $.each(procList,function(index2,value){
               var pid = value.pid;
               var $div = $('<div>');
               var $td = $('<td>');                   
               var $img = $('<img>');
               var $pnamep = $('<p>').text(value.pname);//pname
               var $pprice = $('<p>').text(value.pprice);//pprice
               var $pbrand = $('<p>').text(value.pbrand);//pbrand
               console.log(value);
               if(index < 3){                
                  $img.attr('src','<%= request.getContextPath() %>/images/product/'+value.change_name);//change_name
                  $img.attr('width','300px');
                  $img.attr('height','300px');

                  $div.append($img);
                  $div.append($pnamep);
                  $div.append($pprice);
                  $div.append($pbrand);
                  $div.css('marginLeft','20px');
                  $div.attr('onclick','location.href="<%= request.getContextPath() %>/detailProduct.do?num='+value.pid+'"');
                  $td.append($div);
                  $tr.append($td);

                  if(index ==2){
                     $table.append($tr);
                     $tr = $('<tr>');
                     index = -1;

                  }
                  index++;
               }//if끝
            });//each끝

            if(index >= 1){
               $table.append($tr);
            }

            $pagingArea = $("#pagingArea");
            $pagingArea.html('');
			var $firstButton = $('<button onclick="sortProduct(1);"> << </button>');

      		 $pagingArea.append($firstButton);
            for (var i = 0; i < pi.maxPage; i++) {
               $pagingArea.append('<button onclick="sortProduct('+ (i+1) +')">'+ (i+1) +'</button>');
            }
            $endButton = $('<button onclick="sortProduct('+ pi.maxPage  +');"> >> </button>')
      
			$pagingArea.append($endButton);
         }

      });//ajax끝



   });//채인지 끝


   function sortProduct(page){
      var orderType = $("#orderProduct").val();
      var cid = <%= cid %>
      var currentPage = page;
      $.ajax({
         url:"<%= request.getContextPath() %>/orderByProduct.do",
         type:"post",
         data:{orderType:orderType,cid:cid,currentPage:currentPage},
         success:function(data){
            //procList
            var procList = data["procList"];
            var pi = data["pi"];

            $table = $("#productArea > tbody");
            $table.html('');

            var index = 0;
            var $tr = $('<tr>');

            $.each(procList,function(index2,value){
               var pid = value.pid;
               var $div = $('<div>');
               var $td = $('<td>');                   
               var $img = $('<img>');
               var $pnamep = $('<p>').text(value.pname);//pname
               var $pprice = $('<p>').text(value.pprice);//pprice
               var $pbrand = $('<p>').text(value.pbrand);//pbrand
               console.log(value);
               if(index < 3){                
                  $img.attr('src','<%= request.getContextPath() %>/images/product/'+value.change_name);//change_name
                  $img.attr('width','300px');
                  $img.attr('height','300px');

                  $div.append($img);
                  $div.append($pnamep);
                  $div.append($pprice);
                  $div.append($pbrand);
                  $div.css('marginLeft','20px');
                  $div.attr('onclick','location.href="<%= request.getContextPath() %>/detailProduct.do?num='+value.pid+'"');
                  $td.append($div);
                  $tr.append($td);

                  if(index ==2){
                     $table.append($tr);
                     $tr = $('<tr>');
                     index = -1;
                  }
                  index++;
               }
            });//each 끝
            if(index >= 1){
               $table.append($tr);
            }
            $pagingArea = $("#pagingArea");
            $pagingArea.html('');
			var $firstButton = $('<button onclick="sortProduct(1);"> << </button>');

      		 $pagingArea.append($firstButton);
            for (var i = 0; i < pi.maxPage; i++) {
               $pagingArea.append('<button onclick="sortProduct('+ (i+1) +')">'+ (i+1) +'</button>');
            }
            $endButton = $('<button onclick="sortProduct('+ pi.maxPage  +');"> >> </button>');
			$pagingArea.append($endButton);
         }//success끝
      });//ajax끝
   }//function끝
   </script>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>