<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/header.js"></script>

 <style>
 .main-section{
   
    -webkit-box-pack: center;
    justify-content: center;
    background: rgb(255, 255, 255);
    padding-top: 50px;
    padding-left: 400px;
    padding-right: 70px;
    /* margin-right: 150px; */
   

    }
    
    .content2{
    display: flex;
    
  
    
}

.profile{
   
}
.profile-image{
    border: grey solid 1px;
    width: 200px;
    height: 200px;
    margin-top: 20px;
    margin-left: 40px;
    margin-right: 20px;
}
.market-grade{
    font-size: 11px;
    margin-left: 112px;
    
    text-decoration: underline;

}


.info{
    
}
.info-table{
   
    flex: 1 0 0%;
    padding: 0px 30px;
    
    
    display: flex;
    height: 310px;
    flex-direction: column;
}
.market-name {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}




.info-list{
    
    height: 45px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    border-top: 1px solid rgb(250, 250, 250);
    border-bottom: 1px solid rgb(250, 250, 250);
    margin-bottom: 20px;
    flex-shrink: 0;


}

.market-open{

    margin-right: 30px;
    font-size: 13px;
    color: rgb(136, 136, 136);
    display: flex;
}
.market-opendate{
    margin-left: 5px;
    color: rgb(33, 33, 33);
    
}

.follower{
    margin-right: 30px;
    font-size: 13px;
    color: rgb(136, 136, 136);
    display: flex;

}

.market-follower{
    margin-left: 5px;
    color: rgb(33, 33, 33);

}
.sell-product{
    margin-right: 30px;
    font-size: 13px;
    color: rgb(136, 136, 136);
    display: flex;

}

.market-sell{
    margin-left: 5px;
    color: rgb(33, 33, 33);

}

.report{

    margin-right: 0px;
    font-size: 13px;
    color: rgb(136, 136, 136);
    display: flex;
}
.market-report{

    margin-left: 5px;
    color: rgb(33, 33, 33);
}

.button-area1{

    height: 56px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    flex-shrink: 0;
    flex-direction: row-reverse;
    


}
.button-area2{


display: flex;
-webkit-box-align: center;
align-items: center;
flex-shrink: 0;
flex-direction: row-reverse;



}

.following-list{

    height: 20px;
    display: flex;
    align-items: center;
   
    color:black;
    border: 1px solid gold;
    background-color: gold;
    font-size: 11px;
    border-radius: 15px;
}

.Withdrawal{
    height: 20px;
    display: flex;
   
    align-items: center;
    padding: 0px 1px;
    color: rgb(136, 136, 136);
   
    font-size: 11px;
}

.navi-list{
            list-style-type: none;/* ul속성 없애줌*/
            margin: 0;
            padding :0;
            height: 100%;

        }
        .navi-list>li{
            float: left;
            width: 15%;
            height: 100%;
            text-align: center;
        }
        .navi-list a{
            text-decoration: none;
            color :black;
            font-size: 14px;
            font-weight: 600;
            width: 100%;
            height: 100%;
            display: block;
            line-height: 35px;
            transform: scale(1)

        }
        .market-product{
            flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(33, 33, 33);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
            
        }
        .market-review{
            flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(33, 33, 33);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
}
        
        .market-heart{
           flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(33, 33, 33);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
        }
        .market-tracsac{
          flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(33, 33, 33);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
        }
        .list-form{
            border: 1px solid black;
            width: 758px;
          
            /* padding-left: 200px; */
        }
        .list-a{
        display: flex;
    height: 50px;
    text-align:center;
    }
    .mform{
    padding: initial;
    margin-left: auto;
    margin-right: auto;
}
    .allCheck { float:left; width:200px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn {  width:300px;  }
.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

.list-box{border: 1px solid; width: 600px; }
.checkBox { float:left; width:25px;  float: left; margin-top: 40px; margin-left: 40px; }
.checkBox input { width:16px; height:16px; }
.thumb{float: left; margin-left: 100px; margin-top: 40px;}
.gdsInfo{
    margin-left: 350px;
   
}
            
   
        
 </style>
</head>
<body>
		 <jsp:include page="../common/header.jsp"/>
	 	 <jsp:include page="../common/sideBar.jsp"/>
	 	 
	 
	 	 
	<div class="main-section">
        
    
       

    <div class="content2">

        <div class="profile">
            
            <div class="profile-image">
            <c:forEach var="chatRoom" items="${chatRoomList }">
		<c:if test="${chatRoom.avg > 4.5}"> 
			<img src="/tresure/resources/images/icon/grade3.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점 
		</c:if> 
		<c:if test="${ 4 <= chatRoom.avg && chatRoom.avg < 4.5 }"> 
			<img src="/tresure/resources/images/icon/grade2.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점 
		</c:if> 
		<c:if test="${ 3.5 <= chatRoom.avg && chatRoom.avg < 4 }"> 
			<img src="/tresure/resources/images/icon/grade1.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점 
		</c:if>
		<c:if test="${ 0 < chatRoom.avg  && chatRoom.avg < 3.5 }">
			<img src="/tresure/resources/images/icon/grade0.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점
		</c:if>  	                      
	</c:forEach>


            </div>
            <br>
            <a href="#" class="market-grade">상점등급 안내</a>

        </div>

        <div class="info">
            <div class="info-table">
                <div class="market-name">상점<h3>${loginUser.userNo }</h3>호점</div><br><br>
                <div class="info-list">
                    <div class="market-open">
                        <img src="/tresure/resources/images/icon/상점오픈.png" width="14" height="13" alt="상점오픈일 아이콘">
                        상점오픈일<div class="market-opendate"><span>${marketOpen }</span>일전</div>
                    </div>

                    <div class="follower">
                        <img src="/tresure/resources/images/icon/팔로워.png" width="14" height="13" alt="팔로워 아이콘">
                        팔로워<div class="market-follower"><span>${folloewCount }</span> 명</div>
                    </div>

                    <div class="sell-product">
                        <img src="/tresure/resources/images/icon/판매수.png" width="14" height="13" alt="상품판매 아이콘">
                        상품판매<div class="market-sell"> <span>${sellCount }</span> 회</div>
                    </div>

                    <div class="report">
                        <img src="/tresure/resources/images/icon/신고수.png" width="14" height="13" alt="신고 아이콘">
                        신고<div class="market-report"> <span>${reportCount }</span>회</div>
                    </div>
                    <br>
                    <br>

                    

                </div>
                <br>
                <br>
                <br>

                <div class="button-area1">
                    <a href="#" class= "following-list">팔로잉 목록</a>        
                </div>
                
                <div class="button-area2">
                    <a class="Withdrawal" href="#" data-toggle="modal">탈퇴하기</a>

                </div>
                

                    
            </div>

        </div>
       
        
    </div> 
    <div class="list-form">
    <fieldset id="mForm">
    	<div class="list-content">
    		<div class="list-a">
    			<button class="market-product"  type="button" onclick="show(this);" id="product" name="show"><span class="rproduct">상품</span></button>
				<button class="market-review" type="button" onclick="show(this);" id="review"name="show"><span class="rrview">상점후기</span></button>
				<button class="market-heart" type="button"onclick="show(this);" id="heart"name="show"><span class="rheart">찜</span></button>
				<button class="market-tracsac" href="#">거래내역<span class="rtransac"></span></button>
    		</div>
    	
    	</div>
    	<div id="productshow" class="box" style="flex-wrap: wrap;">
     	<c:forEach var="s" items="${sellList}" begin="0" end="${fn:length(sellList)}" step="1" varStatus="status">
                  <div class="item col-3" style="cursor: pointer; height: 300px;
                                           width: 200px !important;
                                           padding: 0px 20px !important;">
                     <div class="item">
                        <div id="itemSolid" class="slist-items" style="border: 1px solid rgb(238, 238, 238)">
                           <c:if test="${s.imgSrc != null}">
                           <img src="${s.imgSrc}" width="100%" height="150px;"
                              class="rounded float-start" alt="" style="">
                           </c:if>
                           <c:if test="${s.imgSrc == null}">
                           
                           </c:if>
                           <div class="price-time"
                              style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
                              <h4 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">&nbsp;${s.sellTitle}</h4>
                              <p>&nbsp;♥ &nbsp;${s.heartNum}</p>
                           </div>
                           <div class="price-time">
                              <p class="displayPrice">&nbsp;${s.price}원</p>
                              <h5 class="displayTime">&nbsp;${s.getTimeago()}</h5>
                           </div>
                        </div>
                     </div>
                  </div>
       </c:forEach> 
       </div>
       
       <div class="box box2" id="reviewshow">
       
      
       
       </div>
       
       <div class="box box3" id="heartshow">
       <div class="allCheck">
          <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
         </div>
         
         
         <div class="delBtn">
          <button type="button" class="selectDelete_btn">선택 삭제</button> 
         </div>
         <br>
         <br>
         
         
        <c:forEach items="${heartList}" var="h" begin="0" end="${fn:length(heartList)}" step="1" varStatus="status">
        
        <div class="list-box">
         <div class="checkBox">
          <input type="checkbox" name="chBox" class="chBox" data-userNum="${h.userNo}" />
         </div>
        
         <div class="thumb" >
          <img src="${h.imgSrc}"  width="30px" height="30px"/>
         </div>
         <div class="gdsInfo">
          <p>
           <span>${h.sellTitle}</span><br/>
           <span>${h.price }</span><br/>
           <span>${h.createDate }</span><br/>
          
          </p>
          
          
            </div>  
        </div> 
        
        </c:forEach>
       </div>
        
  

   </fieldset>
    </div> 
     

   
    

</div>


     <script>
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
      </script>
      
      <script>
      	
      </script>
      
      
       <script>
        $("#allCheck").click(function(){
         var chk = $("#allCheck").prop("checked");
         if(chk) {
          $(".chBox").prop("checked", true);
         } else {
          $(".chBox").prop("checked", false);
         }
        });
        </script>

<script>
    $(".chBox").click(function(){
     $("#allCheck").prop("checked", false);
    });
   </script>

    


    
     <jsp:include page="../common/footer.jsp"/>
     
   
   
	 	 	
	 	 	
		
</body>
</html>