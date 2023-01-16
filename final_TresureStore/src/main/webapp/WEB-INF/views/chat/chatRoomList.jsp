<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>treasureChatRoomList</title>

<style>
	  /*전체 div*/
	    .content{
	        box-sizing: border-box;
	        width: 100%;
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
	  <jsp:include page="../header.jsp"/>
	  <jsp:include page="../sideBar.jsp"/>
	    <br><br>
	      <div class="p-3 m-0 border-0 bd-example">
	        <div class="content">
	          <br><br>
	            <div class="innerOuter">
	              <img src="https://cdn-icons-png.flaticon.com/128/5545/5545823.png" width="40" >&nbsp;<span>보물톡</span>
	                  <a href="#" >차단목록</a>
	                  <br><br>
	                <table class="table">
	                  <thead>
	                    <tr>
	                      <th></th>
	                      <th>상점명</th>
	                      <th>채팅 시간</th>
	                      <th></th>
	                    </tr>
	                  </thead>
	                  <tbody class="table-group-divider">
	                    <tr>
	                      <th>1</th>
	                      <td><img src="https://cdn-icons-png.flaticon.com/128/9317/9317793.png" width="20">&nbsp;&nbsp;상점 920526호 점</td>
	                      <td>2023.1.11 20:55</td>
	                      <td><button type="button" class="btn btn-outline-warning btn-sm">나가기</button></td>
	                    </tr>
	                    <tr>
	                      <th>2</th>
	                      <td><img src="https://cdn-icons-png.flaticon.com/128/9317/9317793.png" width="20">&nbsp;&nbsp;상점 920526호 점</td>
	                      <td>2023.1.11 20:55</td>
	                      <td><button type="button" class="btn btn-outline-warning btn-sm">나가기</button></td>
	                    </tr>
	                    <tr>
	                      <th>3</th>
	                      <td><img src="https://cdn-icons-png.flaticon.com/128/9317/9317793.png" width="20">&nbsp;&nbsp;상점 920526호 점</td>
	                      <td>2023.1.11 20:55</td>
	                      <td><button type="button" class="btn btn-outline-warning btn-sm">나가기</button></td>
	                    </tr>
	                  </tbody>
	                </table>
	              </div>
	            </div>
	        </div>
	     <jsp:include page="../footer.jsp"/>

</body>
</html>