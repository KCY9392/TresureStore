<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 헤더 js -->
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>

<title>TreasureStore reportSearchAfter</title>
<style>
	.main-section{
	 width: 70%;
	 height: 600px;
     margin: auto;
     font-size:18px;
	}
	
	.main-box {
     padding: 15% 0%;
     height:100%;
     margin: auto;
    
    }
    
    /*사기조회결과 text*/
	.report-top-text{
	 font-weight: bold;
     font-size: 30px;
     display:inline;
     margin: 43%;
     position: relative;
	}

	/*사기조회 아래 라인*/
  	.report-line{
     border-bottom: 1px solid gray;
     margin:auto;
     padding: 20px;
  	}

	/*사기조회 이용 text*/
	.report-middle-text{
	 display:inline;
     position:absolute;
     right: 40%;
     top: 50%;
	}
	
	/*사기조회 select, text, button묶음 div*/
	.report-inner{
     position:absolute;
     
	}
	
	.report-number{
	 font-size:25px;
	 padding-top: 5%;
	 padding-left: 15%;
	}
	
	.report-text{
	 font-size:18px;
	 padding-left: 15%;
	}
	
	.report-line2{
	 border-bottom: 1px solid gray;
     margin:auto;
     padding: 20px;
	
	}
	
	.report-inner{
	 padding-left: 15%;
	 margin-top: 5%;
	}
	
	.tresure-report{
	 display:inline;
	 float:left;
	 margin-left: -65px;
	}
	.report-content{
	 display:inline;
	 float:left;
	 margin-left: 70px;
	}
	
	.report-search-button{
	  font-family: 'koverwatch';
      padding:12px 20px;
      background-color:gold;
      color:white;
      border:none;
      border-radius : 8%;
      cursor: pointer;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>
	
	<div class="main-section">
		<div class="main-box">
			<div class="report-top-text"> 사기 조회 결과</div>
        	<div class="report-line"></div>
				<div class="report-number"> 346***** </div>
				<div class="report-text"> 피해 사례 조회 </div>
				<div class="report-line2"></div>
				<div class="report-inner">
					<div class="tresure-report">보물상점</div>
					<div class="report-content">신고 건수 5회<br>신고 접수 내용 : 사기, 비매너 </div>
				</div>
				<button class="report-search-button" >다시 조회하기</button>
		</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>