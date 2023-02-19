<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="mList" value="${map.mList }" />
<c:set var="pi" value="${map.pi }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminPage</title>

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="/tresure/resources/css/font.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<style>
.adminMain{
	background-color:#e4d8ca4d;
	margin:auto;
	height: 1000px; /* 정렬하려는 요소의 넓이를 반드시 지정 */
	position:relative;
	padding: 72px;
}
.adminDiv{
	height: 1000px;
	box-sizing: border-box;
}
/* .adminBtns{
	display:inline-block;
	text-align:center;
	position: absolute;
	right:50%;
	top:25%;
} */
.list-b{
	position: absolute;
    display: flex;
    height: 73px;
    width: 1000px;
    text-align:center;
    right: 25%;
    
 }

.list-b button{
	flex: 1 1 0%;
    align-items: center;
    justify-content: center;
    display: flex;
    border: none;
    padding: 15px;
    margin-top: 10px;
    margin-right: 1px;
	color:#5e5e5f;
    background-color: gold;
    font-weight: 600;
    border-radius: 10px;
	text-decoration:none ;
	text-align: center;
}

.list-b>button>span{
    font-family: 'koverwatch';
    font-size: 30px;
 }
 
.list-b button:hover{
    background-color: rgb(10, 103, 185);
    cursor: pointer;
    color: white;
}
#adminText{
	font-size : 30px;
	font-weight: 600;
	color:#5e5e5f;
	position: absolute;
	left: 15%;
    top: 11%;
    font-family: 'koverwatch';
}

.list-area {
    margin-top: 100px;
    margin-left: 300px;
    width: 1100px;
    display: inline-block;
    text-align: center;
}
   
.list-area thead{
	font-family: 'koverwatch';
 	border-top: 1px solid rgb(30, 29, 41);
 	border-bottom: 1px solid rgb(30, 29, 41);
}
.list-area table{
	font-size:20px;
}   
tr>td{
	font-family: 'koverwatch';
 	vertical-align: middle;
 	padding: 0.5rem;
 	line-height: normal;
}
#pagingArea {
	width: 80%;
	margin: auto;
}

.pagination {
	list-style-type: none;
	width: 100%;
}

.page-item {
	border: 1px solid lightgrey;
	text-align: center;
	margin-left: 10px;
	float: left;
}

.page-link {
	padding: 15px;
}

.page-link:active {
	color: red;
}

.page-link:hover {
	color: blue;
	border: blue;
}


</style>
</head>
<body>


	<div class="adminMain">


	
		<a href="${pageContext.request.contextPath}/admin/memberAdmin" id="memberAdmin" class="adminBtn" >회원 관리</a>
		<a href="${pageContext.request.contextPath}/admin/payAdmin" id="payAdmin" class="adminBtn">결제 관리</a>
	

	

	  <div class="content2">
		<div class="adminDiv">
			<a href="${pageContext.request.contextPath}" class="logo"> 
				<img src="/tresure/resources/images/icon/icon.png" width="200" height="110" alt="보물상점 로고"></a> <span id="adminText">관 리 자 페 이 지</span>
			 <br>
			 <div class="adminBtns">
			 	<div class="list-b">
					<button class="memberAdm" onclick="show(this);" id="memberAdmin" name="show" class="adminBtn"><span class="memberAdm">블 랙 리 스 트 관 리</span></button>
					<button class="payAdm" onclick="show(this);" id="payAdmin" name="show" class="adminBtn"><span class="payAdm">결 제 관 리</span></button>
			 	</div>
			 </div>
		
		
		
		<!-- 회원관리(블랙리스트) -->
		<div id="memberAdminshow" class="box">   
	      <div class="list-area">
	               <table class="table table-hover list">
	                  <thead>
	                     <tr>
	                     	<th scope="col">상점번호</th>
	                        <th scope="col">신고 당한 횟수</th>
	                        <th scope="col">회원 상태</th>
	                        <th></th>
	                     </tr>
	                  </thead>
	                  
	                  <tbody>
	                     <c:forEach var="mem" items="${mList}">
	                           <tr>
                           	      <td scope="col">${mem.userNo }</td>
	                              <td scope="col">${mem.reportCount }</td> 
	                              <td scope="col"><button type="button">상태 변경</button></td>
	                           </tr>
	                     </c:forEach>
	                  </tbody>
	               </table>
	               	           <c:set var ="url" value="?currentPage=" />
	                <!-- 페이지 이동기능 구현 -->
                <div id="pagingArea">
                  <ul class="pagination">
                    <c:choose>
                      <c:when test="${pi.currentPage eq 1 }">
                        <li class="page-item disabled"><a class="page-link" href="#">&lt; 이전</a></li>
                      </c:when>
                      <c:otherwise>
                        <li class="page-item"><a class="page-link" href="${url}${pi.currentPage -1 }">&lt; 이전</a></li>
                        <!-- list.bo?cpage=1 -->
                      </c:otherwise>
                    </c:choose>

                    <c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
                      <li class="page-item"><a class="page-link" href="${url}${item }">${item}</a></li>
                    </c:forEach>

                    <c:choose>
                      <c:when test="${pi.currentPage eq pi.maxPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">다음 &gt;</a></li>
                      </c:when>
                      <c:otherwise>
                        <li class="page-item"><a class="page-link" href="${url}${pi.currentPage +1 }">다음 &gt;</a></li>
                      </c:otherwise>
                    </c:choose>
                  </ul>
                </div>
	            </div>
	         </div>
	         
	         
	         
	         
	    <!-- 결제 관리 -->
	    <div id="payAdminshow" class="box" style="display:none;">   
            <div class="list-area">
                  <table class="table table-hover list">
                     <thead>
                        <tr>
                           <th scope="col" width="10%">주문번호</th>
                           <th scope="col" width="10%">날짜</th>
                           <th scope="col" style="padding-left: 10px;" width="20%">상품명</th>
                           <th scope="col" width="10%">판매상점</th>
                           <th scope="col" width="10%">구매상점</th>
                           <th scope="col" width="10%">금액</th>
                           <th scope="col" width="10%">은행</th>
                           <th scope="col" width="10%">계좌 번호</th>
                           <th scope="col" width="10%">확인</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="acc" items="${accountList}">
                              <tr>
                              	 <td scope="col">${acc.orderNo}</td>
                                 <td scope="col">${acc.createDate}</td>
                                 <td scope="col">${acc.sellTitle }</td>
                                 <td scope="col">${acc.userNo }호점</td>
                                 <td scope="col">${acc.purUser }호점</td>
                                 <td scope="col">${acc.price }원</td>
                                 <td scope="col">${acc.bank }</td>
                                 <td scope="col">${acc.account }</td>
                                 <td>
                                 <button class="btn btn-secondary m-2" id="subscriberBtn" onclick="changeDepoStatus(${acc.purNo});">확인</button>
                                 </td>
                                 <td>
                                 	<input type="hidden" value="${acc.depoStatus }" id="depoStatus">
                                 </td>
                                 
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


	//버튼 전환
	function show(element){
	    let tag = document.getElementsByClassName("box");
	
	    for(let i=0; i<tag.length; i++){
	         if(element.id+"show" == tag[i].id){
	              tag[i].style.display = "block";
	              tag[i].style.animation = "fadeIn";
	              tag[i].style.animationDuration = "1s";
	                  
	          }else{
	              tag[i].style.display = "none";
	          }
	      }
	  }
	

	
		
		
	





 <script>
 if($("#depoStatus").val()!='N'){
	 
 function changeDepoStatus(purNo){
	 
		
    
     $.ajax({
        url : '${pageContext.request.contextPath}/changeDepoStatus',
          type : 'post',
         data : {purNo :purNo},
         success : function(result){
                if(result == 1) {
                   
                	Swal.fire({
		                icon: 'success',
		                title: '성공적으로 입금이 되었습니다.'                  
		            });	
                }
			    
                
             
          },
          error:function(){
               console.log("실패");
            }
     });
     
  }
 
 };
 


  </script>
  <script>
  if($("#depoStatus").val()=='N'){
  	$("#subscriberBtn").text("입금완료");
  }
  </script>


</body>
</html>