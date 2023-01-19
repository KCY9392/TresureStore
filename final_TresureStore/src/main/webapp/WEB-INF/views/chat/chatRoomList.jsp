<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- fontawesome icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- 헤더 js -->
    <script type="text/javascript" src="/tresure/resources/js/header.js"></script>
    <title>treasure ChatRoomList</title>

    <style>
        /*전체 공통 div*/
        .main-section {
            box-sizing: border-box;
            width: 65%;
            margin: auto;
        }

        .innerOuter {
            padding: 5% 10%;
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

        thead {
            color: rgb(248, 212, 12);
            text-align: center;
        }

        tbody {
            text-align: center;
        }
    </style>


</head>

<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sideBar.jsp" />
    <br><br>
    <div class="main-section">
        <div class="p-3 m-0 border-0 bd-example ">
            <br><br>
            <div class="innerOuter">
                <img src="https://cdn-icons-png.flaticon.com/128/5545/5545823.png" width="40">&nbsp;<span>보물톡</span>
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
                            <tbody class="table-group-divider">
                                <%--조회한 채팅 목록이 있을 때	 --%>
                                <c:forEach var="chatRoom" items="${chatRoomList }">
                                    <tr id="storeName${chatRoom.chatRoomNo }" class="storeName">
                                        <td>${chatRoom.chatRoomNo }</td>
                                        <td>

                                            <c:if test="${chatRoom.avg > 4.5}">
                                                <img src="/tresure/resources/images/icon/grade3.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점
                                            </c:if>
                                            <c:if test="${ 4 <= chatRoom.avg && chatRoom.avg < 4.5 }">
                                                <img src="/tresure/resources/images/icon/grade2.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점
                                            </c:if>
                                            <c:if test="${ 3.5 <= chatRoom.avg && chatRoom.avg < 4 }">
                                                <img src="/tresure/resources/images/icon/grade1.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점
                                            </c:if>
                                            <c:if test="${ 0 < chatRoom.avg  && chatRoom.avg < 3.5 }">
                                                <img src="/tresure/resources/images/icon/grade0.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점
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
                                        <td><button type="button" class="btn btn-outline-warning btn-sm">나가기</button></td>
                                    </tr>

                                    <script>
                                        $("#storeName${chatRoom.chatRoomNo }").click(function() {

                                            let form = document.createElement('form');
                                            form.setAttribute('method', 'post');
                                            form.setAttribute('action', '${pageContext.request.contextPath}/chat/chatRoom/${chatRoom.chatRoomNo }');
                                            document.charset = 'utf-8';

                                            let hiddenField = document.createElement('input');

                                            hiddenField.setAttribute('type', 'hidden');
                                            hiddenField.setAttribute('name', "userNo");
                                            hiddenField.setAttribute('value', ${loginUser.userNo});
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
    </div>
    <jsp:include page="../common/footer.jsp" />



</body>

</html>