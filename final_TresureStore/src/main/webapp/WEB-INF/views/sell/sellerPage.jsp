<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/tresure/resources/css/mypage/mypageMain.css">
<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/header.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/mypageMain.js"></script>
 

      
<style>

		.followAddOrSubBox{
            
            margin: auto;
            border: 1px solid rgb(211 206 206);
            width: 270px;
    		height: 60px;
    		margin-left: 260px
        }
        
 		.followBtn-sell{
            border: none;
            background-color: white;
        }

        .followBtn-sell:hover{
            cursor: pointer;
            border: 3px solid rgb(241, 238, 238);
        }
        
        #mForm{
        	border: 1px !important;
		    margin: auto !important;
		    padding-left: 50px !important;
        }
</style>
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
                                 <img src="/tresure/resources/images/icon/backGray_grade3.png" height="100%" width="100%"/>
                              </c:if> 
                              <c:if test="${ 4 <= reviewAvg && reviewAvg < 4.5 }"> 
                                 <img src="/tresure/resources/images/icon/backGray_grade2.png" height="100%" width="100%"/> 
                              </c:if> 
                              <c:if test="${ 3.5 <= reviewAvg && reviewAvg < 4 }"> 
                                 <img src="/tresure/resources/images/icon/backGray_grade1.png" height="100%" width="100%"/> 
                              </c:if>
                              <c:if test="${ reviewAvg == null  || reviewAvg < 3.5 }">
                                 <img src="/tresure/resources/images/icon/backGray_grade0.png" height="100%" width="100%"/>

                              </c:if>  


            </div>
            <br>
            <a href="#" class="market-grade">상점등급 안내</a>

        </div>

<!-- 상점명 & 개업날짜 & 팔로워수 & 판매상품수 & 상점신고수 내용 박스 -->
        <div class="info">
            <div class="info-table">

                <div class="market-name" style="margin-top: 55px;margin-bottom: 10px;"
                >상점 ${loginUser.userNo } 호점</div>

                <div class="info-list">
                    <div class="market-open">
                        <img src="/tresure/resources/images/icon/상점오픈.png" width="20" height="15" alt="상점오픈일 아이콘">
                        &nbsp;상점오픈일<div class="market-opendate"><span>${member.marketOpen }</span>일전</div>
                    </div>

                    <div class="follower">
                        <img src="/tresure/resources/images/icon/팔로워.png" width="20" height="15" alt="팔로워 아이콘">
                        &nbsp;팔로워<div class="market-follower"><span>${member.followCount }</span> 명</div>
                    </div>

                    <div class="sell-product">
                        <img src="/tresure/resources/images/icon/판매수.png" width="20" height="15" alt="상품판매 아이콘">
                        &nbsp;상품판매<div class="market-sell"> <span>${member.sellCount }</span> 회</div>
                    </div>

                    <div class="report">
                        <img src="/tresure/resources/images/icon/신고수.png" width="20" height="15" alt="신고 아이콘">
                        &nbsp;신고<div class="market-report"> <span>${member.reporterCount }</span>회</div>
                    </div>
                    <br><br>
                </div>
                <br><br><br>


                <div class="followAddOrSubBox" style="margin-left: 290px;">
					<c:if test="${loginUser.getUserNo() == null || s.follow_Is == 0}">
                           <button type="button" class="followBtn-sell" style="width:100%; height: 100%;"><img src="/tresure/resources/images/icon/followAddBtn.png" width="100%" height="70%"></button>

                    </c:if>
                    <c:if test="${member.isFollow != 0}">
                           <button type="button" class="followBtn-sell" style="width:100%; height: 100%;"><img class="followBtm" src="/tresure/resources/images/icon/followSubBtn.png" width="100%" height="70%"></button>
                    </c:if>                
                </div>
            </div>
        </div>
    </div> 
    
    
    <br><br>
    
<!-- 상품 & 상점후기 버튼들 -->
    <div class="list-form">
    <fieldset id="mForm">
    	<div class="list-content">
    		<div class="list-a">
    			<button class="market-product"  type="button" onclick="show(this);" id="product" name="show"><span class="rproduct">상품</span></button>
				<button class="market-review" type="button" onclick="show(this);" id="review"name="show"><span class="rrview">상점후기</span></button>
    		</div>
    		<br><br>
    	</div>
    	
    	
    	

<!-- 상품 버튼 클릭 시, 나오는 박스 -->   	
    	<div id="productshow" class="box">
	     		<div class="displayList" style="flex-wrap: wrap; display:flex; margin:auto; padding-top:23px; padding-left: 35px;">
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
       
   
   </fieldset>
    </div> 
</div>
    
     <jsp:include page="../common/footer.jsp"/>
     
     <script>
	 	$(document).on("click", ".followBtn-sell", (e) => {
			if ("${loginUser.userNo}" == "${s.userNo}") {
				alert("내가 나 자신을 팔로우 할 수는 없습니다.");
				return;
			}
	
			$(e.target).parent().removeClass("followBtn-sell"); // 중복 이벤트 방지를 위해 class를 제거. (class를 제거하면 더 이상 이벤트 발생 안함)
			let fwId = ${member.userNo};
			$.ajax({
				url : '${pageContext.request.contextPath}/follow/addFollow',
				type : "post",
				data : {fwId : fwId},
				dataType : "json",
				success : function(data) {
					let result = Number(data.result);
					if (result == 1) {
						$(".followBtm").attr("src", $(".followBtm").attr("src").replace("followAddBtn.png", "followSubBtn.png"));
						alert("팔로우 되었습니다.");
						location.reload();
					} else if (result == 2) {
						if (confirm("이미 팔로우 했습니다.\n팔로우를 취소하시겠습니까?")) {
							$.ajax({
								url : '${pageContext.request.contextPath}/follow/delFollow',
								type : "post",
								data : {fwId : fwId},
								dataType : "json",
								success : function(data) {
									let count = Number(data.result)
									if (count == 1) {
										alert("팔로우가 취소되었습니다.");
										$(".followBtm").attr("src", $(".followBtm").attr("src").replace("followSubBtn.png", "followAddBtn.png"));
										location.reload();
									} else {
										alert("팔로우 취소에 실패하었습니다.");
									}
								},
								error : function() {
									alert("오류!!!");
									console.log("오류");
								}
							});
						}
					} else {
						alert("오류가 발생!!")
					}
					console.log(data);
				},
				error : function() {
					alert("오류가 발생.");
					console.log("오류");
				},
				complete : function () {
					$(e.target).parent().addClass("followBtn-sell");
				}
			})
	
		    });

     </script>
     
     <script>
		function sellDetail(sellNo){
			location.href = "${pageContext.request.contextPath}/sell/sellDetail/"+sellNo;
		}
     </script>
      
</body>
</html>