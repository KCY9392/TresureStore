<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/tresure/resources/css/header.css">
<link rel="stylesheet" href="/tresure/resources/css/font.css">
<title>Insert title here</title>
</head>
<body>
	<div class="headerbar">
		<div class="header1">
			<div class="header2">
				<div class="header3">
					<a href="${pageContext.request.contextPath}" class="logo"> <img
						src="/tresure/resources/images/icon/icon.png" width="136" height="60"
						alt="보물상점 로고">
					</a>

					<div class="search1">
						<div class="search2">
							<input type="text" id="search" class="search3"
								placeholder="상품명, @상점명 입력">
							<button onclick="test()" class="exx" id="exit">
								<img
									src="/tresure/resources/images/icon/x.png"
									width="10" height="12" alt="검색어 삭제 버튼 아이콘">
							</button>
							<a href="" class="searchicon"> <img
								src="/tresure/resources/images/icon/search.png" width="20"
								height="19" alt="검색 버튼 아이콘">
							</a>
						</div>
					</div>

					<div class="etIgxm">
					  <!-- 본인인증 방법 로그인 O && 카카오로그인 X -->
						<c:if test="${loginUser.phone != null && access_Token == null}">
							<a href="/tresure/logout" class="items">
								${loginUser.userName}님 환영합니다^ㅁ^ <br> 로그아웃
							</a>
						</c:if>
						
					  <!-- 본인인증 로그인 X && 카카오로그인 O -->	
					  	<c:if test="${loginUser.phone == null && access_Token != null}">
					  		<a href="https://kauth.kakao.com/oauth/logout?client_id=2f3c85098b01f4c1919eb4761e43a541&logout_redirect_uri=http://localhost:8888/tresure/logout/kakao" class="items">
					  			${loginUser.userName}님 환영합니다^ㅁ^ <br> 로그아웃
					  		</a>
					    </c:if>
					    
					  <!-- 본인인증 로그인 X && 카카오로그인 X -->
						<c:if test="${loginUser.phone == null && access_Token == null}">
							<a href="/tresure/loginJoinForm" class="items">
								<p>로그인/회원가입</p>
							</a>
						</c:if>
							
						
					</div>

				</div>
				<div class="sun_wrap">
					<div class="sun_wrap_div">
						<a href="#" class="sun_wrap_div_cate" id="sun_wrap_div_cate">
							<span class="onecate"></span> <span class="onecate"></span> <span
							class="onecate"></span>
						</a>
						<!-- <div class="catebox1">
                            <div class="catebox2"> -->
						<!-- </div>
                        </div> -->

					</div>
					<div class="sun_wrap_li">
						<ul id="sun_wrap_ul">
							<li><a href="${pageContext.request.contextPath}/chat/chatRoomList" onclick="chatGo()"><img
									src="/tresure/resources/images/icon/번개.png" alt="채팅 이미지">채팅하기</a></li>
							<li><a href="${pageContext.request.contextPath }/sell/sellInsert"><img
									src="/tresure/resources/images/icon/원.png" alt="판매등록 이미지">판매하기</a></li>
							<li><a href=""><img
									src="/tresure/resources/images/icon/사기조회.png" alt="사기조회 이미지">사기조회</a></li>
							<li><a href="${pageContext.request.contextPath}/member/myPage"><img
									src="/tresure/resources/images/icon/내상점.png" alt="내상점 이미지">내상점</a></li>
						</ul>
					</div>
				</div>
				<div class="catebox3">

					<ul class="inner-menu">
						<li class="catebox"><a href="#none"><img
								src="/tresure/resources/images/icon/star.png" width="40px"
								height="35px"><br>인기매물</a></li>
						<li class="catebox"><a href=""><img
								src="/tresure/resources/images/icon/디지털기기.png" width="40px"
								height="35px"><br>디지털기기</a></li>
						<li class="catebox"><a href=""><img
								src="/tresure/resources/images/icon/가전제품.png" wwidth="40px"
								height="35px"><br>생활가전</a></li>
						<li class="catebox"><a href=""><img
								src="/tresure/resources/images/icon/유아용품.png" width="40px"
								height="35px"><br>유아용품</a></li>
						<li class="catebox"><a href=""><img
								src="/tresure/resources/images/icon/패션.png" width="40px"
								height="35px"><br>패션</a></li>
						<li class="catebox"><a href=""><img
								src="/tresure/resources/images/icon/도서.png" width="40px"
								height="35px"><br>도서</a></li>
						<li class="catebox"><a href=""><img
								src="/tresure/resources/images/icon/반려동물용품.png" width="40px"
								height="35px"><br>반려동물용품</a></li>
						<li class="catebox"><a href="">&nbsp;&nbsp;<img
								src="/tresure/resources/images/icon/스포츠.png" width="40px"
								height="35px"><br>스포츠
						</a></li>
						<li class="catebox"><a href=""><img
								src="/tresure/resources/images/icon/뷰티.png" width="40px"
								height="35px"><br>뷰티</a></li>
						<li class="catebox"><a href=""><img
								src="/tresure/resources/images/icon/교환권.png" width="40px"
								height="35px"><br>교환권</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>