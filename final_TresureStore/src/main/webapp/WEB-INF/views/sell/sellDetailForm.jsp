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
                        	<c:if test="${s.imgSrc != null}">
                        		<img src="${pageContext.request.contextPath}${s.imgSrc}" alt="" width="100%; height:100%;">
                        	</c:if>
                        	<br><br><br><br><br><br><br><br><br><br><br>
                        		<!-- 여기다가 sfile 정보 가져오기 -->
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
                        	</div>
								<!-- <div class="sellImg3_Box">
                            <div class="sellImg3_1" style="border: 1px solid rgb(238, 238, 238);">
                                <img src="https://img2.joongna.com/media/original/2023/01/12/1673451291434UwM_EwsSN.jpg" alt="" width="100%; height:100%;">                                
                            </div>
                            <div class="sellImg3_2" style="border: 1px solid rgb(238, 238, 238);">
                                <img src="https://img2.joongna.com/media/original/2023/01/12/1673451291434UwM_EwsSN.jpg" alt="" width="100%; height:100%;">
                            </div> -->
							

							<!-- 판매자 정보 -->
                           <div class="sellerInfo">

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

                                <div class="followBtn-sellDetail">
                                    <c:if test="${loginUser.getUserNo() == null || s.follow_Is == 0}">
                                    	<button type="button" class="followBtn-sell" style="width:100%; height: 100%;"><img src="/tresure/resources/images/icon/followAddBtn.png" width="100%" height="80%"></button>
                                	</c:if>
                                	<c:if test="${s.follow_Is != 0}">
                                		<button type="button" class="followBtn-sell" style="width:100%; height: 100%;"><img src="/tresure/resources/images/icon/followSubBtn.png" width="100%" height="80%"></button>
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
                                     
                                     <!-- 찜하기 버튼 -->
                                     <div class="right_area">
                                        <a href="javascript:;" class="icon heart">
                                           <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
                                        </a>
                                      </div>  
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
                                        
                                        <div class="sellInfoTextBox">
                                            <div class="sellInfoTextBoxReport">
                                                <img src="https://m.bunjang.co.kr/pc-static/resource/0acf058f19649d793382.png" width="16" height="16" alt="상품 몇분전 아이콘">
                                                <div class="sellHeartNumText">
                                                    <span>신고하기</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br><br>

                            <!-- 채팅하기 버튼 -->
                            <div class="purchaseGobtnBox">
                                <button class="chattingbtn-sellDetail" >채팅하기</button>
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
    
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>