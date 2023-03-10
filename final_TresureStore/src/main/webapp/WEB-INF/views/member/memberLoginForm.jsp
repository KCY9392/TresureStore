<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하기</title>
<!-- css 링크 -->
<link rel="stylesheet" href="/tresure/resources/css/member/memberLoginForm.css">   
<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
</head>
<body>
	<div class="wrap">
		<div class="middle-top">
			<div class="image-area">
				<a href="${pageContext.request.contextPath}"><img alt="보물지도" src="${pageContext.request.contextPath}/resources/images/common/loginMainImage.png" width="400px"/></a>
			</div>
			
		</div>
		<div class="middle-bottom">
			<img id="imglogo" src="/tresure/resources/images/icon/icon.png" width="50%" height="20%">
            <br>
			<div class="loginType">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=2f3c85098b01f4c1919eb4761e43a541&redirect_uri=http://localhost:8888/tresure/loginJoin/kakao&response_type=code">
					<img src="${pageContext.request.contextPath}/resources/images/common/kakaoLoginLogo.png" height="60px" width="400px"/>
				</a>
			</div>
			<div class="loginType">
				<a href="${url}">
					<img src="${pageContext.request.contextPath}/resources/images/common/btnG_완성형.png" height="60px" width="400px"/>
				</a>
			</div>
			<div class="loginType">
				<button class="myAuthentication-button" type="button"  onclick="gogoIdentificationForm();" height="60px" width="400px">본인인증 로그인</button>
				<br><br>
			</div>
			<div class="loginType">
				<a href="${pageContext.request.contextPath}"><img class="back" src="${pageContext.request.contextPath}/resources/images/icon/backbackback.png" width="50px" height="50px"></a>
			</div>
			
		</div>
	</div>

	<script>
		// 본인인증 폼으로
		function gogoIdentificationForm(){
			location.href='${pageContext.request.contextPath}/loginJoin/identification';
		}
	</script>
</body>
</html>