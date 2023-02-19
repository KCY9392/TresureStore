<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 헤더 js -->
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<link rel="stylesheet" href="/tresure/resources/css/chat/chatBlockList.css">
<title>보물상점</title>
<style>
	.header-text{
		width: 70%;
    	margin : auto auto 20px auto;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<br>

	<div class="main-section-blockList">

		<div class="innerOuter-blockList">
			<div class="header-text">
			<img src="/tresure/resources/images/icon/mainLogo.png" width="30"
				height="30">&nbsp;<span>차단목록</span> 
			<a href="${pageContext.request.contextPath}/chat/chatRoomList">보물톡</a>
			</div>

			<c:choose>
				<%-- 차단 목록이 없을 때	 --%>
				<c:when test="${empty blockList}">
					<div style="text-align: center;">차단한 상점이 없습니다.</div>
				</c:when>

				<c:otherwise>
					<ul class="ulululul">
						<c:forEach var="block" items="${blockList }">
							<li class="block_list">
								<div class="profile-image1" data-seller-no='${block.blockNo}'>
									<c:if test="${block.avg >= 4.5}">
										<img src="/tresure/resources/images/icon/grade3.png"
											height="100%" width="100%" />
									</c:if>
									<c:if test="${ 4 <= block.avg && block.avg < 4.5 }">
										<img src="/tresure/resources/images/icon/grade2.png"
											height="100%" width="100%" />
									</c:if>
									<c:if test="${ 3.5 <= block.avg && block.avg < 4 }">
										<img src="/tresure/resources/images/icon/grade1.png"
											height="100%" width="100%" />
									</c:if>
									<c:if test="${ null == block.avg || block.avg < 3.5 }">
										<img src="/tresure/resources/images/icon/grade0.png"
											height="100%" width="100%" />
									</c:if>
								</div>
								<div data-seller-no='${block.blockNo}'>
									<div class="market-name0">상점 ${block.blockedNo } 호점</div>
								</div>
								<div class="follow-cancel-box">
									<div class="market-name2">
										<button type="button" class="block-clear"
											onclick="deleteBlock();">차단 해제</button>
									</div>
								</div> <script>
											function deleteBlock(){
												$.ajax({
													url : "${pageContext.request.contextPath}/chat/chatBlockremove",
													type : "post",
													data : {
														blockedUserNo : ${block.blockedNo }
													},
													success : function(result){
														if(result == 1){
															alert("차단해제 하였습니다.");
															location.reload();
														}
														
													},
													error : function(){
														console.log("통신실패");
													}
													
												})
											}	
									    </script>
							</li>
						</c:forEach>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>