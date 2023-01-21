<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 보물상점 채팅 </title>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- fontawesome icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" 
		integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" 
		crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 헤더 js -->
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<!-- sockjs  -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style>
      /* ---전체 div --- */
      .main-section{
        box-sizing: border-box;
       	height: 1000px;
        width: 70%;
        margin-left: 20%;
        margin-right: auto;
        padding:1%;
        position: relative;/*기준*/
       
	  }
      /*왼,오 박스 공통 css*/
      .leftBox, .rightBox {
        border: 1px solid darkturquoise;
        width: 50%;
        height: 70%;
        float : left;
        padding : 2%;
      }
      /*오른쪽박스 테두리 삭제예정*/
      .rightBox div{
        border: 1px solid rgb(237, 189, 12);
      }
      
      
      /* --- leftBox --- */
      /* 상품사진 */
      .sell_pic{
        display: inline-block;
        width: 50%;
        height: 50%;
      }
      /*상품 카테고리, 제목, 가격*/
      .sell_detail{
        display: inline;
        width: 45%;
        height:20%;
        float: right;
        margin: 5% 2%;
      }
      /*상품 카테고리, 제목, 가격*/
      .sell_detail > div {
      	margin: 6% 0%;
      }
      
      /* 상품 상세 내용 */
      .sell_content{
        margin: 2% 0%;
      }


      /* --- rightBox --- */
      /* 채팅창 맨 위에 바 */
      .chatting_top_bar{
        height: 10%;
        position: relative;
      }
      
      /* 상점명 이름 */
      .sell_number{
        display: inline;
        margin: 2%;
        font-size: 25px;
        
      }
      
      /* 계좌이체 버튼 */
      .chatting_top_bar button{
        float: right;
        padding: 2.2%;
        background-color: gold;
        color: rgb(102, 96, 96);
        border-radius: 3px;
        border:none;
       	position:absoulte;
  		transform: translateY(20%);
  		cursor: pointer 
      }
      /* 신고차단 a태그 */
      .chatting_top_bar a{
        text-decoration: none;
        color: gold;
        padding : 2%;
    
        position:absoulte;
  		transform: translateX(50%);
      }
      
      
      /* 채팅 대화창 */
      .display-chatting{
        height: 70%;
        list-style : none;
        height : 75%;
        overflow : auto; /*스크롤처럼*/
        padding : 10px 10px;
        background-color: rgb(248, 246, 235);
        z-index: 1;
        positon: absoulte;
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
      }
      
      /*채팅 모든 대화 시간 텍스트*/
      .chatDate{
        font-size:11px;
      }
      
	  /* 채팅창 아래 바 */
      .chatting_bottom_bar{
        height: 10%;
      }
       /*첨부파일 클릭 버튼..?*/
      .chat_plus{
      	width:10%;
      	height:100%;
      	background-color:gold;
      	border:none;
      	float:left;
      	
      }
      /*대화 입력창*/
      #inputChatting{
	    width:70%;
	    height:100%;
	    resize: none;
	    border:none;
	    border-top:solid 1px gold;
	    border-bottom:solid 1px gold;
	    float:left;
	    
   	  }
   	  /*보내기 버튼*/
   	  .chatting_bottom_bar > button{
   	  	float:left;
   	  	height:100%;
   		width:20%;
   	  }
   	  .chatting_bottom_bar > i{
   	  	width:50%;
   	  	border :solid 1px white;
   	  	
   	  }
   	  li{
   	  	list-style : none;
   	  }
      
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	<%-- <jsp:include page="../common/sideBar.jsp"/> --%>
    <br><br>
      
        <div class="main-section">
          <br><br>
          	<!-- 채팅 왼쪽창(상품상세) -->
            <div class="leftBox">
                <div class="sell_pic"> <img src="${AllList.get('product').imgSrc }" width="100%" height="100%"/> </div>
                <div class="sell_detail">
                    <div id="sell_category">${AllList.get('product').categoryName }</div>
                    <div id="sell_title">${AllList.get('product').sellTitle }</div> 
                    <div id="sell_price">${AllList.get('product').price }</div>
                </div>

                <div class="sell_content"> 
                  <span>${AllList.get('product').sellContent }</span>
                </div>
           </div>
			
			
			<!-- 채팅 오른쪽창(구매자와 판매자 대화) -->
            <div class="rightBox" >
            	<!-- 채팅창 맨 위에 바 -->
                <div class="chatting_top_bar">
                    <div class="sell_number">
                    	<img src="https://cdn-icons-png.flaticon.com/128/9317/9317793.png" width="30"/>
                    		&nbsp;상점 ${AllList.get('product').userNo }호점
                    </div>
                    <a href="#">신고</a>
                    <a href="#">차단</a>
                    <button type="submit">계좌이체</button>
                </div>
                
                
 				<!-- 채팅창 대화 -->
                <div class="display-chatting">
                <ul class="zz">
                     <c:forEach items="${list }" var="msg">
                      <fmt:formatDate var="chatDate" value="${msg.createDate }" pattern="yyyy년 MM월 dd일 HH:mm:ss"/> 
                      <!-- 1) 내가 보낸 메세지 -->
                       <c:if test="${msg.userNo == loginUser.userNo }"> 
                        <li class="myChat">
                            <p class="chat">${msg.message }ㅋ</p>
                            <span class="chatDate">${chatDate }</span>
                        </li>         
                       </c:if>           
                      
                      <!-- 2) 상대가 보낸 메세지 -->
                      <c:if test="${msg.userNo != loginUser.userNo }"> 
                        <li>
                            <p class="chat">${msg.message }</p>
                            <span class="chatDate">${chatDate }</span>
                        </li>
                      </c:if>            
                  </c:forEach>
                  </ul>
                </div>
                

				<!-- 채팅창 맨 아래 바 -->
                <div class="chatting_bottom_bar">
                	<div class="chat_plus"></div>
					<textarea id="inputChatting"></textarea>
					<button id="send" class="btn btn-outline-warning" onkeypress="if(event.keyCode == 13 {massageEnterSend();})">보내기</button>
                </div>
             
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>

		<script>
			const userNo = "${loginUser.userNo}";
			const userName = "${loginUser.userName}";
			const phone = "${loginUser.phone}";
			const birth = "${loginUser.birth}";
			const email = "${loginUser.email}";
			const chatRoomNo = "${chatRoomNo}";
			const contextPath = "${pageContext.request.contextPath}";
		
			(function(){
				const displayChatting = document.getElementsByClassName("display-chatting")[0];
				
				if(displayChatting != null){
					displayChatting.scrollTop =displayChatting.scrollHeight; 
				}
			})();
				
			// /chat이라는 요청주소로 통신할 수 있는 webSocket 객체생성
			let chatSocket = new SockJS(contextPath + "/chat");
			
			
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

			    p.classList.add("chat");
			    
			    p.innerHTML = chatMessage.chatContent.replace(/\\n/gm , "<br>" );//줄바꿈 처리
			    

			    //span태그 추가
			    const span = document.createElement("span");
			    span.classList.add("chatDate");

			    span.innerText = getCurrentTime();

			    //내가쓴 채팅
			    if (chatMessage.userNo == userNo) {
			        li.append(span, p);
			        li.classList.add("myChat"); 
			    } else {
			        li.innerHTML = "<b>" + chatMessage.userNo + "</b><br>";
			        li.append(p, span);
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
</body>
</html>
































