<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하기</title>
<style>
	body{
		box-sizing : border-box;
		margin : 0;
		padding : 0;
	}
	.wrap .middle-top{
		background : black;
		width:100%;
		height : 600px;
	}
	.image-area{
		display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.middle-bottom{
		width:60%;
		margin:auto;
	}
	.middle-bottom .loginType{
		text-align : center;

	}



	
</style>
</head>
<body>
	<div class="wrap">
		<div class="middle-top">
			<div class="image-area">
				<img alt="보물지도" src="${pageContext.request.contextPath}/resources/images/common/loginMainImage.png"/>
			</div>
			
		</div>
		<div class="middle-bottom">
			<div class="loginType"> 카카오 로그인</div>
			<div class="loginType"> 본인인증 로그인</div>
			<div class="loginType"><a href="${pageContext.request.contextPath}">되돌아가기</a></div>
			
		</div>
	</div>

	
</body>
</html>