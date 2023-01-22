/**
 * 
 */
 	//상품, 상점후기, 찜목록, 거래내역 버튼들 전환
	function show(element){
       let tag = document.getElementsByClassName("box");
  
       for(let i=0; i<tag.length; i++){
            if(element.id+"show" == tag[i].id){
                 tag[i].style.display = "block";
                 tag[i].style.animation = "fadeIn";
                 tag[i].style.animationDuration = "1s";
                     
             }else{
                 tag[i].style.display = "none";
             }
         }
     }

      
     //찜목록 모두 선택시
     $("#allCheck").click(function(){
         var chk = $("#allCheck").prop("checked");
         if(chk) {
          $(".chBox").prop("checked", true);
         } else {
          $(".chBox").prop("checked", false);
         }
      });
        
        
        

	//찜목록 삭제
    $(".chBox").click(function(){
     $("#allCheck").prop("checked", false);
    });
    
   	
   	$(".selectDelete_btn").click(function(){
    var confirm_val = confirm("정말 삭제하시겠습니까?");
    
    if(confirm_val) {
     var checkArr = [];
     
     
     $("input[class='chBox']:checked").each(function(){
      checkArr.push($(this).attr("data-heartNum"));
     });
     
     
     console.log(checkArr);
     
     
     $.ajax({
      url : '${pageContext.request.contextPath}/deleteHeart',
      type : 'post',
      data : { chbox : checkArr },
      success : function(){
       console.log("성공");
       location.href = "${pageContext.request.contextPath}/member/myPage";
      },
      error:function(){
			console.log("실패")
		}
    
     });
    } 
   });