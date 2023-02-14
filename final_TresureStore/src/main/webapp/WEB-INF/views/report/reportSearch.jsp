<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- fontawesome icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" 
		integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" 
		crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 헤더 js -->
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>

<title>TreasureStore reportSearch</title>
<style>
	.main-section{
	 width: 67%;
	 height: 600px;
     margin: auto;
     font-size:18px;
	}
	
	.main-box {
     padding: 10% 0%;
     height: 100%;
     margin: auto;
     width: 1000px;
    }
    
    /*사기조회 text*/
	.report-top-text{
	 font-weight: bold;
     font-size: 30px;
     display:inline;
     margin:45%; 
     position: relative;
	}

	/*사기조회 아래 라인*/
  	.report-line{
     border-bottom: 1px solid gray;
     margin:auto;
     padding: 20px;
  	}
  	/*느낌표 아이콘*/
  	.report-icon{
  	 color: gold;
  	 position:absolute;
  	 right: 50%;
     top: 20%;
  	}
	
	/*사기조회 이용 text*/
	.report-middle-text{
	 display: inline;
     position: absolute;
     right: 26%;
     top: 50%;
     font-size: 24px;
	}
	
	/*사기조회 select, text, button묶음 div*/
	.report-inner{
     position:absolute;
     top: 80%;
     right: 20%;
	}
	
	select{
     width:100px;
     height:36px;
     margin-right: 20px;
  	}
	
	.report-option{
	 float : left;
	}
	
	.report-search-text{
	 float : left;
     width:400px; 
     height:30px;
     margin-right: 20px;
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
	.report-search-button:hover{
	 color: gold;
     background-color: white;
     cursor : pointer;
     border:solid 1px gold;
    }
	
	.searchBoxReport{
      position: relative;
      width: 1000px;
      height: 300px;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>
	
	<div class="main-section">
		<div class="main-box">
			<div class="report-top-text"> 신고 조회</div>
        	<div class="report-line"></div>
        	<div class="searchBoxReport" style="position:relative">
        		<span class="report-icon"><img src="   https://cdn-icons-png.flaticon.com/512/4420/4420318.png " width="60px;"></span><br>
				<div class="report-middle-text">판매자의 상점 번호, 계좌번호로 피해 사례 조회를 이용해 보세요.</div><br>
				<form id="searchForm" action="reportSearchResult" method="get">
					<div class="report-inner">
						<select class="report-option" name="condition">
							<option value="sellNumber">상점번호</option>
							<option value="accountNumber">계좌번호</option>
						</select>

						<input type="text" class="report-search-text" name="search" id="searchReport" placeholder="@를 포함하여 상점번호를 입력해주세요.">
						<button type="submit" class="report-search-button" id="resultButton" >조회</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
			
		//입력값 없이 조회 버튼만 클릭 시
		 $('#resultButton').click(function(){
			 
			 if($('#searchReport').val()==''){
					Swal.fire({
			                icon: 'warning',
			                title: '검색어를 입력하세요'                  
			            });	
					return false;
				}
		 })
		 
		 
	</script>

</body>
</html>