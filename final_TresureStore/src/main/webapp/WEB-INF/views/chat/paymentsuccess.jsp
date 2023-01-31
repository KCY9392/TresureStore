<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>결제 성공</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
</head>
<body>
<section>
        <h1>결제 성공</h1>
        <p>결과 데이터 : ${jsonObject.toJSONString()}</p>
        <p>orderName : ${jsonObject.get("orderName")}</p>
        <p>method : ${jsonObject.get("method")}</p>
<%--         <p>virtualAccount -> accountNumber : ${accountNumber}</p> --%>
<%--         <p>virtualAccount -> bank : ${bankName}</p> --%>
        

</section>
</body>
</html>