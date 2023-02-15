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
				<div id="nrecentlyCnt"></div>
				<div id="nrecentlyArea">
					<ul id="nrecentlyList">
						<!-- 최근본상품  -->
					</ul>
				</div>
			</div>
			<div id="recentlyPaging" style="text-align: center;">
				<button id="recentlySubPage" class="btn subpage"
					onclick="recentlySubPage()"></button>
				<a id="currentPage"></a>
	
				<button id="recentlyAddPage" class="btn addpage"
					onclick="recentlyAddPage()"></button>
			</div>
		</div>
		<!-- 최근 본 상품 끝 -->
		<div class="ntheTop">
			<a href="#" class="ntopText">TOP</a>
		</div>
	</div>

	
	<script>
	
		// localStorage에서 products 키값 가져오기.
		let sideBarProducts = localStorage.getItem("products");
		
		// 만약 products가 undefined가 아니라면 list 변수에 JSON.parse(sideBarProducts)를 통해서 JSON Array를 만들고, 그게 아니라면 list 변수를 새로운 배열로 생성한다.
		let sideBarList = sideBarProducts ? JSON.parse(sideBarProducts) : [];
		
		<c:choose>
			<c:when test="${sessionScope.loginUser != null}">
				let sideBarUrl = "${pageContext.request.contextPath}/recent/" + (sideBarList ? "update" : "products");	
			
				$.ajax({
					url : sideBarUrl,
					data : JSON.stringify(sideBarList),
					type : "post",
					dataType : "json",
					contentType : "application/json",
					success : function(data) {
						
						localStorage.removeItem("products");

						$("#nrecentlyList").children().remove();

						$(data).each((i, elem) => {
							if (elem.crawl == "N") {
								elem.imgSrc = "${pageContext.request.contextPath}" + elem.imgSrc;
							}
							console.log("로그인 된 상태 -> href : ${pageContext.request.contextPath}/sell/sellDetail/" + elem.sellNo, ", imgSrc :", elem.imgSrc, ", crawl:", elem.crawl);
							$("#nrecentlyList")
								.append($("<li>")
									.append($("<a>", { href : "${pageContext.request.contextPath}/sell/sellDetail/" + elem.sellNo })
										.append($("<img>", { src : elem.imgSrc }).addClass("nrecentlyImage"))
									)
								)
						});
						
						$("#nrecentlyCnt").text(data.length);
					},
					error : function() {
						console.log("오류 발생");
					}
				});
			</c:when>
			<c:otherwise>
				// 로그인 안할 경우
				
				// 리스트가 빈값이 아니라면
				if(sideBarList) {
					$("#nrecentlyList").children().remove();
					
					for(let i = 0; i < sideBarList.length; i++) {
						if(sideBarList[i].crawl == "N") {
							sideBarList[i].imgSrc = "${pageContext.request.contextPath}" + sideBarList[i].imgSrc;
						}
						$("#nrecentlyList")
							.append($("<li>")
									.append($("<a>", { href : "${pageContext.request.contextPath}/sell/sellDetail/" + sideBarList[i].sellNo})
										.append($("<img>", { src : sideBarList[i].imgSrc}).addClass("nrecentlyImage"))
								)
							);
					}
				}
			</c:otherwise>
		</c:choose>
	</script>
</body>
</html>
