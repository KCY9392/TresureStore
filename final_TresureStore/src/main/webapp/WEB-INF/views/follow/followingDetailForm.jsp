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

		<div class="following_box">
			<h2 class="following_title">팔로잉 목록</h2>
			<ul class="following_body">
			<c:forEach var="follow" items="${followList }">
				<li class="following_list" >
					<div class="profile-image1" data-seller-no='${follow.fwId}'>
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
					</div>
					<div data-seller-no='${follow.fwId}'>
						<div class="market-name0">
						상점 ${follow.fwId } 호점
						</div>
					</div>
					<div data-seller-no='${follow.fwId}'>
						<div class="market-name1">
							<img src="/tresure/resources/images/icon/판매수.png" width="20" height="15" alt="상품판매 아이콘" style="margin-top: 5px;"> 
                        &nbsp;상품판매 ${follow.sellCount }회
						</div>
					</div>
					<div class="follow-cancel-box">
						<div class="market-name2">
							<button type="button" class="follow-cancel" data-fwid="${follow.fwId }">팔로잉 취소</button>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	<script>
		$(function(){
			$(".follow-cancel-box").siblings().click(function(){
				let no = $(this).data("seller-no");
				location.href = '${pageContext.request.contextPath}/sell/seller/'+no;
			});
		});
		
		
		$(document).on("click", ".follow-cancel", (e) => {
			if (confirm("팔로잉을 취소하시겠습니까?")) {
				let li = $(e.target).closest("li");
				console.log("fwId : ", $(e.target).data("fwid"))
				$.ajax({
					url : '${pageContext.request.contextPath}/follow/delFollow',
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