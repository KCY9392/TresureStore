<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/tresure/resources/css/sideBar.css">
<title>Insert title here</title>
</head>
<body>
	<div class="navBar">
		<!--찜 하트 수-->
		<div class="favorites">
			<div class="favoritesText">찜한상품</div>
			<div class="favoritesCount">
				<p id="toFavorites" class="toFavorites">
					<i class="fas fa-heart"><img
						src="resources/resources/image/heart2.png" width="20">100</i>
				</p>
			</div>
			<!-- favoritesCount -->
		</div>
		<!--찜 끝-->

		<!-- 최근 본 상품 시작 -->
		<div class="recently">
			<div class="recentlyText">최근본상품</div>
			<div class="recentlyProduct">
				<span id="recentlyCnt"></span>
				<div id="recentlyArea">
					<a id="recentlyList"> <!-- 최근본상품  --> <img
						src="resources/resources/image/animal1.gif" class="recentlyImage"><br>
						<img src="resources/resources/image/animal1.gif"
						class="recentlyImage"><br> <img
						src="resources/resources/image/animal1.gif" class="recentlyImage">
					</a>
				</div>
			</div>
		</div>
		<!-- 최근 본 상품 끝 -->
		<div class="theTop">
			<a href="#" class="topText">TOP</a>
		</div>
	</div>
</body>
</html>