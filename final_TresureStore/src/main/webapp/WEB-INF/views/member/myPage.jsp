<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 	 
	<div class="main-section">
        
    <div class="content2">

        <div class="profile">
            
<!-- 상점 등급 이미지 나오는 박스 -->            
            <div class="profile-image">
           <c:if test="${reviewAvg > 4.5}"> 
                                 <img src="/tresure/resources/images/icon/grade_3.png" height="100%" width="100%"/>
                              </c:if> 
                              <c:if test="${ 4 <= reviewAvg && reviewAvg < 4.5 }"> 
                                 <img src="/tresure/resources/images/icon/grade2.png" height="100%" width="100%"/> 
                              </c:if> 
                              <c:if test="${ 3.5 <= reviewAvg && reviewAvg < 4 }"> 
                                 <img src="/tresure/resources/images/icon/grade1.png" height="100%" width="100%"/> 
                              </c:if>
                              <c:if test="${ reviewAvg == null  || reviewAvg < 3.5 }">
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
                    <a href="${pageContext.request.contextPath }/follow/followList" class= "following-list">&nbsp;&nbsp;&nbsp;&nbsp;팔로잉 목록</a>        
                </div>
                
                <div class="button-area2">
                	<br><br>
                    <a class="Withdrawal" href="${pageContext.request.contextPath }/delete" data-toggle="modal">탈퇴하기</a>
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
				<button class="market-tracsac" onclick="tracsac();"><span class="rtransac">거래내역</span></button>
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
	                     <div class="item" onclick="sellDetail(${s.sellNo})">
	                        <div id="itemSolid" class="slist-items" style="border: 1px solid rgb(238, 238, 238)">
	                           <c:if test="${s.imgSrc != null}">
	                           <img src="${s.imgSrc}" width="100%" height="150px;"
	                              class="rounded float-start" alt="" style="">
	                           
	                            
	                              <c:if test="${s.sellStatus eq 'C' }">
	                              <div class="over-img">
	                      		  </div>
	                      		  <div class="text-c" style="color: white;
								    margin-left: 82px;
								    margin-top: -110px;
								    margin-bottom: 92px;">
	                      		  <h3>판매완료</h3>
	                      		  </div>
	                             
	                              </c:if>
	                        
	                           
	                          
	                              
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
	                              <h5 class="displayTime">&nbsp;${s.createDate}
	                               
	                              	 
	                              </h5>
	                              <c:if test="${s.sellStatus eq 'I' }">
	                           <h5 class="sellStatus">판매중</h5>
	                           </c:if>	
	                           <c:if test="${s.sellStatus eq 'C' }">
	                           <h5 class="sellStatus">판매완료</h5>
	                           </c:if>
	                             
	                              
	                           </div>
	                           
	                        </div>
	                     </div>
	                  </div>
	       </c:forEach> 
	      </div>
       </div>
       
       
       
<!-- 상점후기 버튼 클릭 시, 나오는 박스 -->       
       <div class="box box2" id="reviewshow" style="display:none;">
       <c:forEach var="r" items="${reviewList}" begin="0" end="${fn:length(reviewList)}" step="1" varStatus="status">
       <div class="review-table">
    <table>
    
        <tr>
       
        <td class="review-profile"> 
           <c:if test="${r.ravg> 4.5}"> 
                                 <img src="/tresure/resources/images/icon/grade_3.png" height="100%" width="100%"/>
                              </c:if> 
                              <c:if test="${ 4 <= r.ravg && r.ravg < 4.5 }"> 
                                 <img src="/tresure/resources/images/icon/grade2.png" height="100%" width="100%"/> 
                              </c:if> 
                              <c:if test="${ 3.5 <= r.ravg && r.ravg < 4 }"> 
                                 <img src="/tresure/resources/images/icon/grade1.png" height="100%" width="100%"/> 
                              </c:if>
                              <c:if test="${ r.ravg== null  ||r.ravg < 3.5 }">
                                 <img src="/tresure/resources/images/icon/grade0.png" height="100%" width="100%"/>
                              </c:if>  


           </td>
        
       
        <td><h3>${r.userNo }호점</h3></td>
      
     
        <td>${r.revContent }</td>
     
      
        <td>${r.createDate }</td>
       
       
    </tr>

    </table>

</div>
</c:forEach>
       
       
       
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
		        
		         <div class="thumb" onclick="sellDetail(${h.sellNo})">
		           <img src="${h.imgSrc}"  width="78px" height="78px" style="margin-top: -15px;"/>
		         </div>
		         
		         <div class="gdsInfo">
		           <p style="margin-top: 18px;">
		             <span>${h.sellTitle}</span><br><br>
		             <span>${h.price }</span><br><br>
		             <span>${h.createDate }</span><br><br>
		           </p>
		         </div>  
		    </div> 
        </c:forEach>
       </div>
   </fieldset>
    </div> 

</div>
<script>
		function sellDetail(sellNo){
			location.href = "${pageContext.request.contextPath}/sell/sellDetail/"+sellNo;
		}
	</script>
	
	<script>
		function tracsac(){
			location.href = "${pageContext.request.contextPath}/member/tracsac";
		}
	</script>
<script>

$("#allCheck").click(function(){
    var chk = $("#allCheck").prop("checked");
    if(chk) {
     $(".chBox").prop("checked", true);
    } else {
     $(".chBox").prop("checked", false);
    }
 })
  </script>
 
 
 
 <script>
$(".chBox").click(function(){
    $("#allCheck").prop("checked", false);
    });
    
    </script>
   
     <script>
     $(".selectDelete_btn").click(function(){
   var confirm_val = confirm("정말 삭제하시겠습니까?");
   
   if(confirm_val) {
    var checkArr = [];
    
    
    $("input[class='chBox']:checked").each(function(){
     checkArr.push($(this).attr("data-heartNum"));
    })
    
    
    console.log(checkArr);
    
    
    $.ajax({
     url : '${pageContext.request.contextPath}/deleteHeart',
     type : 'post',
     data : { chbox : checkArr },
     success : function(){
      console.log("성공");
      location.reload();
     },
     error:function(){
        console.log("실패")
     }
   
    });
   } 
  });
  
  
  </script>



    
     <jsp:include page="../common/footer.jsp"/>
      
</body>
</html>