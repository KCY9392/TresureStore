/**
 * 
 */
 
 //heart 좋아요 클릭시! 하트 뿅
$(function(){
	    var $likeBtn =$('.icon.heart');

	        $likeBtn.click(function(){
	         $.ajax({
	   	               	url : 'addHeart',
	   	                type : 'post',
	   	                data : {sellNo : "${s.sellNo}"},
	   	                success : function(result){
	   	                 $likeBtn.toggleClass('active');
	   	    
	   	    				if(result == 1) {
	   	     					alert("찜하기 성공");
	   	     			
	   	    				} else {
	   	    		 			alert("회원만 사용할 수 있습니다.");
	   	     				}
	   	   				},
	   	   				error : function(){
	   				    alert("찜 하기 실패");
	   				   }
	                
	               
	                })
	        
	       

	        if($likeBtn.hasClass('active')){ 
	        	
	           $(this).find('img').attr({
	              'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
	               alt:'찜하기 완료'
	            	  
	            	  })
	            	  
	                
	              
	          
	          
	         }else{
	            $(this).find('i').removeClass('fas').addClass('far')
	           $(this).find('img').attr({
	              'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
	              alt:"찜하기"
	           })
	         }
	     })
	})