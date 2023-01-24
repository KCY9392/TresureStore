<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
	<link rel="stylesheet" href="/tresure/resources/css/common/home.css">
	
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
	
	<!-- Alert 창  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
</head>
<body>
	<jsp:include page="./common/header.jsp"/>
	<jsp:include page="./common/sideBar.jsp"/>
	
	<c:if test="${not empty alertMsg }">
		<c:if test="${loginUser == null }">
			<script>
			Swal.fire({
                icon: 'error',
                title: '${alertMsg}'                  
            });		
// 				alertify.alert("경고",'${alertMsg}');// 변수를 문자열로
			</script>
		</c:if>
		
		<c:if test="${loginUser != null }">
			<script>
				Swal.fire({
	                icon: 'success',
	                title: '${alertMsg}'                  
	            });		
	// 				alertify.alert("경고",'${alertMsg}');// 변수를 문자열로
			</script>
		</c:if>
			<c:remove var="alertMsg" scope="session"/>
	</c:if>

	<div class="main-section">
		<div id="displayHeader">
			<p class="main-Title" ><b>오늘의 추천상품♡</b></p>
			<hr>
			<br>
		</div>
		<div id="display-list" class="row">
	  <c:forEach var="s" items="${sellList}" begin="0" end="${fn:length(sellList)}" step="1" varStatus="status">
						<div class="item col-3">
							<div class="item" onclick="sellDetail(${s.sellNo})">
								<div id="itemSolid" class="slist-items">
									<c:if test="${s.imgSrc != null}">
									<img src="${s.imgSrc}" width="100%" height="150px;"
										class="rounded float-start" alt="">
									</c:if>
									<c:if test="${s.imgSrc == null}">
									
									</c:if>
									<div class="price-time">
										&nbsp;${s.sellTitle}
									 	<div class="price-time2" style="text-align:right; position: absolute;">
									 		<br>
											${s.price}원
											<br>
											
											&nbsp;♥ &nbsp;${s.heartNum}
											&nbsp;${s.getTimeago()}분전
										</div>
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
