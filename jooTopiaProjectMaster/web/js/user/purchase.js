/*src="/jootopia/js/external/jquery-3.4.0.min.js";*/
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js";

// purchaseRequestForm.jsp에서 category
$("#cGroup").change(function(){
	var cGroup = $(this).children("option:selected").val();
	var $cName = $("#cName");
	$.ajax({
		url:"<%= request.getContextPath() %>/selectNameList.do",
		data:{cGroup:cGroup},
		type:"get",
		success:function(data){
			console.log("서버 전송 성공!");
			var options = "<option selected>-- 중분류 --</option>"; 
			for(var i = 0; i < data.length; i++){
				if(i == 0){
					options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
				}else{
					options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
				}
			}	
			$cName.html(options);
		},error:function(data){
			console.log("서버 전송 실패!");
		}
	});
});
						