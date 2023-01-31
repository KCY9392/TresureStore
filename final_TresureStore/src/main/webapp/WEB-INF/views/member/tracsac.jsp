<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body>
   <jsp:include page="../common/header.jsp"/>
   <jsp:include page="../common/sideBar.jsp"/>

   <div class="main-section">
   <div class="content2">
   

    <div class="list-form">
   
   
   <div class="list-content">
          <div class="list-b">
             <button class="sell-trac"  type="button" onclick="show(this);" id="s" name="show"><span class="sell-trac">판매</span></button>
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
                        <th scope="col" style="text-align: center;" width="20%">사진</th>
                        <th scope="col" width="200px">상품명</th>
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
                              <td scope="col">${s.price }원</td>
                              <td scope="col">${s.heartNum }</td>
                              <td scope="col">${s.createDate }</td>
                              <td scope="col"><c:if test="${s.sellStatus eq 'I' }">
                                 <h5 class="sellStatus">판매중</h5>
                                 </c:if>   
                                 <c:if test="${s.sellStatus eq 'C' }">
                                 <h5 class="sellStatus">판매완료</h5>
                                 </c:if>
                                 </td>
                                 <td><button type="button" class="reviewB" onclick="changeStatus(${s.sellNo});">상태 변경</button></td>

                        </tr>

                     </c:forEach>
                     
                     
                  </tbody>
               </table>
            </div>
         </div>
         
         
         <div id="pshow" class="box">   
            <div class="list-area">
                  
                    
                  <br>
                  <table class="table table-hover list">
                     <thead>
                        <tr>
                           <th scope="col" style="text-align: center;" width="20%">사진</th>
                           <th scope="col" style="padding-left: 10px;" width="35%">상품명</th>
                           <th scope="col" width="20%">가격</th>
                           <th scope="col" width="20%">날짜</th>
                           <th scope="col" width="5%">후기</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="p" items="${purchaseList}" begin="0" end="${fn:length(purchaseList)}" step="1" varStatus="status">
                        
                        
                              <tr>
                                 <td scope="col">
                                    <c:if test="${p.imgSrc != null}">
                                       <img src="${p.imgSrc}" width="100%" height="150px;"
                                       class="rounded float-start" alt="">
                                    </c:if>
                                    
                                 </td>
                                 <td scope="col"> ${p.sellTitle}</td>
                                 <td scope="col">${p.price }원</td>
                                 <td scope="col">${p.createDate }</td>
                                 <c:if test="${p.rev_is == 'N'}">
                                    <td><button type="button" class="reviewB" data-bs-toggle="modal" data-bs-target="#exampleModal" id="write" >작성하기</button></td>
                                 </c:if>
                                 <c:if test="${p.rev_is != 'N'}">
                                    <td><button type="button" class="reviewB" data-bs-toggle="modal" data-bs-target="#exampleModal" id="write">수정하기</button></td>
                                 </c:if>
                              </tr>
                              
                        </c:forEach>
                        
                        
                     </tbody>
                  </table>
               </div>
         </div>
         
         <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog">
             <div class="modal-content" style="width: 800px;
                                  height: 600px;
                                  margin-top: 150px;
                                  margin-left: -125px;">
               <div class="modal-header" style="background-color: #fff5ba;">
                 <h5 class="modal-title" id="exampleModalLabel" style="margin-left: 42%; font-size: 30px;">상점 후기 작성</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body" style="text-align: center;">
                 <!-- Login -->
                 <form>
                 
                    <div class="star-rating">
                    <input type="radio" id="5-stars" name="rating" value="5" />
                    <label for="5-stars" class="star">&#9733;</label>
                    <input type="radio" id="4-stars" name="rating" value="4" />
                    <label for="4-stars" class="star">&#9733;</label>
                    <input type="radio" id="3-stars" name="rating" value="3" />
                    <label for="3-stars" class="star">&#9733;</label>
                    <input type="radio" id="2-stars" name="rating" value="2" />
                    <label for="2-stars" class="star">&#9733;</label>
                    <input type="radio" id="1-star" name="rating" value="1" />
                    <label for="1-star" class="star">&#9733;</label>
                  </div>
                   <div class="mb-3" style="margin-top: 50px;">
                     <label for="exampleInputEmail1" class="form-label">Email address</label>
                     <textarea class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" style="    width: 700px;
    margin: auto;
    height: 140px;
}"></textarea>
                     <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                   </div>
                   
                   
                 </form>
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                 <button type="submit" class="btn btn-primary">Submit</button>
               </div>
             </div>
           </div>
        </div>
      
      </div>
      </div>


   </div>
   
   <script>
     function changeStatus(sellNo){
        var sellNum = $('.sellNo').val();
        
        
        
        $.ajax({
           url : '${pageContext.request.contextPath}/changeStatus',
             type : 'post',
            data : {sellNo :sellNo},
            success : function(result){
                   if(result == 1) {
                      
                       alert("상태 변경");
                         location.reload();
                   }
             },
             error:function(){
                  console.log("실패");
               }
              
        });
       
        
     };
     
   
   </script>
   
   <script>
      const emailInputEl = document.querySelector('#exampleInputEmail1')
      const modalEl = document.querySelector('#exampleModal')
   
      modalEl.addEventListener('shown.bs.modal', function () {
        emailInputEl.focus()
      })
   </script>

   

   <jsp:include page="../common/footer.jsp" />
</body>
</html>