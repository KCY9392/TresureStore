<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
<link rel="stylesheet" href="/tresure/resources/css/mypage/tracsac.css">

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/header.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/mypageMain.js"></script>
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>

   .sun_wrap_li > ul img{
        margin-top: 5px !important;
     }
   
   .catebox3{
      width: 1000px !important;
   }

   .inner-menu{
      width: 700px !important;
   }
   
   .catebox.cate1, .catebox.cate2, .catebox.cate3, .catebox.cate4{
      margin-right: 40px;
   }
   
   .catebox.cate7, .catebox.cate9, .catebox.cate10{
      margin-left: 30px;
   }
   
   .catebox.cate8{
      margin-left: 50px;
   }
   
   
   .market-open img{
        margin-top: 5px;
     }
     
     .search2{
        margin-top: 0px !important;
     }
     
     .nfavorites{
           padding: 5px 0px !important;
            padding-top: 10px !important;
            height: 80px !important;
     }
     
     .ntheTop{
        height: 40px !important;
     }
     
     
</style>

</head>
<body>
   <jsp:include page="../common/header.jsp"/>
   <jsp:include page="../common/sideBar.jsp"/>

   <div class="main-section">
   <div class="content2">
   

   
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
                        
                        
                              <tr onclick="sellDetail(${s.sellNo})">
                                 <td scope="col">
                                 <div style="display: flex;
       position: relative;">
                                     <c:if test="${s.imgSrc != null}">
                                       <c:if test="${s.crawl.equals('Y')}">
                                          <img src="${s.imgSrc}" width="100%" height="150px;"
                                          class="rounded float-start" alt="">
                                       </c:if>
                                       
                                       <c:if test="${s.crawl.equals('N')}">
                                          <img src="${pageContext.request.contextPath}${s.imgSrc}" width="100%" height="150px;"
                                             class="rounded float-start" alt="">
                                       </c:if>
                                 
                                       <c:if test="${s.sellStatus eq 'C' }">
                                                <div class="over-img">
                                                
                                                <div style="color: white;
       flex-grow: 1;">판매완료</div>
                                               
                                                </div>
                                                
                                               </c:if>
                                    </c:if>
                                    </div>
                                 </td>
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
   
   
   
   
                        </c:forEach>
                        
                        
                     </tbody>
                  </table>
               </div>
            </div>
         
         <div id="pshow" class="box" style="display:none;">   
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
                                    <td><button type="button" class="reviewA" data-bs-toggle="modal" data-bs-target="#review" id="write" >작성하기</button></td>
                                 </c:if>
                                 <c:if test="${p.rev_is != 'N'}">
                                    <td><button type="button" class="reviewB" onclick="reviewDetail(${p.sellNo})" data-bs-toggle="modal" data-bs-target="#review" id="write">수정하기</button></td>
                                 </c:if>
                              </tr>
                              
                              <div class="modal fade" id="review" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                           <div class="modal-dialog">
                               <div class="modal-content" style="width: 800px; height: 670px; margin-top: 150px; margin-left: -125px;">
                              <div class="modal-header" style="background-color: #fff5ba;">
                                 
                                 <h5 class="modal-title" id="exampleModalLabel"
                                    style="margin-left: 42%; font-size: 30px;">
                                    <c:if test="${p.rev_is == 'N'}">
                                    상점 후기 작성
                                    </c:if>
                                    <c:if test="${p.rev_is != 'N'}">
                                    상점 후기 수정
                                    </c:if>
                                    </h5>
                                 <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                              </div>
                              <div class="modal-body" style="text-align: center;">

                                 <form id="reviewForm">
                        
                                    <div class="star-rating" style="margin-top: 25px;">
                                       <input type="radio" id="5-stars" name="rating" value="5" /> <label
                                          for="5-stars" class="star">&#9733;</label> <input type="radio"
                                          id="4-stars" name="rating" value="4" /> <label for="4-stars"
                                          class="star">&#9733;</label> <input type="radio" id="3-stars"
                                          name="rating" value="3" /> <label for="3-stars" class="star">&#9733;</label>
                                       <input type="radio" id="2-stars" name="rating" value="2" /> <label
                                          for="2-stars" class="star">&#9733;</label> <input type="radio"
                                          id="1-star" name="rating" value="1" /> <label for="1-star"
                                          class="star">&#9733;</label>
                                    </div>
                                    <div class="mb-3" style="margin-top: 50px;">
                                       <label for="reviewContent" class="form-label" style="font-size:22px;">후기 내용</label>
                                       <textarea name="reviewContent" class="form-control"
                                          id="reviewContent" aria-describedby="emailHelp"
                                          style="width: 700px; margin: auto; height: 140px; resize: none; font-size: 25px;"></textarea>
                                       <div id="emailHelp" class="form-text" style="font-size:20px;">소중한 후기 작성해주세요 ^ㅁ^</div>
                                    </div>
                        
                                    <input type="hidden" value="${p.sellNo}" name="sellNo" type="number">
                                    <input type="hidden" value="${p.rev_is}" name="reviewIs">
                                 </form>
                              </div>
                              <div class="modal-footer">
                                       <c:if test="${p.rev_is == 'N'}">
                                          <button type="button" onclick="reviewInsertUpdate();"
                                             class="btn btn-primary" id="updateBtn">작성하기</button>
                                       </c:if>   
                                       <c:if test="${p.rev_is != 'N'}">
                                          <button type="button" onclick="reviewInsertUpdate();"
                                             class="btn btn-primary" id="updateBtn">수정하기</button>
                                          <button type="button" onclick="reviewDelete();"
                                             class="btn btn-primary" id="updateBtn">삭제하기</button>
                                       </c:if>
                              </div>
                           </div>
                            </div>
                         </div>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
           </div>
      </div>
   </div>

   
   <script>
      function sellDetail(sellNo){
         location.href = "${pageContext.request.contextPath}/sell/sellDetail/"+sellNo;
      }
   </script>
   
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
     
     
   function reviewInsertUpdate(){
         $.ajax({
            url : '${pageContext.request.contextPath}/reviewInsertUpdate',
            type : 'POST',
            data : $("#reviewForm").serialize(),
            success : function(result){
               if(result == 1){
                  Swal.fire({
                         icon: 'success',
                         title: '성공적으로 후기가 등록되었습니다.'                  
                     });   
                  $('#review').modal('hide')
               }setTimeout(function() {
                      location.reload();
                  }, 2000);
            },
            error : function(xhr, status){
               alert(xhr + ":" +status);
            }
         });
      }
      
      //modal창 밖에 클릭 시, 모달창 사라지게하기
      modalEl.addEventListener("click", e => {
          const evTarget = e.target
          if(evTarget.classList.contains("modalEl")) {
              modalEl.style.display = "none"
          }
      });
   
      
      //수정하기 버튼 클릭 시, 등록 후기 데이터 뿌리기
      function reviewDetail(sellNo){
         $.ajax({
            url : "${pageContext.request.contextPath}/reviewDetail",
            dataType : "json",
            data : {sellNo : sellNo},
            success : function(data){
               console.log(data);
               var r = data;
               $(":radio[name='rating'][value='" + r.revScore + "']").attr('checked', true);
               $("#reviewContent").val(r.revContent);
            },
            error : function(data){
               alert("오류");
            }
         })   
      }


      function reviewDelete(){
         $.ajax({
            url : "${pageContext.request.contextPath}/reviewDelete",
            type : 'POST',
            data : $("#reviewForm").serialize(),
            success : function(result){
               if(result == 1){
                  Swal.fire({
                         icon: 'success',
                         title: '후기가 삭제되었습니다.'                  
                     });   
                  $('#review').modal('hide')
               }setTimeout(function() {
                      location.reload();
                  }, 1500);
            },
            error : function(xhr, status){
               alert(xhr + ":" +status);
            }
         });
      }
   </script>

   <jsp:include page="../common/footer.jsp" />

</body>
</html>