<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 헤더 js -->
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<link rel="stylesheet" href="/tresure/resources/css/chat/chatBlockList.css">
<title>TreasureStore chatBlockList</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>
    <br><br>
    
      <div class="main-section-blockList">
            <div class="innerOuter-blockList">
              <img src="/tresure/resources/images/icon/mainLogo.png" width="30" height="30">&nbsp;<span>차단목록</span>
                  <a href="${pageContext.request.contextPath}/chat/chatRoomList" >보물톡</a>
                  
                  <c:choose>
	                    <%-- 차단 목록이 없을 때	 --%>
	                    <c:when test="${empty blockList}">
	                        <div style="text-align: center;">차단한 상점이 없습니다. </div>
	                    </c:when>
	                    
	                    <c:otherwise>
		                <table class="chatBlockList-table">
		                  <thead class="chatBlockList-thead">
		                    <tr>
		                      <th></th>
		                      <th>상점명</th>
		                      <th></th>
		                    </tr>
		                  </thead>
		                  <tbody class="chatBlockList-tbody">
					          <c:forEach var="block" items="${blockList }">
			                    <tr>
			                      <td>${block.blockNo}</td>
		                      		<td>
		                                  <c:if test="${block.avg > 4.5}">
		                                      <img src="/tresure/resources/images/icon/grade3.png" width="20px" /> &nbsp;&nbsp;상점 ${block.blockedNo }호 점
		                                  </c:if>
		                                  <c:if test="${ 4 <= block.avg && block.avg < 4.5 }">
		                                      <img src="/tresure/resources/images/icon/grade2.png" width="20px" /> &nbsp;&nbsp;상점 ${block.blockedNo }호 점
		                                  </c:if>
		                                  <c:if test="${ 3.5 <= block.avg && block.avg < 4 }">
		                                      <img src="/tresure/resources/images/icon/grade1.png" width="20px" /> &nbsp;&nbsp;상점 ${block.blockedNo }호 점
		                                  </c:if>
		                                  <c:if test="${ null == block.avg || block.avg < 3.5 }">
		                                      <img src="/tresure/resources/images/icon/grade0.png" width="20px" /> &nbsp;&nbsp;상점 ${block.blockedNo }호 점
		                                  </c:if>
                              		</td>                      
			                      <td><button type="button" class="block-clear" id="deleteBlock">해제</button></td>
			                    </tr>
					          </c:forEach>
		                  </tbody>
		                </table>
              	 	</c:otherwise>
              </c:choose>
                
            </div>
          </div>
        
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>