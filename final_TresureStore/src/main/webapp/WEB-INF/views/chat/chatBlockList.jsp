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
<title>TreasureStore chatBlockList</title>
<style>
   /*전체 div*/
    .main-section{
        box-sizing: border-box;
        width: 90%;
        margin: auto;
	  }
   /*차단목록 text*/
   .innerOuter span{
        font-weight: bold;
        font-size: 30px;
   }
   /*보물톡 a태그*/
   .innerOuter a {
        text-decoration: none;
        color:gold;
        float: right;
   }
   thead{
        color: rgb(248, 212, 12);
        text-align:right;
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
      	<div class="p-3 m-0 border-0 bd-example">
          <br><br>
            <div class="innerOuter" style="padding : 5% 10%;">
              <img src="https://cdn-icons-png.flaticon.com/128/5545/5545823.png" width="30" height="30">&nbsp;<span>차단목록</span>
                  <a href="#" >보물톡</a>
                  <br><br>
                <table class="table">
                  <thead>
                    <tr>
                      <th></th>
                      <th>상점명</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody class="table-group-divider">
                    <tr>
                      <th>1</th>
                      <td>상점 708708호 점</td>                      
                      <td><button type="button" class="btn btn-outline-warning btn-sm">해제</button></td>
                    </tr>
                    <tr>
                      <th>2</th>
                      <td>상점 708708호 점</td>                     
                      <td><button type="button" class="btn btn-outline-warning btn-sm">해제</button></td>
                    </tr>
                    <tr>
                      <th>3</th>
                      <td>상점 708708호 점</td>                     
                      <td><button type="button" class="btn btn-outline-warning btn-sm">해제</button></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
        </div>
        
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>