<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<link rel="stylesheet" href="/tresure/resources/css/mypage/mypageMain.css">
<link rel="stylesheet" href="/tresure/resources/css/mypage/following.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>

	<div class="main-section">
		<div class="content2">
			<div class="profile">
				<!-- 상점 등급 이미지 나오는 박스 -->
				<div class="profile-image">
					<c:if test="${member.avg > 4.5}">
						<img src="/tresure/resources/images/icon/grade3.png" height="100%" width="100%" />
					</c:if>
					<c:if test="${ 4 <= member.avg && member.avg < 4.5 }">
						<img src="/tresure/resources/images/icon/grade2.png" height="100%" width="100%" />
					</c:if>
					<c:if test="${ 3.5 <= member.avg && member.avg < 4 }">
						<img src="/tresure/resources/images/icon/grade1.png" height="100%" width="100%" />
					</c:if>
					<c:if test="${ member.avg == null  || member.avg < 3.5 }">
						<img src="/tresure/resources/images/icon/grade0.png" height="100%" width="100%" />
					</c:if>
				</div>
				<br> <a href="#" class="market-grade">상점등급 안내</a>

			</div>

			<!-- 상점명 & 개업날짜 & 팔로워수 & 판매상품수 & 상점신고수 내용 박스 -->
			<div class="info">
				<div class="info-table">
					<div class="market-name">
						상점
						<h3>${member.userNo }</h3>
						호점
					</div>
					<br>
					<br>
					<div class="info-list">
						<div class="market-open">
							<img src="/tresure/resources/images/icon/상점오픈.png" width="20"
								height="15" alt="상점오픈일 아이콘"> &nbsp;상점오픈일
							<div class="market-opendate">
								<span>${member.marketOpen }</span>일전
							</div>
						</div>

						<div class="follower">
							<img src="/tresure/resources/images/icon/팔로워.png" width="20"
								height="15" alt="팔로워 아이콘"> &nbsp;팔로워
							<div class="market-follower">
								<span>${member.folloewCount }</span> 명
							</div>
						</div>

						<div class="sell-product">
							<img src="/tresure/resources/images/icon/판매수.png" width="20"
								height="15" alt="상품판매 아이콘"> &nbsp;상품판매
							<div class="market-sell">
								<span>${member.sellCount }</span> 회
							</div>
						</div>

						<div class="report">
							<img src="/tresure/resources/images/icon/신고수.png" width="20"
								height="15" alt="신고 아이콘"> &nbsp;신고
							<div class="market-report">
								<span>${member.reportCount }</span>회
							</div>
						</div>
						<br>
						<br>
					</div>
					<br>
					<br>
					<br>
				</div>
			</div>
		</div>
		<div class="following_box">
			<h2 class="following_title">팔로잉 목록</h2>
			<!-- ${followList} -->
			<ul class="following_body">
			<c:forEach var="follow" items="${followList }">
				<li class="following_list">
					<div class="profile-image1">
						<a href="${pageContext.request.contextPath }/sell/store/${follow.fwId }">
						<c:if test="${follow.avg > 4.5}">
							<img src="/tresure/resources/images/icon/grade3.png" height="100%" width="100%" />
						</c:if>
						<c:if test="${ 4 <= follow.avg && follow.avg < 4.5 }">
							<img src="/tresure/resources/images/icon/grade2.png" height="100%" width="100%" />
						</c:if>
						<c:if test="${ 3.5 <= follow.avg && follow.avg < 4 }">
							<img src="/tresure/resources/images/icon/grade1.png" height="100%" width="100%" />
						</c:if>
						<c:if test="${ follow.avg == null  || follow.avg < 3.5 }">
							<img src="/tresure/resources/images/icon/grade0.png" height="100%" width="100%" />
						</c:if>
						</a>
					</div>
					<div>
						<div class="market-name1">
						상점
						<h3>${follow.fwId }</h3>
						호점
						</div>
					</div>
					<div>
						<div class="market-name1">
							<h3>상품 ${follow.sellCount }개</h3>
						</div>
					</div>
					<div>
						<div class="market-name1">
							<button type="button" class="follow-cancel" data-fwid="${follow.fwId }">팔로잉 취소</button>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	<script>
	$(document).on("click", ".follow-cancel", (e) => {
		if (confirm("팔로잉을 취소하시겠습니까?")) {
			let li = $(e.target).closest("li");
			console.log("fwId : ", $(e.target).data("fwid"))
			$.ajax({
				url : '${pageContext.request.contextPath }/follow/delFollow',
				type : "post",
				data : {fwId : $(e.target).data("fwid")},
				dataType : "json",
				success : function(data) {
					let count = Number(data.result)
					if (count == 1) {
						alert("팔로우가 취소되었습니다.");
						$(li).remove();
					} else {
						alert("팔로우 취소에 실패하었습니다.");
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 관리자에게 문의해주세요");
					console.log("오류");
				}
			});
		}

	});
	</script>
</body>
</html>