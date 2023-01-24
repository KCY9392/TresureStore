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
	.wrap{
		display: flex;
	}
	
	.wrap .middle-top{
		background: #ffdac8;
	    width: 40%;
	    height: 929px;
	}
	.image-area{
	 	padding-top: 25%;
    	padding-left: 25%;
	}
	
	.middle-bottom{
		width: 60%;
	}
	
	#imglogo{
		padding-top: 15%;
	    padding-left: 23%;
	    width: 50%;
	    height: 30%;
	}
	.middle-bottom .loginType{
		text-align : center;
	}
	.loginType {
		margin-top : 40px;
	}
	.myAuthentication-button{
		border: none;
  		border-radius: 6px;
		width : 400px;
		background : black;
		color : white;
		cursor : pointer;
		height : 60px;
		font-size : 1.2em;
		font-weight: 500;
	}
	
	.loginType .back{
		text-decoration: underline;
		color : blue;
	}
</style>
</head>
<body>
	<div class="wrap">
		<div class="middle-top">
			<div class="image-area">
				<img alt="보물지도" src="${pageContext.request.contextPath}/resources/images/common/loginMainImage.png" width="400px"/>
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
				<button class="myAuthentication-button" type="button"  onclick="gogoIdentificationForm();" height="60px" width="400px">본인인증 로그인</button>
				<br><br>
				<a href="${pageContext.request.contextPath}/loginJoin/pp">관리자로 로그인</a>
				<a href="${pageContext.request.contextPath}/loginJoin/qq">사용자1로 로그인</a>
			</div>
			<div class="loginType">
				<a class="back" href="${pageContext.request.contextPath}">되돌아가기</a>
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