<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물상점</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<link rel="stylesheet" href="/tresure/resources/css/common/error.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="main-section">
		<div class="error-Image">
			<img src="https://img.freepik.com/free-vector/404-error-template-in-flat-style_23-2147759645.jpg?size=338&ext=jpg&ga=GA1.1.40710258.1672326704&semt=sph" width="100%" height="100%">
		</div>
404에러입니다
		<div class="myOuter">
        	<a href="${pageContext.request.contextPath}" class="backTotheHome"><i></i><span>홈으로 바로 가기</span></a>
   		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>