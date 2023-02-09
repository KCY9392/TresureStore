/**
 * 더보기 버튼 클릭 시 js
 */
 
 function theBogi(){
	
		var ele = document.getElementById('display-list');
		var eleCount = ele.childElementCount;
		
		console.log("startNum : "+eleCount);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/sell/theBogi",
			type : "POST",
		    dataType : "json",
		    data : {eleCount : eleCount},
		    success : function(data) {
		    			
		            	var sellList = data;
		            	
		        		if(sellList !== null){
		        	
			        	if(${finishSellNo} < eleCount + 40){ 
			           		$("#moreShow").remove();
			        	}
			            
			            	console.log(data);
				            $(sellList).each(function(index, s){
				            	  
				            	$(".row").append('<div class="item col-3">'
				                  +'<div class="item" onclick="sellDetail('+ s.sellNo +')">'
				                  +'<div id="itemSolid" class="slist-items">'+
				                  
				                	  (s.crawl === "Y" ? '<img src="'+ s.imgSrc + '" width="100%" height="150px;" class="rounded float-start" alt="">' :
				                	  					 '<img src="${pageContext.request.contextPath}'+ s.imgSrc +'" width="100%" height="150px;" class="rounded float-start" alt="">')
				                  
				                  +'<div class="price-time">'
				                  +'<span>&nbsp;'+ s.sellTitle+'</span><br><br>'
				              	  +'<div class="price-time2"><br>'
				              	  +'&nbsp;<img src="/tresure/resources/images/icon/heart.png" width="15px" height="15px" style="margin-top:2px;">&nbsp;'
				              	  + s.heartNum
				              	  +'&nbsp;&nbsp;&nbsp;'
				              	  + s.timeago 
				              	  +'<br><span style="font-size: 33px; color:black;">'
				              	  + s.price +'원</span>'
				              	  +'</div></div></div></div></div>');
			    			  });	
			              }
			           },
					error : function(data){
						alert("오류");
		        	}
		    });
	}