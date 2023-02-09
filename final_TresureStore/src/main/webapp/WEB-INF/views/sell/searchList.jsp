<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/tresure/resources/css/sell/searchList.css">
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
	
	<link rel="stylesheet" href="https://naver.github.io/billboard.js/release/latest/dist/theme/datalab.min.css">
  <script src="https://naver.github.io/billboard.js/release/latest/dist/billboard.pkgd.min.js"></script>
</head>

   

<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>
	
	<c:if test="${not empty alertMsg }">
			<script>
				alertify.alert("경고",'${alertMsg}');// 변수를 문자열로
			</script>
			<c:remove var="alertMsg" scope="session"/>
	</c:if>

	<div class="main-section">
		<div class="price-inquiry">
		
			<div id="lineChart"></div>
			<div class="titleAndPrice-inq">
			<img src="/tresure/resources/images/icon/inyong1.png" width="20px" height="20px" style="padding-bottom:10px;">
			${m.keyword}
			<img src="/tresure/resources/images/icon/inyong2.png" width="20px" height="20px" style="padding-bottom:10px;"> 의  시세는 
			<br><br>
			${m.price}원 입니다.
			</div>
		</div>
		<br><br>
		
		<div class="searchresultBox" style="display:flex;"><p>${m.keyword}</p>의 검색결과</div>
		<hr style="width: 1000; background: #e4e0e1;  height: 1px;  border: 0;">
		
		<div id="display-list" class="row" style="padding-top: 50px;">
	  <c:forEach var="s" items="${m.s}" begin="0" end="${fn:length(m.s)}" step="1" varStatus="status">
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
	
	<script>
	
	
	
	var chart = bb.generate({
	  data: {
	    columns: [
		["price",${m.success[0].getPrice()},${m.success[1].getPrice()},${m.success[2].getPrice()},${m.success[3].getPrice()},${m.success[4].getPrice()}]
	    ],
	    type: "line",
	  },
	  bindto: "#lineChart"
	});

	(function() {
		chart.load({
			columns: [
				["price",${m.success[0]},${m.success[1]},${m.success[2]},${m.success[3]},${m.success[4]}]
			]
		});
	});
</script>

<script>
$(document).ready(function() {
	var keyword = "${m.keyword}"; 
	
	if(keyword != "") {  //검색어 부분 유지하기
		$("#search").val( keyword );
	}
});
</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>