<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/tresure/resources/css/mypage/mypageMain.css">
<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/header.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/mypageMain.js"></script>
      
<style>

		.followAddOrSubBox{
            
            margin: auto;
            border: 1px solid rgb(211 206 206);
            width: 270px;
    		height: 60px;
    		margin-left: 260px
        }
        
 		.followBtn-sell{
            border: none;
            background-color: white;
        }

        .followBtn-sell:hover{
            cursor: pointer;
            border: 3px solid rgb(241, 238, 238);
        }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>
	 	 
	<div class="main-section">
        
    <div class="content2">

        <div class="profile">
            
<!-- ���� ��� �̹��� ������ �ڽ� -->            
            <div class="profile-image">
           <c:if test="${member.reviewAvg > 4.5}"> 
                                 <img src="/tresure/resources/images/icon/grade_3.png" height="100%" width="100%"/>
                              </c:if> 
                              <c:if test="${ 4 <= member.reviewAvg && member.reviewAvg < 4.5 }"> 
                                 <img src="/tresure/resources/images/icon/grade2.png" height="100%" width="100%"/> 
                              </c:if> 
                              <c:if test="${ 3.5 <= member.reviewAvg && member.reviewAvg < 4 }"> 
                                 <img src="/tresure/resources/images/icon/grade1.png" height="100%" width="100%"/> 
                              </c:if>
                              <c:if test="${ member.reviewAvg == null  || member.reviewAvg < 3.5 }">
                                 <img src="/tresure/resources/images/icon/grade0.png" height="100%" width="100%"/>
                              </c:if>  


            </div>
            <br>
            <a href="#" class="market-grade">������� �ȳ�</a>

        </div>

<!-- ������ & ������¥ & �ȷο��� & �ǸŻ�ǰ�� & �����Ű�� ���� �ڽ� -->
        <div class="info">
            <div class="info-table">
                <div class="market-name">����<h3>${member.userNo }</h3>ȣ��</div><br><br>
                <div class="info-list">
                    <div class="market-open">
                        <img src="/tresure/resources/images/icon/��������.png" width="20" height="15" alt="���������� ������">
                        &nbsp;����������<div class="market-opendate"><span>${member.marketOpen }</span>����</div>
                    </div>

                    <div class="follower">
                        <img src="/tresure/resources/images/icon/�ȷο�.png" width="20" height="15" alt="�ȷο� ������">
                        &nbsp;�ȷο�<div class="market-follower"><span>${member.followCount }</span> ��</div>
                    </div>

                    <div class="sell-product">
                        <img src="/tresure/resources/images/icon/�Ǹż�.png" width="20" height="15" alt="��ǰ�Ǹ� ������">
                        &nbsp;��ǰ�Ǹ�<div class="market-sell"> <span>${member.sellCount }</span> ȸ</div>
                    </div>

                    <div class="report">
                        <img src="/tresure/resources/images/icon/�Ű��.png" width="20" height="15" alt="�Ű� ������">
                        &nbsp;�Ű�<div class="market-report"> <span>${member.reporterCount }</span>ȸ</div>
                    </div>
                    <br><br>
                </div>
                <br><br><br>

                <div class="followAddOrSubBox">
					<c:if test="${member.isFollow == 0}">
                           <button type="button" class="followBtn-sell" style="width:100%; height: 100%;"><img class="followBtm" src="/tresure/resources/images/icon/followAddBtn.png" width="100%" height="70%"></button>
                    </c:if>
                    <c:if test="${member.isFollow != 0}">
                           <button type="button" class="followBtn-sell" style="width:100%; height: 100%;"><img class="followBtm" src="/tresure/resources/images/icon/followSubBtn.png" width="100%" height="70%"></button>
                    </c:if>                
                </div>
            </div>
        </div>
    </div> 
    
    
    <br><br>
    
<!-- ��ǰ & �����ı� ��ư�� -->
    <div class="list-form">
    <fieldset id="mForm">
    	<div class="list-content">
    		<div class="list-a">
    			<button class="market-product"  type="button" onclick="show(this);" id="product" name="show"><span class="rproduct">��ǰ</span></button>
				<button class="market-review" type="button" onclick="show(this);" id="review"name="show"><span class="rrview">�����ı�</span></button>
    		</div>
    		<br><br>
    	</div>
    	
    	
    	
<!-- ��ǰ ��ư Ŭ�� ��, ������ �ڽ� -->   	
    	<div id="productshow" class="box">
	     		<div class="displayList" style="flex-wrap: wrap; display:flex; margin:auto; padding-top:23px; padding-left:15px;">
	     	<c:forEach var="s" items="${sellList}" begin="0" end="${fn:length(sellList)}" step="1" varStatus="status">
	                  <div class="item col-3" style="cursor: pointer; height: 300px;
	                                           width: 200px !important;
	                                           padding: 0px 20px !important;
	                                           margin-bottom:10px !important;">
	                     <div class="item" onclick="sellDetail(${s.sellNo});">
	                        <div id="itemSolid" class="slist-items" style="border: 1px solid rgb(238, 238, 238)">
	                           <c:if test="${s.imgSrc != null}">
	                           <img src="${s.imgSrc}" width="100%" height="150px;"
	                              class="rounded float-start" alt="" style="">
	                           </c:if>
	                           <c:if test="${s.imgSrc == null}">
	                           
	                           </c:if>
	                           <div class="price-time"
	                              style="margin-block-start: -0.33em; margin-block-end: 1.67em;">
	                              <h4 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">&nbsp;${s.sellTitle}</h4>
	                              <p>&nbsp;�� &nbsp;${s.heartNum}</p>
	                           </div>
	                           <div class="price-time">
	                              <p class="displayPrice">&nbsp;${s.price}��</p>
	                              <h5 class="displayTime">&nbsp;${s.createDate}
	                               
	                              	 
	                              </h5>
	                              <c:if test="${s.sellStatus eq 'I' }">
	                           <h5 class="sellStatus">�Ǹ���</h5>
	                           </c:if>	
	                           <c:if test="${s.sellStatus eq 'C' }">
	                           <h5 class="sellStatus">�ǸſϷ�</h5>
	                           </c:if>
	                             
	                              
	                           </div>
	                           
	                        </div>
	                     </div>
	                  </div>
	       </c:forEach> 
	      </div>
       </div>
       
       
       
<!-- �����ı� ��ư Ŭ�� ��, ������ �ڽ� -->       
       <div class="box box2" id="reviewshow" style="display:none;">
       <c:forEach var="r" items="${reviewList}" begin="0" end="${fn:length(reviewList)}" step="1" varStatus="status">
       <div class="review-table">
    <table>
    
        <tr>
       
        <td class="review-profile"> 
           <c:if test="${r.ravg> 4.5}"> 
                                 <img src="/tresure/resources/images/icon/grade_3.png" height="100%" width="100%"/>
                              </c:if> 
                              <c:if test="${ 4 <= r.ravg && r.ravg < 4.5 }"> 
                                 <img src="/tresure/resources/images/icon/grade2.png" height="100%" width="100%"/> 
                              </c:if> 
                              <c:if test="${ 3.5 <= r.ravg && r.ravg < 4 }"> 
                                 <img src="/tresure/resources/images/icon/grade1.png" height="100%" width="100%"/> 
                              </c:if>
                              <c:if test="${ r.ravg== null  ||r.ravg < 3.5 }">
                                 <img src="/tresure/resources/images/icon/grade0.png" height="100%" width="100%"/>
                              </c:if>  

           </td>
        <td><h3>${r.userNo }ȣ��</h3></td>
        <td>${r.revContent }</td>
        <td>${r.createDate }</td>
    </tr>
    </table>
</div>
</c:forEach>
       
       </div>
       
   
   </fieldset>
    </div> 
</div>
    
     <jsp:include page="../common/footer.jsp"/>
     
     <script>
	 	$(document).on("click", ".followBtn-sell", (e) => {
			if ("${loginUser.userNo}" == "${s.userNo}") {
				alert("���� �� �ڽ��� �ȷο� �� ���� �����ϴ�.");
				return;
			}
	
			$(e.target).parent().removeClass("followBtn-sell"); // �ߺ� �̺�Ʈ ������ ���� class�� ����. (class�� �����ϸ� �� �̻� �̺�Ʈ �߻� ����)
			let fwId = ${member.userNo};
			$.ajax({
				url : '${pageContext.request.contextPath}/follow/addFollow',
				type : "post",
				data : {fwId : fwId},
				dataType : "json",
				success : function(data) {
					let result = Number(data.result);
					if (result == 1) {
						$(".followBtm").attr("src", $(".followBtm").attr("src").replace("followAddBtn.png", "followSubBtn.png"));
						alert("�ȷο� �Ǿ����ϴ�.");
						location.reload();
					} else if (result == 2) {
						if (confirm("�̹� �ȷο� �߽��ϴ�.\n�ȷο츦 ����Ͻðڽ��ϱ�?")) {
							$.ajax({
								url : '${pageContext.request.contextPath}/follow/delFollow',
								type : "post",
								data : {fwId : fwId},
								dataType : "json",
								success : function(data) {
									let count = Number(data.result)
									if (count == 1) {
										alert("�ȷο찡 ��ҵǾ����ϴ�.");
										$(".followBtm").attr("src", $(".followBtm").attr("src").replace("followSubBtn.png", "followAddBtn.png"));
										location.reload();
									} else {
										alert("�ȷο� ��ҿ� �����Ͼ����ϴ�.");
									}
								},
								error : function() {
									alert("����!!!");
									console.log("����");
								}
							});
						}
					} else {
						alert("������ �߻�!!")
					}
					console.log(data);
				},
				error : function() {
					alert("������ �߻�.");
					console.log("����");
				},
				complete : function () {
					$(e.target).parent().addClass("followBtn-sell");
				}
			})
	
		    });

     </script>
     
     <script>
		function sellDetail(sellNo){
			location.href = "${pageContext.request.contextPath}/sell/sellDetail/"+sellNo;
		}
     </script>
      
</body>
</html>