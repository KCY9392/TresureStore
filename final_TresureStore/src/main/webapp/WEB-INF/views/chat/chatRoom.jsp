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
	 <!-- alertify -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- alertify css -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
   	<!-- Default theme -->
   	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
   	<!-- Semantic UI theme -->
   	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	
	


    <style>
        /* ---전체 div --- */
        .main-section{
            margin-top: 80px;
        }
        .inner-section{
            box-sizing: border-box;
            height: 1000px;
            width: 80%;
            margin : auto;
            padding:1%;
            position: static;/*기준*/

        }

        /*왼,오 박스 공통 css*/
        .main-section .leftBox, .main-section .rightBox {
            float : left;
            width: 45%;
            margin-right: 3%;
        }

        /* 왼쪽 박스 */
        .sell_pic{
            width: 59%;
            height: 400px;
            float: left;
        }
        .sell_detail{
            width: 38%;

            float: right;
            height: 400px;
        }
        .sell_detail .sell_category{
            margin-left: 10%;
            margin-top: 13%;
            color: #666;
            font-size: 1.1em;
        }
        .sell_detail .sell_title,
        .sell_detail .sell_price{
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: 1px 1px lightgray;

        }
        .sell_detail .sell_title{

            font-size: 1.4em;
            width: 90%;
            margin: 10% auto;
            font-weight: 600;
            overflow: hidden;
            white-space: normal;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            word-break: keep-all;
            padding : 3%;
            cursor : pointer;
            
        }
        .sell_detail .sell_price{
            width: 90%;
            margin: 10% auto;
            font-size: 2em;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            word-break: break-all;

        }
        .mark{
            color: rgb(249, 115, 57);
            text-decoration: underline;
        }
        .btn-area{
            width: 70%;
            margin: auto;
        }
        .negoBtn{
            width: 100%;
            color: #000;
            background-color: gold;
            border: none;
            border-radius: 5px;
            height: 30px;
            font-weight: 600;
            cursor: pointer;

            box-shadow: 1px 1px rgb(255, 205, 113);
        }
        .negoBtn2{
            width: 100%;
            color: #000;
            background-color: grey;
            border: none;
            border-radius: 5px;
            height: 30px;
            font-weight: 600;

        }
        .negoBtn:hover{
            color: white;
            background-color: orange;
        }

        .sell_content{
            float: left;
            margin: auto;
            padding: 5%;
            border-radius: 10px;
            box-shadow: 1px 1px lightgray;
            font-weight: 600;
            font-size: 1.1em;
        }



        /* 오른쪽 박스 */
        .rightBox .box{
            position: relative;
            width: 100%;
            height: 900px;
            background: rgb(107, 107, 107);
            border-radius: 50px;
        }
        .inner{
            position: absolute;
            inset: 3px;
            background: url();  /* 배경화면 */
            background-size: cover;
            background-position: center;
            border-radius: 48px;
            border: 10px solid #000;
            display: flex;
            justify-content: center;
            background-color: white;
        }
        /* 채팅방 헤더 */
        .box-header{
            position: relative;
            width: 90%;
            margin: auto;
            height: 10%;
            overflow: hidden;
        }
        .box-header .chatmenubar{
            width: 100%;
            height: 100%;
            padding-top:10px;
        }
        .store-text{
            font-size: 1.3em;
            font-weight: 600;
        }
        .header-list{
            list-style: none;
            
        }
        .header-list li{
             float: left;
             margin-right: 3%;
        }
        .buttonCss{
            text-decoration: none;
            color: gold;
            font-size: 1.2em;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
            border-radius: 15px;
            margin-top:10px;
        }
        .buttonCss:hover{
            color: black;
            background-color: gold;
        }
        .buttonCss2{
            border: none;
            padding: 15px;
            margin-top: 10px;
            background-color: gold;
            font-weight: 600;
            border-radius: 10px;
        }
        .buttonCss2:hover{
            background-color: orange;
            cursor: pointer;
            color: white;
        }

        /* 채팅방 내용 */
        .box-body{
            position: relative;
            width: 90%;
            margin: auto;
            height: 80%;
            margin-bottom: 2%;
        }


        /* 채팅방 바텀  */
        .box-footer{
            position: relative;
            overflow: hidden;
            width: 90%;
            margin: auto;
            height: 10%;
        }
        .footer-area{
            width: 100%;
            height: 60%;
            
        }
        .messageInput-area{
            width: 71%;
            height: 70%;
            resize: none;
            font-size: 1.3em;
            border: none;
            background-color: rgb(243, 243, 243);
            border-bottom-left-radius: 20px;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
            line-height: 2em;
            padding-left: 20px;
            float: left;
            margin-right: 1%;
        }
        .messageInput-area:valid,
        .messageInput-area:focus{
            border: none;
            outline: none;
        }

        .float-left{
            float: left;
        }
        .pricture{
            margin-right: 1%;
            cursor: pointer;
        }
        .MessageSubmitBtn{
            border: none;
            padding: 10px;
            background-color: gold;
            font-weight: 600;
            border-radius: 10px;
            cursor : pointer;
        }

        
        .rightBox .btn{
            position: absolute;
            top: 110px;
            left: -2px;
            width: 3px;
            height: 26px;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
            background: radial-gradient(#ccc, #666, #222);

        }
        .rightBox .btn.btn2{
            top :160px;
            height: 40px;
        }
        .rightBox .btn.btn3{
            top :220px;
            height: 40px;
        }
        .rightBox .rightSideBtn{
            position: absolute;
            top: 170px;
            right: -2px;
            width: 3px;
            height: 70px;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
            background: radial-gradient(#ccc, #666, #222);
        }
        ul{
            padding-inline-start: 10px;
        }
        p{
            margin:6px;
        }

        /* 채팅 대화창 */
        .display-chatting-area{
            height: 96%;
            list-style : none;
            overflow : auto; /*스크롤처럼*/
            padding : 5px 5px;
            background-color: rgb(248, 246, 235);
            position: absoulte;
        }
        .display-chatting{
            list-style:none;
        }
            
        /* 구매자 판매자 모든 대화바 */
        .chat{
            display: inline-block;
            border-radius: 5px;
            padding : 5px;
            background-color: rgb(102, 96, 96);
            color:whitesmoke;
        }
            
        /*내 대화바*/
        .myChat{
            text-align: right;
        }
        /*내 대화바*/
        .myChat > p{
            background-color: rgb(248, 212, 5);
            color: black;
        }
        .chatDate{
		    font-size:12px;
            color: darkgrey;
            padding: 5px 5px;
	    }

    </style>
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
                                <li><img src="https://cdn-icons-png.flaticon.com/128/9317/9317793.png" width="40"/>
                                    <!-- &nbsp;상점 ${AllList.get('product').userNo }호점 -->
                                    <span class="store-text">상점 ${AllList.get('product').userNo }호점</span>
                                </li>

                                <li><br>
                                    <a href="" class="buttonCss">신고</a>
                                </li>
                                <li><br>
                                    <a href="" class="buttonCss">차단</a>
                                </li>
                                <li style="float: right;">
                                    <button class="buttonCss2">계좌이체</button>
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
                            <input class="messageInput-area" id="inputChatting" placeholder="메세지를 입력하세요!" onkeypress="if(event.keyCode == 13) {massageEnterSend();}"/>
                            <button class="float-left MessageSubmitBtn" id="send" type="button" >보내기</button>
                        </div>
                        
                    </div>
                </div>

            </div><!-- rightBox 끝 -->
        </div>
    </div><!-- main-section 끝 -->
    <jsp:include page="../common/footer.jsp"/>


   
     <script>
     
     	
     
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
	    		url : "${pageContext.request.contextPath}/join/nego",
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