<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<link rel="stylesheet" href="/tresure/resources/css/sell/sellDetail.css">
<script type="text/javascript" src="/tresure/resources/js/sellDetail.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>
	
	<c:if test="${not empty alertMsg }">
		<c:if test="${loginUser == null }">
			<script>
			Swal.fire({
                icon: 'error',
                title: '${alertMsg}'                  
            });		
// 				alertify.alert("경고",'${alertMsg}');// 변수를 문자열로
			</script>
		</c:if>
		
		<c:if test="${loginUser != null }">
			<script>
				Swal.fire({
	                icon: 'success',
	                title: '${alertMsg}'                  
	            });		
	// 				alertify.alert("경고",'${alertMsg}');// 변수를 문자열로
			</script>
		</c:if>
			<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	 <div class="main-section">
        <div class="sellDetail-div2">
            <div class="sellDetail-div3">
                <div class="sellDetail-div4">
                    <div class="categy">
                        <div class="categy2">
                            <img src="https://m.bunjang.co.kr/pc-static/resource/f1f8a93028f0f6305a87.png" alt="">&nbsp;&nbsp;&nbsp;카테고리
                        </div>
                        <div class="categy3">
                            <img class="" src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png" alt=""> ${s.categoryName}
                        </div>
                    </div>
                </div>
                <!-- 상품 이미지 -->
                <div class="sellImg">
                    <div class="sellImg2">
                        <div class="sellImg3">
                        	<div class="sellImgFirst" style="border: 1px solid rgb(238, 238, 238);">
	                        	<c:if test="${s.crawl.equals('Y')}">
											<img src="${s.imgSrc}" width="100%" height="100%"
											class="rounded float-start" alt="">
									</c:if>
									<c:if test="${s.crawl.equals('N')}">

										<img src="${pageContext.request.contextPath}${s.imgSrc}" width="100%" height="400px;"

										class="rounded float-start" alt="">
								</c:if>
								<c:if test="${s.sellStatus eq 'C' }">
					                              <div class="over-img">
					                              <div class="text-c" style="color: white;
												   
												    margin-top: 180px;
												    margin-bottom: 195px;">
					                      		  <h1>판매완료</h1>
					                      		  </div>
					                      		  </div>
					                      		  
			                   </c:if>
                        	</div>
                        	<c:if test="${s.imgList != null}">
							<div class="sellImg3_Box">
								<c:forEach var="img" items="${s.imgList }">
									<div class="sellImg3_1"
										style="border: 1px solid rgb(238, 238, 238);">
										<img src="${pageContext.request.contextPath}${contextPath }${img.filePath}${img.changeName }"
											alt="" style="width:100%; height:100%;">
									</div>
									
								</c:forEach>
							</div>
						</c:if>
							

							<!-- 판매자 정보 -->
                           <div class="sellerInfo">

	                                    <c:set var="sellerUrl" value="${pageContext.request.contextPath }/member/myPage" />
	                                    <c:if test="${loginUser.userNo != s.userNo }">
	                                    	<c:set var="sellerUrl" value="${pageContext.request.contextPath }/sell/seller/${s.userNo }" />
	                                    </c:if>
								<a href="${sellerUrl }">
                                <div class="sellGradeAndNameBox">
                                    <div class="sellerGradeImg">
	                                    	
	                                        <c:if test="${s.avg > 4.5}"> 
												<img src="/tresure/resources/images/icon/grade_3.png" width="100%" height="100%"/>
											</c:if> 
											<c:if test="${ 4 <= s.avg && s.avg < 4.5 }"> 
												<img src="/tresure/resources/images/icon/grade_3.png" width="100%" height="100%"/> 
											</c:if> 
											<c:if test="${ 3.5 <= s.avg && s.avg < 4 }"> 
												<img src="/tresure/resources/images/icon/grade_3.png" width="100%" height="100%"/> 
											</c:if>
											<c:if test="${ s.avg == null  || s.avg < 3.5 }">
												<img src="/tresure/resources/images/icon/grade_3.png" width="100%" height="100%"/>
											</c:if>
											
                                    </div>
                                    <div class="sellerNameInfoBox">
                                        <div class="sellerName">
                                                <p style="font-size:24px;">상점 ${s.userNo}호점</p>&nbsp;<img src="https://m.bunjang.co.kr/pc-static/resource/0acf058f19649d793382.png" width="15px" height="15px" style="margin-left:15px;">&nbsp;<p>${s.report_Num}</p>
                                        </div>

                                        <div class="sellNumAndFollowerBox">
                                            <p>상품 ${s.sell_Num} |  팔로워 ${s.follower_Num} </p>  
                                        </div>
                                    </div>
                                </div>
                                </a>

                                <div class="followBtn-sellDetail">
                                    <c:if test="${loginUser.getUserNo() == null || s.follow_Is == 0}">
                                    	<button type="button" class="followBtn-sell" style="width:100%; height: 100%;"><img class="followBtm" src="/tresure/resources/images/icon/followAddBtn.png" width="100%" height="80%"></button>
                                	</c:if>
                                	<c:if test="${s.follow_Is != 0}">
                                		<button type="button" class="followBtn-sell" style="width:100%; height: 100%;"><img class="followBtm" src="/tresure/resources/images/icon/followSubBtn.png" width="100%" height="80%"></button>
                                	</c:if>
                                </div>
                           </div>
                        </div>


                        <!-- 상품 제목 및 가격 -->
                        <div class="sellDetailInfo">
                            <div class="sellTitleDiv">
                                <div class="sellProductTitle">
                                    ${s.sellTitle}
                                </div>
                                <br>
                                <div class="sellProductPrice">
                                     <div class="sellProductPriceText">
                                        ${s.price}<span> 원</span>
                                     </div> 
                                    <c:if test="${loginUser.userNo!=s.userNo }">
                                     <!-- 찜하기 버튼 -->
                                     <div class="right_area">
                                        <a href="javascript:;" class="icon heart ${s.heart_Is == 0?'':'active'}">
                                        
                                        	<!-- 찜 안되어있는 경우 -->
                                        	<c:if test="${s.heart_Is == 0}">
                                           <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
                                            </c:if>
                                            
                                            <!-- 찜 되어있는 경우 -->
                                            <c:if test="${s.heart_Is != 0}">
                                            <img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜취소">
                                            </c:if>
                                        </a>
                                      </div> 
                                      </c:if>
                                      
                                </div>
                            </div>
                            <!-- 찜수, 조회수, 몇분전 게시 출력 -->
                            <div class="sellInfoBox">
                                <div class="sellInfoTextBox">
                                    <div class="sellInfoTextBox2">
                                        <div class="sellInfoTextBox">
                                            <img src="https://m.bunjang.co.kr/pc-static/resource/e92ccca1b575780c7cb4.png" width="16" height="16" alt="상품 찜수 아이콘">
                                            <div class="sellHeartNumText">
                                                <span>${s.heartNum}</span>
                                            </div>
                                        </div>

                                        <div class="sellInfoTextBox">
                                            <img src="https://m.bunjang.co.kr/pc-static/resource/95ccf1c901ac09d733ec.png" width="16" height="16" alt="상품 조회수 아이콘">
                                            <div class="sellHeartNumText">
                                                <span>${s.count}</span>
                                            </div>    
                                        </div>

                                        <div class="sellInfoTextBox">
                                            <img src="https://m.bunjang.co.kr/pc-static/resource/f5ac734eb33eb0faa3b4.png" width="16" height="16" alt="상품 몇분전 아이콘">
                                            <div class="sellHeartNumText">
                                                <span>${s.createDate}</span>
                                            </div>    
                                        </div>
                                            <c:if test="${loginUser.userNo!=s.userNo }">
                          
                                        <div class="sellInfoTextBox">
                                            <div class="sellInfoTextBoxReport">
                                                <img src="https://m.bunjang.co.kr/pc-static/resource/0acf058f19649d793382.png" width="16" height="16" alt="상품 몇분전 아이콘">
                                                <div class="sellHeartNumText">
                                                    <span>신고하기</span>
                                                </div>
                                            </div>
                                        </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <br><br>

                            <!-- 채팅하기 버튼 -->
                            <div class="purchaseGobtnBox">
                               <c:if test="${s.sellStatus eq 'I' && loginUser.userNo==s.userNo }">
                                	<button class="chattingbtn-sellDetail" id="chatting-start">수정하기</button>
                                	<button class="chattingbtn-sellDetail" id="chatting-start">삭제하기</button>
                                </c:if>
                                <c:if test="${loginUser.userNo!=s.userNo }">
                                <button class="chattingbtn-sellDetail" id="chatting-start">채팅하기</button>
                                </c:if>
                                <c:if test="${s.sellStatus eq 'C' }">
                                	<button class="sell-comp" id="sell-comp">삭제하기</button>
                                </c:if>
                            </div>

                            <!-- 상품 설명 텍스트 -->
                            <div class="sellProductDetailInfoBox">
                                <br>
                                <span>&nbsp;상품정보</span>
								<p>${fn:replace(s.sellContent, replaceChar, "<br/>")}</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

	<script>
	$(document).on("click", ".followBtn-sell", (e) => {
		if ("${loginUser.userNo}" == "${s.userNo}") {
			alert("내가 나 자신을 팔로우 할 수는 없습니다.");
			return;
		}

		$(e.target).parent().removeClass("followBtn-sell"); // 중복 이벤트 방지를 위해 class를 제거. (class를 제거하면 더 이상 이벤트 발생 안함)
		$.ajax({
			url : '${pageContext.request.contextPath}/follow/addFollow',
			type : "post",
			data : {fwId : "${s.userNo}"},
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
							data : {fwId : "${s.userNo}"},
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
	    $("#chatting-start").click(function() {
	
	        let form = document.createElement('form');
	        form.setAttribute('method', 'post');
	        form.setAttribute('action', '${pageContext.request.contextPath}/chat/chatRoom/${s.sellNo }/${loginUser.userNo}');
	        document.charset = 'utf-8';
	
	        let hiddenField = document.createElement('input');
	
	        hiddenField.setAttribute('type', 'hidden');
	        hiddenField.setAttribute('name', "sellUserNo");
	        hiddenField.setAttribute('value', ${s.userNo});
	        form.appendChild(hiddenField);
	
	        document.body.appendChild(form);
	        form.submit();
	    });
    </script>
     <script>
     $(function(){
 	    var $likeBtn =$('.icon.heart');
 			
 	    	
 	        $likeBtn.click(function(){
 			if(!this.classList.contains('active')){
 	         $.ajax({
 	   	               	url : '${pageContext.request.contextPath}/addHeart',
 	   	                type : 'post',
 	   	                data : {sellNo : "${s.sellNo}"},
 	   	                success : function(result){
 	   	    				if(result == 1) {
 	   	     					alert("찜하기 성공");
 	   	     					
 	   	     				$likeBtn.toggleClass('active');
 	   	                	if($likeBtn.hasClass('active')){ 
 	   	 		        	
 	   	   	              	 $likeBtn.find('img').attr({
 	   		 	              'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
 	   		 	               alt:'찜하기 완료'
 	  	 	            	  
 	   	 	            	  });
 	   	                	}
 	   	              		
 	   	                location.reload();
 	   	    				} else {
 	   	    		 			alert("회원만 사용할 수 있습니다.");
 	   	     				}
 	   	   				},
 	   	   				error : function(){
 	   				    alert("찜 하기 실패");
 	   				
 	   				   }
 	                
 	               
 	                })
 	         
 	         
 	        }
 	        else{
 				 $.ajax({
 				     url : '${pageContext.request.contextPath}/mypageDeleteHeart',
 				     type : 'post',
 				     data : { sellNo : "${s.sellNo}" },
 				     success : function(result){
 				    	 
 				    	 if(result==1){
 				    	 alert("찜하기 취소");
 				    	 
 				    	 
 				    	  $likeBtn.find('i').removeClass('fas').addClass('far')
 				    	  $likeBtn.find('img').attr({
 				    		 'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
 				    		 alt:"찜하기 취소"
 				    	 });
 				    	 location.reload();
 				      
 				     }else {
 	    		 			alert("회원만 사용할 수 있습니다.");
 	     				}
 				     },
 				 error:function(){
 				        alert("실패")
 				     }
 				   
 				   
 	         })
 	      }
     }); 
 	        
     });
	       
    </script>
	        
	            	  
	                
	              
	          
	          

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>