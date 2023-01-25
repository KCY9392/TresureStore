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
    <title>treasure ChatRoomList</title>

    <style>
        /*전체 공통 div*/
       
        .chat-list-outer{
         	width: 67%;
            margin: auto;
            font-size:18px;
        }

        .innerOuter {
            padding: 15%;
        }

        /*보물톡 text*/
        .innerOuter span {
            font-weight: bold;
            font-size: 40px;
        }

        /*차단목록 a태그*/
        .block-list {
            text-decoration: none;
            color: gold;
            float: right;
        }
         .table{
        	width: 100%;
        } 

        thead {
            color: rgb(248, 212, 12);
            text-align: center;
        }

        tbody {
            text-align: center;
        }
        
        .chat-exit{
        	font-family: 'koverwatch';
        	padding:10%;
        	background-color:gold;
            color:grey;
        	border:none;
        	border-radius : 8%;
        	cursor: pointer;
        }
    </style>


</head>

<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sideBar.jsp" />
    
   
    	<div class="chat-list-outer">
            <div class="innerOuter">
                <img src="/tresure/resources/images/icon/mainLogo.png" width="40">&nbsp;<span>보물톡</span>
                <a class="block-list" href="${pageContext.request.contextPath}/chat/chatBlockList">차단목록</a>

                <c:choose>
                    <%--조회한 채팅 목록이 없을 때	 --%>
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
                                <%--조회한 채팅 목록이 있을 때	 --%>
                                <c:forEach var="chatRoom" items="${chatRoomList }">
                                    <tr id="storeName${chatRoom.chatRoomNo }" class="storeName">
                                        <td>${chatRoom.chatRoomNo }</td>
                                        <td>

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

                                        </td>
                                        <td>${chatRoom.sellTitle}</td>
                                        <c:choose>
                                            <c:when test="${empty chatRoom.chatDate }">
                                                <td>${chatRoom.createDate }</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>
                                                    <fmt:formatDate value="${chatRoom.chatDate }" type="both" pattern="yyyy-MM-dd(E) a HH:mm" />
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td><button type="button" id="chatExit${chatRoom.chatRoomNo }" class="chat-exit">나가기</button></td>
                                    </tr>

                                    <script>
                                        $("#storeName${chatRoom.chatRoomNo }").click(function() {

                                            let form = document.createElement('form');
                                            form.setAttribute('method', 'post');
                                            form.setAttribute('action', '${pageContext.request.contextPath}/chat/chatRoom/${chatRoom.sellNo }/${loginUser.userNo}');
                                            document.charset = 'utf-8';

                                            let hiddenField = document.createElement('input');

                                            hiddenField.setAttribute('type', 'hidden');
                                            hiddenField.setAttribute('name', "sellUserNo");
                                            hiddenField.setAttribute('value', ${chatRoom.userNo});
                                            form.appendChild(hiddenField);

                                            document.body.appendChild(form);
                                            form.submit();
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



</body>

</html>