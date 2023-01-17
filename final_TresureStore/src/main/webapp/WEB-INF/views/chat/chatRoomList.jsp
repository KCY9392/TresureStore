<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 헤더 js -->
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<title>treasure ChatRoomList</title>

<style>

	  /*전체 공통 div*/
	  .main-section{
	      box-sizing: border-box;
	      width: 65%;
	      margin: auto;
	  }
	   .innerOuter{
	      padding : 5% 10%;
	  }
	  /*보물톡 text*/
	  .innerOuter span{
	      font-weight: bold;
	      font-size: 40px;
	  }
	  /*차단목록 a태그*/
	  .innerOuter a {
	      text-decoration: none;
	      color:gold;
	      float: right;
	      
	  }
	  thead{
	      color: rgb(248, 212, 12);
	      text-align: center;
	  }
	  tbody{
	      text-align: center;
	      vertical-align: bottom; /* 안 먹힘.. 왜지..?*/
	  }
</style>

</head>
<body>
	  <jsp:include page="../common/header.jsp"/>
	  <jsp:include page="../common/sideBar.jsp"/>
	    <br><br>
	        <div class="main-section">
	      <div class="p-3 m-0 border-0 bd-example ">
	          <br><br>
	            <div class="innerOuter">
	              <img src="https://cdn-icons-png.flaticon.com/128/5545/5545823.png" width="40" >&nbsp;<span>보물톡</span>
	                  <a href="#" >차단목록</a>
	                  <br><br>
	                <table class="table">
	                  <thead>
	                    <tr>
	                   	  <th></th>
	                      <th colspan="">상점명</th>
	                      <th colspan="">채팅 시간</th>
	                      <th></th>
	                    </tr>
	                  </thead>
	                  <tbody class="table-group-divider">
	                    <tr>
	                      <th>1</th>
	                      <td class="storeName"><img src="https://cdn-icons-png.flaticon.com/128/9317/9317793.png" width="20">&nbsp;&nbsp;상점 920526호 점</td>
	                      <td>2023.1.11 20:55</td>
	                      <td><button type="button" class="btn btn-outline-warning btn-sm">나가기</button></td>
	                    </tr>
	                    <tr>
	                      <th>2</th>
	                      <td class="storeName"><img src="https://cdn-icons-png.flaticon.com/128/9317/9317793.png" width="20">&nbsp;&nbsp;상점 920526호 점</td>
	                      <td>2023.1.11 20:55</td>
	                      <td><button type="button" class="btn btn-outline-warning btn-sm">나가기</button></td>
	                    </tr>
	                    <tr>
	                      <th>3</th>
	                      <td class="storeName"><img src="https://cdn-icons-png.flaticon.com/128/9317/9317793.png" width="20">&nbsp;&nbsp;상점 920526호 점</td>
	                      <td>2023.1.11 20:55</td>
	                      <td><button type="button" class="btn btn-outline-warning btn-sm">나가기</button></td>
	                    </tr>
	                  </tbody>
	                </table>
	              </div>
	            </div>
	        </div>
	     <jsp:include page="../common/footer.jsp"/>
	     
	<script>
		 $(function(){
	         $(".storeName").click(function(){
	 
	               location.href="${pageContext.request.contextPath}/chat/chatRoom"
	         })
	     })
	</script>

</body>
</html>