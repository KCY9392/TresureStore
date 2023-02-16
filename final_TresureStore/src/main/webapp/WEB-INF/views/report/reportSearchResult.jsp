<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	 height: auto;
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
     margin-bottom:50px;
     padding: 20px;
  	}

	/*사기조회 이용 text*/
	.report-middle-text{
	 display:inline;
     position:absolute;
     right: 40%;
     top: 50%;
	}
	
	.report-table{
     width: 100%;
    } 
    .report-thead{
     color: rgb(248, 212, 12);
     text-align:center;
    }
    .report-tbody{
     text-align: center;
    }
	.report-search-button{
	  font-family: 'koverwatch';
      padding:12px 20px;
      background-color:gold;
      color:white;
      border:none;
      border-radius : 8%;
      cursor: pointer;
      position:absolute;
      right: 49%;
      top: 100%;
	}

	.report-search-button:hover{
     color: gold;
     background-color: white;
     cursor : pointer;
     border:solid 1px gold;
	}

	.text-report{
		text-align:center;
		color:gray;
	}
	.result-text-color{
		color:rgb(216, 49, 8);
		font-size: 25px;
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
                  <c:choose>
	                    <%-- 신고 목록이 없을 때	 --%>
	                    <c:when test="${reportList == null}">

	                        <div style="text-align: center;">
	                        <img src="https://cdn-icons-png.flaticon.com/512/7405/7405619.png " width="50px;"> <br><br>
	                        사기조회 결과가 없습니다. <br><br> 다시 검색해주세요.  </div>
	                    </c:when>
	                    <c:otherwise>
		                   
	                    <div class="text-report">검색하신 
	                    	<span class="result-text-color">
	                    		<c:if test="${search}">호 점</c:if>
	                    		<c:if test="${accountNum}"> 계좌번호</c:if>
	                    	</span>의 
	                    			총 신고 횟수는 <span class="result-text-color">${reportNum}</span> 회 입니다.</div>
		                <table class="report-table">
		                  <thead class="report-thead">
		                    <tr>
		                      <th></th>
		                      <th>신고 내용</th>
		                      <th>신고된 날짜</th>
		                      <th></th>
		                    </tr>
		                  </thead>
		                  <tbody class="report-tbody">
					          <c:forEach var="report" items="${reportList }">
			                    <tr>
			                      <td></td>
			                      <td><c:out value="${report.reportContent}" /></td>
			                      <td><c:out value="${report.createDate}" /></td>
			                      <td></td>
			                    </tr>
					          </c:forEach>
		                  </tbody>
		                </table>
              	 	</c:otherwise>
              </c:choose>
              <button class="report-search-button" onclick="location.href='${pageContext.request.contextPath}/report/reportSearch'">다시 조회하기</button>
                
            </div>
          </div>

	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>