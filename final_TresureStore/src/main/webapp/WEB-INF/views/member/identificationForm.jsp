<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인인증</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
	body{
		margin : 0;
		padding :0;
		box-sizing : content-box;
		background : lightgrey;
	}
	.form-area {
		width : 50%;
		margin : auto;
		background :white;
		height : 700px;
		text-align : center;
		posotion : static;
	}
	body::before{
	    content: '';
	    position: absolute;
	    z-index: 1;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    /* background-color: rgba(0,0,0, 0.3); */
	}
	.login-form{
	    position: relative;
	    z-index: 2;
	}
	.login-form h1 {
	    font-size: 32px;
	    text-align: center;
	    margin-bottom: 60px;
	}
	.int-area{
	    width: 400px;
	    position: relative;
	    margin-top: 20px;
	}
	.int-area:first-child{
	    margin-top: 0;
	}

	.int-area input{
	    width: 100%;
	    padding: 20px 10px 10px;
	    background-color: transparent;
	    border: none;
	    border-bottom: 1px solid #999;
	    font-size : 18px;
	    outline: none;
	}
	.int-area label{
	    position: absolute;
	    left: 10px;
	    top: 15px;
	    font-size: 18px;
	    color:#999;
	    transition: all 0.5s ease;
	}
	.int-area label.warning{
	    color : red !important;
	    animation: warning 0.3s ease;
	    animation-iteration-count: 3;
	}
	@keyframes warning {
	    0% { transform: translateX(-8px); }
	    25% { transform: translateX(8px); }
	    50% { transform: translateX(-8px); }
	    75% { transform: translateX(8px); }
	}
	
	.int-area input:focus + label,
	.int-area input:valid + label{
	    top: -2px;
	    font-size: 13px;
	    color: #166cea;
	}
	.btn-area{
	    margin-top: 30px;
	}
	.btn-area button{
	    width:100%;
	    height: 50px;
	    background: linear-gradient(45deg, #00ff6e, #242fff, #ff3333);
	    color: #fff;
	    font-size: 20px;
	    border: none;
	    border-radius: 25px;
	    cursor: pointer;
	}
</style>

</head>
<body>
위에 헤더바 라고 생각<br>
<br><br><br><br><br>
<div class="form-area">
	<br>
	<h1>나의 정보입력하기</h1>
	<section class="login-form">
		<form action="">
			<div class="int-area">
				<input type="text" name="userId" id="userId" autocomplete="off" required/>
		        <label for="userId">아이디</label>
		    </div>
		    <div class="int-area">
		        <input type="password" name="userPwd" id="userPWd" autocomplete="off" required/>
		        <label for="userPWd">비밀번호</label>
		    </div>
		    <div class="btn-area">
		        <button id="loginBtn" type="submit">LOGIN</button>
		    </div>
		</form>
	</section>
</div>

<script>
    let userId = document.querySelector('#userId');
    let userPWd = document.querySelector('#userPWd');
    let loginBtn = document.querySelector("#loginBtn");

    $(loginBtn).on('click', function(){
        if($(userId).val() == "") {
            $(userId).next('label').addClass('warning');
            setTimeout(function(){
                $('label').removeClass('warning');
            }, 1000);

        } else if($(userPWd).val() == ""){
            $(userPWd).next('label').addClass('warning');
            setTimeout(function(){
                $('label').removeClass('warning');
            }, 1000);
        }
    })
</script>
</body>
</html>