<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- 헤더 js -->
    <script type="text/javascript" src="/tresure/resources/js/header.js"></script>
    <!-- 해당페이지 Js -->
     <script type="text/javascript" src="/tresure/resources/js/chatRoomList.js"></script>
    <!-- Alert 창  -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- alertify -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <!-- alertify css -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <title>보물상점</title>
    <!-- css 링크 -->
    <link rel="stylesheet" href="/tresure/resources/css/chat/chatRoomList.css">    
</head>

<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sideBar.jsp" />
    
   
       <div class="main-section">
            <div class="innerOuter">
                <img src="/tresure/resources/images/icon/mainLogo.png" width="40" style="margin-left: 20px;">&nbsp;<span>보물톡</span>
                <a class="block-list" onclick="methodPost();">차단목록</a>

                <c:choose>
                    <%--조회한 채팅 목록이 없을 때    --%>
                    <c:when test="${empty chatRoomList}">
                        <div style="text-align: center;">새로운 채팅을 시작해주세요 </div>
                    </c:when>

                    <c:otherwise>
                        <br><br>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>상점명</th>
                                    <th>판매명</th>
                                    <th>채팅 시간</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%--조회한 채팅 목록이 있을 때    --%>
                                <c:forEach var="chatRoom" items="${chatRoomList }">
                                    <tr  class="storeName" >
                                        <td class="storeName${chatRoom.chatRoomNo } list">${chatRoom.chatRoomNo }</td>
                                        <td class="storeName${chatRoom.chatRoomNo } list">
                                           <!-- 로그인사람과 구매한사람이 같은경우  -->
                                           <c:if test="${chatRoom.userNo eq loginUser.userNo}">
                                               <c:if test="${chatRoom.avg > 4.5}">
                                                   <img src="/tresure/resources/images/icon/grade3.png" width="20px" /> &nbsp;&nbsp;상점 ${chatRoom.sellUserNo }호 점
                                               </c:if>
                                               <c:if test="${ 4 <= chatRoom.avg && chatRoom.avg < 4.5 }">
                                                   <img src="/tresure/resources/images/icon/grade2.png" width="20px" /> &nbsp;&nbsp;상점 ${chatRoom.sellUserNo }호 점
                                               </c:if>
                                               <c:if test="${ 3.5 <= chatRoom.avg && chatRoom.avg < 4 }">
                                                   <img src="/tresure/resources/images/icon/grade1.png" width="20px" /> &nbsp;&nbsp;상점 ${chatRoom.sellUserNo }호 점
                                               </c:if>
                                               <c:if test="${ null == chatRoom.avg || chatRoom.avg < 3.5 }">
                                                   <img src="/tresure/resources/images/icon/grade0.png" width="20px" /> &nbsp;&nbsp;상점 ${chatRoom.sellUserNo }호 점
                                               </c:if>
                                            </c:if>
                                            <!-- 로그인한 사람과 판매하는 사람이 같은경우 -->
                                            <c:if test="${chatRoom.sellUserNo eq loginUser.userNo}">
                                               <c:if test="${chatRoom.purchaseUserAvg >= 4.5}">
                                                   <img src="/tresure/resources/images/icon/grade3.png" width="20px" /> &nbsp;&nbsp;상점 ${chatRoom.userNo }호 점
                                               </c:if>
                                               <c:if test="${ 4 <= chatRoom.purchaseUserAvg && chatRoom.purchaseUserAvg < 4.5 }">
                                                   <img src="/tresure/resources/images/icon/grade2.png" width="20px" /> &nbsp;&nbsp;상점 ${chatRoom.userNo }호 점
                                               </c:if>
                                               <c:if test="${ 3.5 <= chatRoom.purchaseUserAvg && chatRoom.purchaseUserAvg < 4 }">
                                                   <img src="/tresure/resources/images/icon/grade1.png" width="20px" /> &nbsp;&nbsp;상점 ${chatRoom.userNo }호 점
                                               </c:if>
                                               <c:if test="${ null == chatRoom.purchaseUserAvg || chatRoom.purchaseUserAvg < 3.5 }">
                                                   <img src="/tresure/resources/images/icon/grade0.png" width="20px" /> &nbsp;&nbsp;상점 ${chatRoom.userNo }호 점
                                               </c:if>
                                            </c:if>

                                        </td>
                                        <td class="storeName${chatRoom.chatRoomNo } list">${chatRoom.sellTitle}</td>
                                        <c:choose>
                                            <c:when test="${empty chatRoom.chatDate }">
                                                <td>${chatRoom.createDate }</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="storeName${chatRoom.chatRoomNo } list">
                                                    <fmt:formatDate value="${chatRoom.chatDate }" type="both" pattern="yyyy-MM-dd(E) a HH:mm" />
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td style="padding : 0px;"><button type="button" id="chatExit${chatRoom.chatRoomNo }" class="chat-exit">나가기</button></td>
                                    </tr>

                                    <script>
                                        $(".storeName${chatRoom.chatRoomNo }").click(function() {
                                           
                                           

                                            let form = document.createElement('form');
                                            form.setAttribute('method', 'post');
                                            form.setAttribute('action', '${pageContext.request.contextPath}/chat/chatRoom/${chatRoom.sellNo }/${loginUser.userNo}');
                                            document.charset = 'utf-8';

                                            let hiddenField = document.createElement('input');

                                            hiddenField.setAttribute('type', 'hidden');
                                            hiddenField.setAttribute('name', "sellUserNo");
                                            hiddenField.setAttribute('value', ${chatRoom.sellUserNo });
                                            
                    

                                            
                                            let hiddenField2 = document.createElement('input');

                                            hiddenField2.setAttribute('type', 'hidden');
                                            hiddenField2.setAttribute('name', "chatRoomNo");
                                            hiddenField2.setAttribute('value', ${chatRoom.chatRoomNo });
                                            
                                            form.appendChild(hiddenField);
                                            form.appendChild(hiddenField2);

                                            document.body.appendChild(form);
                                            form.submit();
                                        });
                                        
                                        
                                        $("#chatExit${chatRoom.chatRoomNo }").click(function() {

                                        	
                               	            function reload(){
                            	            	location.reload();
                            	            }
                                        	
                                        	$.ajax({
                                        		url : "${pageContext.request.contextPath}/chat/chatRoom/exit",
                                        		data : { userNo :  ${loginUser.userNo},
                                        			     chatRoomNo : ${chatRoom.chatRoomNo }
                                        		},
                                        		type : "post",
                                        		success : function(result){
                                        			if(result > 0){
                                        	            Swal.fire({
                                        	                   icon: 'success',
                                        	                   title: '성공적으로 채팅방을 나갔습니다.'                  
                                        	               });
                                        	            setTimeout(function() {
                                        	            	  location.reload();
                                        	            	}, 1000);
                                        	            
                                        	   //             alertify.alert("경고",'${alertMsg}');// 변수를 문자열로
                                        			} else {
                                        				alert("실패");
                                        			}
                                        			
                                        		},
                                        		error : function(){
                                        			console.log("통신실패");
                                        		}
                                        		
                                        	})

                                        });
                                    </script>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
           </div>
           </div>
   
    <jsp:include page="../common/footer.jsp" />
	<script>
		function methodPost() {
			let form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', '${pageContext.request.contextPath}/chat/chatBlockList');
			document.body.appendChild(form);
			form.submit();
			
		}
	</script>


</body>

</html>