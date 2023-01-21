<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
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
		    width: 970px;
		    padding-top: 80px;
		    padding-right: 5%;
		    margin: auto;
		}
		
		.slist-items{
			margin:auto;
			height:90%;
		}
		
		.main-Title{
			font-size:30px;
			
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
			<p class="main-Title" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>오늘의 추천상품♡</b></p>
			<hr style="width:930px; color:rgb(238, 238, 240);">
			<br>
		</div>
		<div id="display-list" class="row" style="flex-wrap: wrap;">
	  <c:forEach var="s" items="${sellList}" begin="0" end="${fn:length(sellList)}" step="1" varStatus="status">
						<div class="item col-3" style="cursor: pointer; height: 300px;
													    width: 200px !important;
													    padding: 0px 20px !important;">
							<div class="item" onclick="sellDetail(${s.sellNo})">
								<div id="itemSolid" class="slist-items" style="border: 1px solid rgb(238, 238, 238)">
									<c:if test="${s.imgSrc != null}">
									<img src="${s.imgSrc}" width="100%" height="150px;"
										class="rounded float-start" alt="" style="">
									</c:if>
									<c:if test="${s.imgSrc == null}">
									
									</c:if>
									<div class="price-time"
										style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
										<h4 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">&nbsp;${s.sellTitle}</h4>
										<p>&nbsp;♥ &nbsp;${s.heartNum}</p>
									</div>
									<div class="price-time">
										<p class="displayPrice">&nbsp;${s.price}원</p>
										<h5 class="displayTime">&nbsp;${s.getTimeago()}</h5>
									</div>
								</div>
							</div>
						</div>
		 </c:forEach> 
		 </div>
	
	</div>
	
	<script>
		function sellDetail(sellNo){
			location.href = "${pageContext.request.contextPath}/sell/sellDetail/"+sellNo;
		}
	</script>
	
	<jsp:include page="./common/theBoGi.jsp" />

	<jsp:include page="./common/footer.jsp" />
</body>
</html>
