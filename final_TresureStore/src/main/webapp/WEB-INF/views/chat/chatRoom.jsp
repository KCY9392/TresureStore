<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보물상점</title>
    <!-- Jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- 헤더 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/header.js"></script>
	<!-- 웹소켓 js -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<!-- 결제 js -->
	<script type="text/javascript" src="/tresure/resources/js/payment.js?ver=1"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- alertify -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- alertify css -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
   	<!-- Default theme -->
   	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
   	<!-- Semantic UI theme -->
   	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<!-- Alert 창  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- css 링크 -->
    <link rel="stylesheet" href="/tresure/resources/css/chat/chatRoom.css">   

</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="main-section">
        <div class="inner-section">
            <!-- 채팅 왼쪽창(상품상세) -->
                        <div class="leftBox">
                <div class="sell_pic">
                    <img src="${AllList.get('product').imgSrc }" width="100%" height="100%"/>
                </div>
                    <div class="sell_detail">
                        <div class="sell_category">카테고리 > ${AllList.get('product').categoryName }</div>
                        
                           <div class="sell_title" onclick="sellDetail(${AllList.get('product').sellNo })">
                              ${AllList.get('product').sellTitle }
                           </div> 
                       
                        <div class="sell_price"><p class="mark">
                           <c:choose>
                              <c:when test="${AllList.get('product').negoStatus ne null }">
                                 ${AllList.get('product').negoPrice }
                              </c:when>
                              <c:otherwise>
                                 ${AllList.get('product').price }
                              </c:otherwise>
                           </c:choose>
                        </div>
                        <c:if test="${loginUser.userNo eq  AllList.get('product').userNo}">
                           <c:if test="${AllList.get('product').negoStatus  eq null }">
                              <div class="btn-area"><button class="negoBtn" id="negoBtn" onclick="modal();" type="button">네고 가격 결정</button></div>
                           </c:if>
                           <c:if test="${AllList.get('product').negoStatus ne null }">
                              <div class="btn-area"><button class="negoBtn2" type="button" disabled>네고 가격 완료</button></div>
                           </c:if>
                        </c:if>
                        
                    </div>
                    <div class="sell_content">${AllList.get('product').sellContent }</div>
            </div><!-- leftBox 끝 -->

        
            
            
            

            <div class="rightBox">

                
                <div class="box">
                    <div class="inner"></div>
                    <i class="btn btn1"></i>
                    <i class="btn btn2"></i>
                    <i class="btn btn3"></i>
                    <i class="rightSideBtn"></i>
                    <div class="box-header">
                        <div class="chatmenubar">

                            <ul class="header-list">
                                <li>
                                	<!-- 로그인사람과 구매한사람이 같은경우  -->
                                   	<c:if test="${AllList.get('purchaseInfo').userNo eq loginUser.userNo}">
                                        <c:if test="${AllList.get('product').avg  >= 4.5}">
                                            <img src="/tresure/resources/images/icon/grade3.png" width="40px" /> <span class="store-text">상점 <p class="dd">${AllList.get('product').userNo }</p>호 점</span>
                                        </c:if>
                                        <c:if test="${ 4 <= AllList.get('product').avg && AllList.get('product').avg < 4.5 }">
                                            <img src="/tresure/resources/images/icon/grade2.png" width="40px" /> <span class="store-text">상점 ${AllList.get('product').userNo }호 점</span>
                                        </c:if>
                                        <c:if test="${ 3.5 <= AllList.get('product').avg && AllList.get('product').avg < 4 }">
                                            <img src="/tresure/resources/images/icon/grade1.png" width="40px" /> <span class="store-text">상점 ${AllList.get('product').userNo }호 점</span>
                                        </c:if>
                                        <c:if test="${ null == AllList.get('product').avg || AllList.get('product').avg < 3.5 }">
                                            <img src="/tresure/resources/images/icon/grade0.png" width="40px" /> <span class="store-text">상점 ${AllList.get('product').userNo }호 점</span>
                                        </c:if>
                                       </c:if>
                                       <!-- 로그인한 사람과 판매하는 사람이 같은경우 -->
                                       <c:if test="${AllList.get('product').userNo eq loginUser.userNo}">
                                        <c:if test="${AllList.get('purchaseInfo').purchaseUserAvg >= 4.5}">
                                            <img src="/tresure/resources/images/icon/grade3.png" width="40px" />  <span class="store-text">상점 ${AllList.get('purchaseInfo').userNo }호 점</span>
                                        </c:if>
                                        <c:if test="${ 4 <= AllList.get('purchaseInfo').purchaseUserAvg && AllList.get('purchaseInfo').purchaseUserAvg < 4.5 }">
                                            <img src="/tresure/resources/images/icon/grade2.png" width="40px" /> <span class="store-text">상점 ${AllList.get('purchaseInfo').userNo }호 점</span>
                                        </c:if>
                                        <c:if test="${ 3.5 <= AllList.get('purchaseInfo').purchaseUserAvg && AllList.get('purchaseInfo').purchaseUserAvg < 4 }">
                                            <img src="/tresure/resources/images/icon/grade1.png" width="40px" /> <span class="store-text">상점 ${AllList.get('purchaseInfo').userNo }호 점</span>
                                        </c:if>
                                        <c:if test="${ null == AllList.get('purchaseInfo').purchaseUserAvg || AllList.get('purchaseInfo').purchaseUserAvg < 3.5 }">
                                            <img src="/tresure/resources/images/icon/grade0.png" width="40px" /> <span class="store-text">상점 ${AllList.get('purchaseInfo').userNo }호 점</span>
                                        </c:if>
                                      </c:if>
                                
                                
     
                                </li>

                                <li><br>
                                    <a id="addReport" class="buttonCss" >신고</a>
                                </li>
                                <li><br>
                                	<!-- 구매자가 차단했을 경우 -->
                                	<c:if test="${AllList.get('puTose') >= 1 && loginUser.userNo eq AllList.get('purchaseInfo').userNo}"   >
                                		<a data-toggle="modal" data-target="#block-modal" id="removeBlock" class="buttonCss" >차단 해제</a>
                                	</c:if>
                                	<!-- 구매자가 차단 안 했을 경우 -->
                                	<c:if test="${AllList.get('puTose') == 0 && loginUser.userNo eq AllList.get('purchaseInfo').userNo}"   >
                                		<a data-toggle="modal" data-target="#block-modal" id="addBlock" class="buttonCss" >차단</a>
                                	</c:if>
                                	<!-- 판매자가 차단했을 경우 -->
                                	<c:if test="${AllList.get('seTopu') >= 1 && loginUser.userNo eq AllList.get('product').userNo}"   >
                                		<a data-toggle="modal" data-target="#block-modal" id="removeBlock" class="buttonCss" >차단 해제</a>
                                	</c:if>
                                	<!-- 판매자가 차단 안 했을 경우 -->
                                	<c:if test="${AllList.get('seTopu') == 0 && loginUser.userNo eq AllList.get('product').userNo}"   >
                                		<a data-toggle="modal" data-target="#block-modal" id="addBlock" class="buttonCss" >차단</a>
                                	</c:if>
                                     		
                                </li>
                                <li style="float: right;">
                                    <button type="submit" class="buttonCss2" id="tresurePay" 
                                    onclick="requestPay('${AllList.get('product').sellTitle }',
                                    					'${AllList.get('product').price }',
                                    					'${AllList.get('purchaseInfo').userNo}',
                                    					'${pageContext.request.contextPath}')">결제하기</button>
                                </li>
                            </ul>
                            
                                              
                        </div>
                    </div>
                    <div class="box-body">
                        
                        <!-- 채팅창 대화 -->
                        <div class="display-chatting-area">
                            <ul class="display-chatting">
                              <c:forEach items="${AllList.get('roomMessageList') }" var="msg">
                                 <fmt:formatDate var="chatDate" value="${msg.createDate }" pattern="yyyy년 MM월 dd일 HH:mm" />
                                 <%-- 1) 내가 보낸 메세지 --%>
                                 <c:if test="${msg.userNo == loginUser.userNo }">
                                     <li class="myChat">
                                        <p class="chat">${msg.chatContent }</p><br>
                                        <span class="chatDate">${chatDate }</span>
                                         
                                     </li>
                                 </c:if>
                                 <%-- 2) 남(이름)이 보낸 메세지 --%>
                                 <c:if test="${msg.userNo != loginUser.userNo }">
                                     <li>
                                         <p class="chat">${msg.chatContent }</p><br>
                                         <span class="chatDate">${chatDate }</span>
                                     </li>
                                 </c:if>
                              </c:forEach>
                            </ul>


                        </div>

                    </div>
                    <div class="box-footer">
                        <div class="footer-area">
                            <div class="float-left pricture"><img src="https://cdn-icons-png.flaticon.com/512/739/739249.png" width="40"/>&nbsp;&nbsp;
                            </div>
                            <!-- 차단 아무도 없을 때 -->
                            <c:if test="${AllList.get('puTose') == 0 && AllList.get('seTopu') == 0 && AllList.get('state') != 0}" >
                            	<input class="messageInput-area" id="inputChatting" placeholder="메세지를 입력하세요!" onkeypress="if(event.keyCode == 13) {massageEnterSend();}"/>
                            	<button class="float-left MessageSubmitBtn" id="send" type="button" >보내기</button>
                            </c:if>
                            <!-- 차단 한명이라도 했을 때 -->
                            <c:if test="${AllList.get('puTose') >= 1 || AllList.get('seTopu') >= 1 || AllList.get('state') == 0}">
                            	<input class="messageInput-area2" id="nonoinputChatting" placeholder="상점에게 메세지를 보낼 수 없습니다." disabled/>
                            	<button class="float-left MessageSubmitBtn" id="send" type="button" disabled >보내기</button>
                            </c:if>
                        </div>
                        
                    </div>
                </div>

            </div><!-- rightBox 끝 -->
        </div>
    </div><!-- main-section 끝 -->
    <jsp:include page="../common/footer.jsp"/>

     <script>
     
	   //신고버튼 클릭 시
		 $('#addReport').on('click', function(){
			 
	 		Swal.fire({
	 		  title: '상점신고',
	 		  input: 'radio',
	 		  inputOptions: {
		 			주류_담배 : '주류/담배',
		 			전문의약품_의료기기 : '전문 의약품/의료기기',
		 			개인정보거래 : '개인정보 거래',
		 			음란물_성인용품 : '음란물/성인용품',
		 			위조상품 : '위조상품',
		 			총포_도검류 : '총포/도검류',
		 			게임계정 : '게임 계정',
		 			동물분양_입양글 : '동물 분양, 입양글',
		 			기타 : '기타'
	 		  },
	 		  customClass: {
	 			    input: 'inline-flex',
	 			    inputLabel: 'inline-block'
	 		  }
			}).then(function(reportContent) {
			    if (reportContent.value) {
			    	Swal.fire('상점신고 완료', reportContent.value+" (으)로 신고하셨습니다.", "success");
			        reportAdd(reportContent.value);
			        console.log("Result: " + reportContent.value);
			    }
			})
	 	
		 });
		   
		   
	   
		//신고추가
		 function reportAdd(value){
				var reportedUserNo = $('#dd').innerText();
				
				$.ajax({
					url : "${pageContext.request.contextPath}/report/addReport",
					data : {reportContent : value,
							reportedUserNo : reportedUserNo} ,
					success : function(result){
						if(result == 1){
							location.href = "${pageContext.request.contextPath}/report/reportSearch";
						}
					},
					error : function(){
						console.log("통신실패");
					}
				});
	    };

		 
	     
     	//차단버튼 클릭 시 
    	 $('#addBlock').on('click', function(){
    		 
    		 $.ajax({
    			 url : "${pageContext.request.contextPath}/chat/chatBlockAdd",
    			 data : {
    				 chatRoomNo : ${chatRoomNo},
    				 sellUserNo : ${AllList.get('product').userNo},
    				 purchaseUserNo : ${AllList.get('purchaseInfo').userNo} 
    				 },
    			 type : "post",
    			 success : function (result){
    				 console.log(result);
    				 if(result == 1){
    					 alert("차단되었습니다.");
    					 
    					 location.reload();
    					 
    					 
    				 }
    			 },
    			 error : function(){
    				 console.log("통신실패");
    			 }
    		 });
    	 });
     	
    	//차단해제 버튼 클릭 시 
    	 $('#removeBlock').on('click', function(){
    		 
    		 $.ajax({
    			 url : "${pageContext.request.contextPath}/chat/chatBlockremove",
    			 data : {
    				 chatRoomNo : ${chatRoomNo},
    				 sellUserNo : ${AllList.get('product').userNo},
    				 purchaseUserNo : ${AllList.get('purchaseInfo').userNo} 
    				 },
    			 type : "post",
    			 success : function (result){
    				 console.log(result);
    				 if(result == 1){
    					 alert("차단해제 되었습니다.");
    					 
    					 location.reload();
    					 
    				 }
    			 },
    			 error : function(){
    				 console.log("통신실패");
    			 }
    		 });
    	 });
    	
    		
        
      function sellDetail(sellNo){
         location.href = "${pageContext.request.contextPath}/sell/sellDetail/"+sellNo;
      }
      
      
      const userNo = "${loginUser.userNo}";
      const userName = "${loginUser.userName}";
      const phone = "${loginUser.phone}";
      const birth = "${loginUser.birth}";
      const email = "${loginUser.email}";
      const chatRoomNo = "${chatRoomNo}";
      const contextPath = "${pageContext.request.contextPath}";
      const regNum = /^[0-9]+$/;
      
      
      
      // /chat이라는 요청주소로 통신할 수 있는 webSocket 객체생성
      let chatSocket = new SockJS(contextPath + "/chat");
      
       function modal(){
          alertify.prompt('재설정할 가격을 입력해주세요', '',''
                   , function(evt, value) { 
                   if(!regNum.test(value)){
                      alertify.error('숫자만 입력해주세요!');
                      return;
                   }
                   alertify.success('success : ' + value);
                   negoStart(value);
                }, 
                  function() {
                   alertify.error('Cancel');
                   }
                );

       };
       
       function negoStart(value){
          $.ajax({
             url : "contextPath/join/nego",
             data : {negoPrice : value,
                   sellNo : ${AllList.get('product').sellNo },
                   chatRoomNo :chatRoomNo},
             type : "post",
             success : function(result){
                if(result == 1){
                   location.reload();
                }
                
             },
             error : function(){
                console.log("통신실패");
             }
          });
       };
      
        
      

      
      (function(){
         const displayChatting = document.getElementsByClassName("display-chatting")[0];
         
         if(displayChatting != null){
            displayChatting.scrollTop =displayChatting.scrollHeight; 
         }
      })();
         

      
      
      function massageEnterSend(){
         console.log( $('#inputChatting').val() );
         sendMessage();
      }
      
      document.getElementById("send").addEventListener("click", sendMessage);
      
      // 채팅을 보내는 함수
      function sendMessage() {
         // 채팅이 입력되는 textarea요소 가져오기
         const inputChatting = document.getElementById("inputChatting");
         
         // 클라이언트가 채팅내용을 입력하지 않은상태로 보내기 버튼을 누른경우
         if(inputChatting.value.trim().length == 0) {
            alert("채팅내용을 입력하고 보내주세요!");
            
            inputChatting.value ="";
            inputChatting.focus();
         } else {
            // 메세지 입력시 필요한 데이터를 js 객체로 생성
            const chatMessage = {
                  "userNo" : userNo,
                  "userName" : userName,
                  "chatRoomNo" : chatRoomNo,
                  "chatContent" : inputChatting.value
            };
            
            console.log(chatMessage);
              console.log(JSON.stringify(chatMessage));
              
              chatSocket.send(JSON.stringify(chatMessage));
              
              inputChatting.value = "";
         }
      }
      
      chatSocket.onmessage = function(e) {
         // 전달 받은 메세지 JS객체로 변환
         const chatMessage = JSON.parse(e.data);
         
         const li = document.createElement("li");
          const p = document.createElement("p");
          const br = document.createElement("br");

          p.classList.add("chat");
          
          p.innerHTML = chatMessage.chatContent;//줄바꿈 처리
          

          //span태그 추가
          const span = document.createElement("span");
          span.classList.add("chatDate");

          span.innerText = getCurrentTime();

          //내가쓴 채팅
          if (chatMessage.userNo == userNo) {
              li.append(p,br,span);
              li.classList.add("myChat"); 
          } else {
             li.append(p,br,span);
          }
          
          // 채팅창
          const displayChatting = document.getElementsByClassName("display-chatting")[0];

          // 채팅창에 채팅 추가
          displayChatting.append(li);

          // 채팅창을 제일밑으로 내리기
          displayChatting.scrollTop = displayChatting.scrollHeight;
          // scrollTop : 스크롤 이동
          // scrollHeight : 스크롤이되는 요소의 전체 높이.
      };
      
      function getCurrentTime() {

          const now = new Date();

          const time = now.getFullYear() + "년 " +
              addZero(now.getMonth() + 1) + "월 " +
              addZero(now.getDate()) + "일 " +
              addZero(now.getHours()) + ":" +
              addZero(now.getMinutes()) + ":" +
              addZero(now.getSeconds()) + " ";

          return time;
      }

      // 10보다 작은수가 매개변수로 들어오는경우 앞에 0을 붙여서 반환해주는함수.
      function addZero(number) {
          return number < 10 ? "0" + number : number;
      }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>