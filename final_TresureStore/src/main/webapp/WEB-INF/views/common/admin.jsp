<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminPage</title>
<style>
.adminBtn{
    border: none;
    padding: 15px;
    margin-top: 10px;
    background-color: gold;
    font-weight: 600;
    border-radius: 10px;
	color:rgb(10, 103, 185);
	text-decoration:none ;
	
}
/*거래하기 버튼 내 버튼*/
.adminBtn:hover{
    background-color: rgb(10, 103, 185);
    cursor: pointer;
    color: white;
}


</style>
</head>
<body>


	<div class="adminMain">
	
		<a href="${pageContext.request.contextPath}/admin/memberAdmin" id="memberAdmin" class="adminBtn" >회원 관리</a>
		<a href="${pageContext.request.contextPath}/admin/payAdmin" id="payAdmin" class="adminBtn">결제 관리</a>
	
	</div>




</body>
</html>