<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
<link rel="stylesheet" href="/tresure/resources/css/mypage/tracsac.css">

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/header.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/mypageMain.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>

	<div class="main-section">
	<div class="content2">
	
	 <div class="list-form">
   
	
	<div class="list-content">
    		<div class="list-b">
    			<button class="sell-trac"  type="button" onclick="show(this);" id="s" name="show"><span class="sell-trac">판매내역</span></button>
				<button class="pur-trac" type="button" onclick="show(this);" id="p"name="show"><span class="pur-trac">구매내역</span></button>
    		</div>
    		<br><br>
    	</div>
    	
    <div id="sshow" class="box">	
	<div class="list-area">
				
	           
				<br>
				<table class="table table-hover list">
					<thead>
						<tr>
							<th scope="col" style="text-align: center;">사진</th>
							<th scope="col" width="350px">상품명</th>
							<th scope="col">가격</th>
							<th scope="col">찜</th>
							<th scope="col">날짜</th>
							<th scope="col">판매상태</th>
							<th scope="col"></th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${sellList}" begin="0" end="${fn:length(sellList)}" step="1" varStatus="status">
						
						
								<tr>
									<td scope="col"><c:if test="${s.imgSrc != null}">
										 <c:if test="${s.imgSrc != null}">
											<img src="${s.imgSrc}" width="100%" height="150px;"
											class="rounded float-start" alt="">
										</c:if>
										
									</c:if></td>
									<td scope="col"> ${s.sellTitle}</td>
									<td scope="col">${s.price }</td>
									<td scope="col">${s.heartNum }</td>
									<td scope="col">${s.createDate }</td>
									<td scope="col"><c:if test="${s.sellStatus eq 'I' }">
	                           <h5 class="sellStatus">판매중</h5>
	                           </c:if>	
	                           <c:if test="${s.sellStatus eq 'C' }">
	                           <h5 class="sellStatus">판매완료</h5>
	                           </c:if>
	                           </td>
	                           <td><button type="button" onclick="changeStatus();">상태 변경</button></td>
									
								</tr>
								
						</c:forEach>
						
						
					</tbody>
				</table>
			</div>
			</div>
























</div>
</div>


	</div>
	
	<script>
	  function changeStatus(){
		  $.ajax({
			  url : '${pageContext.request.contextPath}/changeStatus',
	          type : 'post',
		      data : {sellNo : "${s.sellNo}"},
		      success : function(result){
		    			if(result == 1) {
		     				alert("상태 변경");
		    			}
		    	},
		    	error:function(){
		            console.log("실패");
		         }
				  
		  });
		 
		  
	  };
	
	</script>


	

	<jsp:include page="../common/footer.jsp" />
</body>
</html>