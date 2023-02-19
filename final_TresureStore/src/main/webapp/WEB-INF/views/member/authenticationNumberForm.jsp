<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증번호 입력</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
	<!-- css 링크 -->
    <link type="text/css" rel="stylesheet" href="/tresure/resources/css/member/authenticationNumberForm.css"> 
    <style>

    </style>  
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="main-section">
		<br><br><br><br><br>
	    <div class="main-area">
	    	<br>
	    	<h1 class="bottom-margin" align="center">인증 번호 입력</h1>
			<form class="number-form" action="${pageContext.request.contextPath}/loginJoin/loginStrart" method="post">
	        	<div class="int-area">
                    <input class="inputType1" type="text" id="inputNumber" name="inputNumber" autocomplete="inputNumber" required>
                    <label for="inputNumber">인증번호 입력</label>
                    <input type="hidden" id="userName" name="userName" value="${userName }" >
	        		<input type="hidden" id="birth" name="birth" value="${birth }" >
	        		<input type="hidden" id="phone" name="phone" value="${phone }" >
	        		<input type="hidden" id="randomNum" name="randomNum" value="${randomNum }">
	            </div>
	            <div align="center" id="timer"></div>
    
                <button type="submit" class="submitButton" id="submitButton" >로그인 하기</button>
	       </form> 

		</div>
		<br><br><br>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	
		let inputNumber = document.querySelector('#inputNumber');
		let time = 180;
		let min = '';
		let sec = '';
		
		let x = setInterval(function(){
				
				min = parseInt(time/60);
				sec = time % 60;
				
				document.getElementById('timer').innerHTML = min + "분" + sec + "초";
				time--;
			
				if(time < 0){
					clearInterval(x);
					document.getElementById('timer').innerHTML = "시간초과";
				}
		}, 1000);		
	
		
		$(submitButton).on('click', function(){
			
			if( $(inputNumber).val() != ${randomNum }){
				alert("인증번호가 맞지 않습니다.");
				$(inputNumber).focus();
				return false;
			}
			
			return true;
		})
		
		setTimeout(function() {
		  window.history.back();
		}, 1000 * 60 * 3);
		
		
	</script>
</body>
</html>