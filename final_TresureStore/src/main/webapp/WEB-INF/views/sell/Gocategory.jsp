<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
	<link rel="stylesheet" href="/tresure/resources/css/common/home.css">
	<link rel="stylesheet" href="/tresure/resources/css/common/Gocategory.css">
	
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
	
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>
	
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
			<p class="cate_main-Title" style="font-size:20px;"><img src="https://m.bunjang.co.kr/pc-static/resource/f1f8a93028f0f6305a87.png" width="20px" height="20px">&nbsp;&nbsp;&nbsp;카테고리&nbsp;
			<img class="" src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png" width="15px" height="15px">&nbsp;
		    <c:if test="${categoryCode == 1}">
			인기매물</c:if>
			<c:if test="${categoryCode != 1}">
			 ${s[0].categoryName}</c:if>
			<a href="${pageContext.request.contextPath}/sell/category/${categoryCode}/recent" style="padding-left: 600px;">최신순</a>
            <a href="${pageContext.request.contextPath}/sell/category/${categoryCode}/popular" >인기순</a>
            <a href="${pageContext.request.contextPath}/sell/category/${categoryCode}/lowest" >저가순</a>
            <a href="${pageContext.request.contextPath}/sell/category/${categoryCode}/high" >고가순</a>
			</p>
			<hr>
			<br>
		</div>
		
		<div id="display-list" class="row">
	  <c:forEach var="s" items="${s}" begin="0" end="${fn:length(s)}" step="1" varStatus="status">
						<div class="item col-3">
							<div class="item" onclick="sellDetail(${s.sellNo})">
								<div id="itemSolid" class="slist-items">
									<c:if test="${s.imgSrc != null}">
										<c:if test="${s.crawl.equals('Y')}">
											<img src="${s.imgSrc}" width="100%" height="150px;"
											class="rounded float-start" alt="">
										</c:if>
										<c:if test="${s.crawl.equals('N')}">
										<img src="${pageContext.request.contextPath}${s.imgSrc}" width="100%" height="150px;"
											class="rounded float-start" alt="">
										</c:if>
									</c:if>
									<c:if test="${s.imgSrc == null}">
									
									</c:if>
									<div class="price-time">
										<span>&nbsp;${s.sellTitle}</span><br><br>
									 	<div class="price-time2">
									 		<br>
											&nbsp;<img src="/tresure/resources/images/icon/heart.png" width="15px" height="15px" style="margin-top:2px;">&nbsp;${s.heartNum}
											&nbsp;&nbsp;&nbsp;${s.timeago}
									 		<br>
											<span style="font-size: 33px; color:black;">${s.price}원</span>
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
	
	<jsp:include page="../common/theBoGi.jsp" />

	<jsp:include page="../common/footer.jsp" />
</body>
</html>
