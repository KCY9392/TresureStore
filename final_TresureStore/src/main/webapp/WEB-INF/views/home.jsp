<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/tresure/resources/css/font.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
	 <!-- alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertify css -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
   <!-- Default theme -->
   <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
   <!-- Semantic UI theme -->
   <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	
	<style>
		.main-section{
		    width: 900px;
		    padding-top: 80px;
		    padding-right: 5%;
		    margin: auto;
		}
	</style>
</head>
<body>
	<jsp:include page="./common/header.jsp"/>
	<jsp:include page="./common/sideBar.jsp"/>
	
	<c:if test="${not empty alertMsg }">
			<script>
				alertify.alert("경고",'${alertMsg}');// 변수를 문자열로
			</script>
			<c:remove var="alertMsg" scope="session"/>
	</c:if>

	<div class="main-section">
		<div id="displayHeader">
			<p class="displayName">오늘의 추천상품♡</p>
		</div>

	  <c:forEach var="s" items="${sellList}" begin="0" end="${fn:length(sellList)}" step="1" varStatus="status">
		  <c:if test="${status.index % 5 == 0}">	
			<div id="display-list" class="row">
	  	  </c:if>
<%-- 				 <c:forEach var="j" begin="i" end="i+3" step="1"> --%>
						<div class="item col-3" style="cursor: pointer">
							<div class="item">
								<div id="itemSolid">
									<c:if test="${s.imgSrc != null}">
									<img src="${s.imgSrc}" width="10px" height="10px"
										class="rounded float-start" alt="" style="margin-bottom: 30px;">
									</c:if>
									<c:if test="${s.imgSrc == null}">
									
									</c:if>
									<div class="price-time"
										style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
										<h5>${s.sellTitle}</h5>
										<p>♥ &nbsp;${s.heartNum}</p>
									</div>
									<div class="price-time">
										<p class="displayPrice">${s.price}원</p>
										<h5 class="displayTime">${s.getTimeago()}</h5>
									</div>
								</div>
							</div>
						</div>
<%-- 				   </c:forEach> --%>
			<c:if test="${status.index % 5 == 0}">
			  	</div>
			</c:if>
		 </c:forEach> 
	
	</div>
	
	<jsp:include page="./common/theBoGi.jsp" />

	<jsp:include page="./common/footer.jsp" />
</body>
</html>
