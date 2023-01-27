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


    