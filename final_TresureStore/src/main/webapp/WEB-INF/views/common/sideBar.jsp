<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/tresure/resources/css/common/sideBar.css">
<title>Insert title here</title>
</head>
<body>
	<div class="navBar">
		<!--찜 하트 수-->
		<div class="nfavorites">
			<div class="nfavoritesText">찜한상품</div>
			
			<div class="nfavoritesCount">
				<p id="ntoFavorites" class="ntoFavorites">
					<i class="nfas fa-heart"><img
						src="https://cdn-icons-png.flaticon.com/512/833/833472.png" width="20">
						
					<p>${loginUser.heartCount }</p>
					
					</i>
				</p>
			</div>
			<!-- favoritesCount -->
		</div>
		<!--찜 끝-->

		<!-- 최근 본 상품 시작 -->
		<div class="nrecently">
			<div class="nrecentlyText">최근본상품</div>
			<div class="nrecentlyProduct">
				<div id="nrecentlyCnt">1</div>
				<div id="nrecentlyArea">
					<a id="nrecentlyList"> 
					<!-- 최근본상품  --> 
						<img src="resources/resources/image/animal1.gif" class="nrecentlyImage"><br>
						<img src="resources/resources/image/animal1.gif" class="nrecentlyImage"><br> 
						<img src="resources/resources/image/animal1.gif" class="nrecentlyImage">
					</a>
				</div>
			</div>
		</div>
		<!-- 최근 본 상품 끝 -->
		<div class="ntheTop">
			<a href="#" class="ntopText">TOP</a>
		</div>
	</div>
	
	<script>
		
	</script>
	
	
</body>
</html>