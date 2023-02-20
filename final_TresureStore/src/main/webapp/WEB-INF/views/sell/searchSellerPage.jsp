<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/tresure/resources/css/common/home.css">
<link rel="stylesheet" href="/tresure/resources/css/mypage/mypageMain.css">
<link rel="stylesheet" href="/tresure/resources/css/common/font.css">
<link rel="stylesheet" href="/tresure/resources/css/sell/sellerPage.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<script type="text/javascript" src="/tresure/resources/js/mypageMain.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/sideBar.jsp" />

	<div class="main-section">

		<div class="content2">

			<div class="profile">

				<!-- 상점 등급 이미지 나오는 박스 -->
				<div class="profile-image">

					<c:if test="${reviewAvg > 4.5}">
						<img src="/tresure/resources/images/icon/backGray_grade3.png"
							height="100%" width="100%" />
					</c:if>
					<c:if test="${ 4 <= reviewAvg && reviewAvg < 4.5 }">
						<img src="/tresure/resources/images/icon/backGray_grade2.png"
							height="100%" width="100%" />
					</c:if>
					<c:if test="${ 3.5 <= reviewAvg && reviewAvg < 4 }">
						<img src="/tresure/resources/images/icon/backGray_grade1.png"
							height="100%" width="100%" />
					</c:if>
					<c:if test="${ reviewAvg == null  || reviewAvg < 3.5 }">
						<img src="/tresure/resources/images/icon/backGray_grade0.png"
							height="100%" width="100%" />
					</c:if>


				</div>
				<br> <a class="market-grade" data-toggle="modal" data-target="#myModal">상점등급 안내</a>
					<div class="modal fade" id="myModal" data-backdrop="static"
					data-keyboard="false">
					<div class="modal-dialog modal-xl modal-dialog-centered">

						<div class="modal-content"
							style="width: 700px; height: 580px; margin: auto;">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">등급 안내</h4>
								<button type="button" class="close" data-dismiss="modal">
									<img src="/tresure/resources/images/icon/x-modalImage.png"
										width="35px" height="30px" style="margin-top: 5px;">
								</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body"
								style="position: relative; flex: 1 1 auto; padding: 2rem;">
								<img class="card-img-top rounded img-fluid"
									src="/tresure/resources/images/icon/그림1.png">
							</div>

						</div>
					</div>
				</div>
					
			</div>

			<!-- 상점명 & 개업날짜 & 팔로워수 & 판매상품수 & 상점신고수 내용 박스 -->
			<div class="info">
				<div class="info-table">

					<div class="market-name"
						style="margin-top: 55px; margin-bottom: 10px;">상점
						${sellerUserno} 호점</div>

					<div class="info-list">
						<div class="market-open">
							<img src="/tresure/resources/images/icon/상점오픈.png" width="20"
								height="15" alt="상점오픈일 아이콘"> &nbsp;상점오픈일
							<div class="market-opendate">
								<span>${member.marketOpen }</span>일전
							</div>
						</div>

						<div class="follower">
							<img src="/tresure/resources/images/icon/팔로워.png" width="20"
								height="15" alt="팔로워 아이콘"> &nbsp;팔로워
							<div class="market-follower">
								<span>${member.followCount }</span> 명
							</div>
						</div>

						<div class="sell-product">
							<img src="/tresure/resources/images/icon/판매수.png" width="20"
								height="15" alt="상품판매 아이콘"> &nbsp;상품판매
							<div class="market-sell">
								<span>${member.sellCount }</span> 회
							</div>
						</div>

						<div class="report">
							<img src="/tresure/resources/images/icon/신고수.png" width="20"
								height="15" alt="신고 아이콘"> &nbsp;신고
							<div class="market-report">
								<span>${member.reportCount}</span>회
							</div>
						</div>
						<br> <br>
					</div>
					<br> <br> <br>


					<div class="followAddOrSubBox" style="margin-left: 290px;">
						<c:if test="${loginUser == null || member.isFollow == 0}">
							<button type="button" class="followBtn-sell"
								style="width: 100%; height: 100%;">
								<img src="/tresure/resources/images/icon/followAddBtn.png"
									width="100%" height="70%">
							</button>

						</c:if>
						<c:if test="${loginUser != null && member.isFollow != 0}">
							<button type="button" class="followBtn-sell"
								style="width: 100%; height: 100%;">
								<img class="followBtm"
									src="/tresure/resources/images/icon/followSubBtn.png"
									width="100%" height="70%">
							</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>


		<br> <br>

		<!-- 상품 & 상점후기 버튼들 -->
		<div class="list-form">
			<fieldset id="mForm">
				<div class="list-content">
					<div class="list-a">
						<button class="market-product" type="button" onclick="show(this);"
							id="product" name="show">
							<span class="rproduct">상품</span>
						</button>
						<button class="market-review" type="button" onclick="show(this);"
							id="review" name="show">
							<span class="rrview">상점후기</span>
						</button>
					</div>
					<br> <br>
				</div>




				<!-- 상품 버튼 클릭 시, 나오는 박스 -->
				<div id="productshow" class="box">
					<div class="displayList"
						style="flex-wrap: wrap; display: flex; margin: auto; padding-top: 23px;">
						<c:forEach var="s" items="${sellList}" begin="0"
							end="${fn:length(sellList)}" step="1" varStatus="status">
							<div class="item col-3">
								<div class="item" onclick="sellDetail(${s.sellNo})">
									<div id="itemSolid" class="slist-items">
										<c:if test="${s.imgSrc != null}">
											<c:if test="${s.crawl.equals('Y')}">
												<img src="${s.imgSrc}" width="100%" height="150px;"
													class="rounded float-start" alt="">
											</c:if>
											<c:if test="${s.crawl.equals('N')}">
												<img src="${pageContext.request.contextPath}${s.imgSrc}"
													width="100%" height="150px;" class="rounded float-start"
													alt="">
											</c:if>
											 <c:if test="${s.sellStatus eq 'C' }">
	                              <div class="over-img">
	                      		  </div>
	                      		  <div class="text-c" style="color: white;
								    margin-left: 71px;
								    margin-top: -93px;
								    margin-bottom: 75px;">
	                      		  <h3>판매완료</h3>
	                      		  </div>
	                             
	                              </c:if>
										</c:if>
										<div class="price-time">
											<span>&nbsp;${s.sellTitle}</span><br> <br>
											<div class="price-time2">
												<br> &nbsp;<img
													src="/tresure/resources/images/icon/heart.png" width="15px"
													height="15px" style="margin-top: 2px;">&nbsp;${s.heartNum}
												&nbsp;&nbsp;&nbsp;${s.timeago} <br> <span
													style="font-size: 33px; color: black;">${s.price}원</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>





				<!-- 상점후기 버튼 클릭 시, 나오는 박스 -->
				<div class="box box2" id="reviewshow"
					style="display: none; border: 4px solid #ffe8cb; border-radius: 12px;">
					<c:forEach var="r" items="${reviewList}" begin="0"
						end="${fn:length(reviewList)}" step="1" varStatus="status">
						<div class="review-table">
							<table style="width: 800px; margin-left: 140px;">

								<tr>

									<td class="review-profile"><c:if test="${r.ravg> 4.5}">
											<img src="/tresure/resources/images/icon/grade_3.png"
												height="100%" width="100%" />
										</c:if> <c:if test="${ 4 <= r.ravg && r.ravg < 4.5 }">
											<img src="/tresure/resources/images/icon/grade2.png"
												height="100%" width="100%" />
										</c:if> <c:if test="${ 3.5 <= r.ravg && r.ravg < 4 }">
											<img src="/tresure/resources/images/icon/grade1.png"
												height="100%" width="100%" />
										</c:if> <c:if test="${ r.ravg== null  ||r.ravg < 3.5 }">
											<img src="/tresure/resources/images/icon/grade0.png"
												height="100%" width="100%" />
										</c:if></td>
									<td><h3>${r.userNo }호점</h3></td>
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

	<jsp:include page="../common/footer.jsp" />

	<script>
		$(document).on("click", ".followBtn-sell", (e) => {
			if("${loginUser.userNo}" == "") {
				Swal.fire({
	                icon: 'error',
	                title: '로그인 후 가능합니다.'
				})
				setTimeout(function() {
		            	  location.reload();
		            	}, 1000);
				return;
			} else {
				if ("${loginUser.userNo}" == "${s.userNo}") {
			   				Swal.fire({
				                icon: 'error',
				                title: '내가 나 자신을 팔로우 할 수는 없습니다.'                  
				            });
					return;
				}
			}
				
			$(e.target).parent().removeClass("followBtn-sell"); // 중복 이벤트 방지를 위해 class를 제거. (class를 제거하면 더 이상 이벤트 발생 안함)
			let fwId = ${member.userNo};
			$.ajax({
				url : '${pageContext.request.contextPath}/follow/addFollow',
				type : "post",
				data : {fwId : fwId},
				dataType : "json",
				success : function(data) {
					let result = Number(data.result);
					if (result == 1) {
						Swal.fire({
		 	   		        icon: 'success',
		 	   		        title: '팔로우 되었습니다.'
						});
						
	 	   		        setTimeout(function() {
	  	            	  location.reload();
	  	            	}, 1000);
					} else if (result == 2) {
						Swal.fire({
							icon:'question',
							text:'이미 팔로우 했습니다. 팔로우를 취소하시겠습니까?',
							showCancelButton: false,
							confirmButtonText: '네',
							allowOutsideClick : true
						}).then(function(){
							   follow();
						})
				} else {
					Swal.fire({
		                icon: 'error',
		                title: '로그인 후 가능합니다.'
					})
				}
				console.log(data);
			},
			error : function() {
				alert("오류가 발생.");
				console.log("오류");
			},
			complete : function () {
				$(e.target).parent().addClass("followBtn-sell");
			}
		})
	
	    });
     </script>
     
     <script>
	     function follow(){
	    	 	let fwId = ${member.userNo};
	  		$.ajax({
	  			url : '${pageContext.request.contextPath}/follow/delFollow',
	  			type : "post",
	  			data : {fwId : fwId},
	  			dataType : "json",
	  			success : function(data) {
	  				let count = Number(data.result)
	  				if (count == 1) {
	  					
	   	   	   				Swal.fire({
	   	   		                icon: 'success',
	   	   		                title: '팔로우 취소되었습니다.',
	   	   		            	showConfirmButton: false,
	   	   		           		allowOutsideClick : false,
	   	   		            });
	   	   	   				
	  					$(".followBtm").attr("src", $(".followBtm").attr("src").replace("followSubBtn.png", "followAddBtn.png"));
	  					setTimeout(function() {
	    	            	  location.reload();
	    	            	}, 1300);
	  				} else {
	   	   	   				Swal.fire({
	   	   		                icon: 'error',
	   	   		                title: '팔로우 취소 실패되었습니다.'                  
	   	   		            });
	  				}
	  			},
	  			error : function() {
	  				alert("오류!!!");
	  				console.log("오류");
	  			}
	  		});
	  		
	  	}
     </script>

	<script>
		function sellDetail(sellNo){
			location.href = "${pageContext.request.contextPath}/sell/sellDetail/"+sellNo;
		}
		
		$(document).ready(function() {
			var keyword = "${sellerUserno}"; 
			
			if(keyword != "") {  //검색어 부분 유지하기
				$("#search").val( keyword+"호점" );
			}
		});
     </script>

</body>
</html>