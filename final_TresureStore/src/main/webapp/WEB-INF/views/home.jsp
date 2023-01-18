<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

		<div id="display-list" class="row">
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="display-list" class="row">
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="display-list" class="row">
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="item col-3" style="cursor: pointer">
				<div class="item">
					<div id="itemSolid">
						<img src="resources/resources/image/animal1.gif"
							class="rounded float-start" alt="" style="margin-bottom: 30px;">
						<div class="price-time"
							style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
							<h5>아무나 사세요</h5>
							<p>♥</p>
						</div>
						<div class="price-time">
							<p class="displayPrice">300000원</p>
							<h5 class="displayTime">6일전</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="./common/theBoGi.jsp" />

	<jsp:include page="./common/footer.jsp" />
</body>
</html>
