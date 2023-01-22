<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/tresure/resources/css/mypage/mypageMain.css">
<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/header.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/mypageMain.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>
	 	 
	<div class="main-section22">
        
    <div class="content2">

        <div class="profile">
            
<!-- 상점 등급 이미지 나오는 박스 -->            
            <div class="profile-image">
           <c:if test="${s.avg > 4.5}"> 
                                 <img src="/tresure/resources/images/icon/grade3.png" height="100%" width="100%"/>
                              </c:if> 
                              <c:if test="${ 4 <= s.avg && s.avg < 4.5 }"> 
                                 <img src="/tresure/resources/images/icon/grade2.png" height="100%" width="100%"/> 
                              </c:if> 
                              <c:if test="${ 3.5 <= s.avg && s.avg < 4 }"> 
                                 <img src="/tresure/resources/images/icon/grade1.png" height="100%" width="100%"/> 
                              </c:if>
                              <c:if test="${ s.avg == null  || s.avg < 3.5 }">
                                 <img src="/tresure/resources/images/icon/grade0.png" height="100%" width="100%"/>
                              </c:if>  


            </div>
            <br>
            <a href="#" class="market-grade">상점등급 안내</a>

        </div>

<!-- 상점명 & 개업날짜 & 팔로워수 & 판매상품수 & 상점신고수 내용 박스 -->
        <div class="info">
            <div class="info-table">
                <div class="market-name">상점<h3>${loginUser.userNo }</h3>호점</div><br><br>
                <div class="info-list">
                    <div class="market-open">
                        <img src="/tresure/resources/images/icon/상점오픈.png" width="20" height="15" alt="상점오픈일 아이콘">
                        &nbsp;상점오픈일<div class="market-opendate"><span>${marketOpen }</span>일전</div>
                    </div>

                    <div class="follower">
                        <img src="/tresure/resources/images/icon/팔로워.png" width="20" height="15" alt="팔로워 아이콘">
                        &nbsp;팔로워<div class="market-follower"><span>${folloewCount }</span> 명</div>
                    </div>

                    <div class="sell-product">
                        <img src="/tresure/resources/images/icon/판매수.png" width="20" height="15" alt="상품판매 아이콘">
                        &nbsp;상품판매<div class="market-sell"> <span>${sellCount }</span> 회</div>
                    </div>

                    <div class="report">
                        <img src="/tresure/resources/images/icon/신고수.png" width="20" height="15" alt="신고 아이콘">
                        &nbsp;신고<div class="market-report"> <span>${reportCount }</span>회</div>
                    </div>
                    <br><br>
                </div>
                <br><br><br>

                <div class="button-area1">
                    <a href="#" class= "following-list">&nbsp;&nbsp;&nbsp;&nbsp;팔로잉 목록</a>        
                </div>
                
                <div class="button-area2">
                	<br><br>
                    <a class="Withdrawal" href="#" data-toggle="modal">탈퇴하기</a>
                </div>
            </div>
        </div>
    </div> 
    
    
    <br><br>
    
<!-- 상품 & 상점후기 & 찜목록 & 거래내역 버튼들 -->
    <div class="list-form">
    <fieldset id="mForm">
    	<div class="list-content">
    		<div class="list-a">
    			<button class="market-product"  type="button" onclick="show(this);" id="product" name="show"><span class="rproduct">상품</span></button>
				<button class="market-review" type="button" onclick="show(this);" id="review"name="show"><span class="rrview">상점후기</span></button>
				<button class="market-heart" type="button"onclick="show(this);" id="heart"name="show"><span class="rheart">찜</span></button>
				<button class="market-tracsac" href="#"><span class="rtransac">거래내역</span></button>
    		</div>
    		<br><br>
    	</div>
    	
    	
    	
<!-- 상품 버튼 클릭 시, 나오는 박스 -->   	
    	<div id="productshow" class="box">
	     		<div class="displayList" style="flex-wrap: wrap; display:flex; margin:auto; padding-top:23px; padding-left:15px;">
	     	<c:forEach var="s" items="${sellList}" begin="0" end="${fn:length(sellList)}" step="1" varStatus="status">
	                  <div class="item col-3" style="cursor: pointer; height: 300px;
	                                           width: 200px !important;
	                                           padding: 0px 20px !important;
	                                           margin-bottom:10px !important;">
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
       </div>
       
       
       
<!-- 상점후기 버튼 클릭 시, 나오는 박스 -->       
       <div class="box box2" id="reviewshow" style="display:none;">
       
       
       </div>
       
       
       
       
<!-- 찜목록 버튼 클릭 시, 나오는 박스 -->
       <div class="box box3" id="heartshow" style="display:none; padding-left: 30px; padding-top: 20px;">
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
		           <input type="checkbox" name="chBox" class="chBox" data-heartNum="${h.heartNo}" />
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

    
     <jsp:include page="../common/footer.jsp"/>
</body>
</html>