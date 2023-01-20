<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 헤더 js -->
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<title>TreasureStore chatBlockList</title>
<style>
   /*전체 공통 div*/
  .main-section{
      box-sizing: border-box;
      width: 65%;
      margin: auto;
  }
   /*차단목록 text*/
   .innerOuter span{
        font-weight: bold;
        font-size: 30px;
   }
   /*보물톡 a태그*/
   .innerOuter a {
        text-decoration: none;
        color:gold;
        float: right;
   }
   thead{
        color: rgb(248, 212, 12);
        text-align:center;
   }
   tbody{
        text-align: center;
        vertical-align: bottom; /* 안 먹힘.. 왜지..?*/
   }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>
    <br><br>
    
      <div class="main-section">
      	<div class="p-3 m-0 border-0 bd-example">
          <br><br>
            <div class="innerOuter" style="padding : 5% 10%;">
              <img src="/tresure/resources/images/icon/mainLogo.png" width="30" height="30">&nbsp;<span>차단목록</span>
                  <a href="${pageContext.request.contextPath}/chat/chatRoomList" >보물톡</a>
                  
                  <c:choose>
	                    <%-- 차단 목록이 없을 때	 --%>
	                    <c:when test="${empty blockList}">
	                        <div style="text-align: center;">차단한 상점이 없습니다. </div>
	                    </c:when>
	                    
	                    <c:otherwise>
		                <table class="table">
		                  <thead>
		                    <tr>
		                      <th></th>
		                      <th>상점명</th>
		                      <th></th>
		                    </tr>
		                  </thead>
		                  <tbody class="table-group-divider">
			                  <c:forEach var="block" items="${blockList }">
			                    <tr>
			                      <td></td>
			                      <td>
	                                  <c:if test="${block.avg > 4.5}">
	                                      <img src="/tresure/resources/images/icon/grade3.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점
	                                  </c:if>
	                                  <c:if test="${ 4 <= block.avg && block.avg < 4.5 }">
	                                      <img src="/tresure/resources/images/icon/grade2.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점
	                                  </c:if>
	                                  <c:if test="${ 3.5 <= block.avg && block.avg < 4 }">
	                                      <img src="/tresure/resources/images/icon/grade1.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점
	                                  </c:if>
	                                  <c:if test="${ 0 < block.avg  && block.avg < 3.5 }">
	                                      <img src="/tresure/resources/images/icon/grade0.png" width="20px" /> &nbsp;&nbsp;상점${chatRoom.userNo }호 점
	                                  </c:if>
	                              </td>                      
			                      <td><button type="button" class="btn btn-outline-warning btn-sm">해제</button></td>
			                    </tr>
			                  </c:forEach>
		                  </tbody>
		                </table>
              	 	</c:otherwise>
              </c:choose>
                
              </div>
            </div>
        </div>
        
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>