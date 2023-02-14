<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="/tresure/resources/js/header.js"></script>
<script type="text/javascript" src="/tresure/resources/js/sellInsert.js"></script>
<link rel="stylesheet" href="/tresure/resources/css/sell/sellInsert.css">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sideBar.jsp"/>

	<div class="sellInsert-div">
		<form id="sellInsertForm" action= "${pageContext.request.contextPath}/sell/sellUpdate" onsubmit="return sell_file();" enctype="multipart/form-data" method="post">
			<input type="hidden" name="sellNo" value="${empty s.sellNo ? 0 : s.sellNo }"/>
			<div class="main-section">
				<div class="sellInsert1">           	
					<main class="sellInsert2">
						<section class="sellInsert3">
							<h2 class="sellInsert4">
								판매수정
							</h2>
							<ul id="listBody">
								<!-- image start -->
								<li class="list">
									<div class="image_sub">
										상품이미지<span>*</span><small>(0/3)</small>
									</div>
									<div class="image_con">
										<ul class="sellInsertImages" id="imageList">
 											<li class="imageList" >이미지 등록 <input type="file"
 												 id="inputImage" name="upfile" multiple >
 												 
		
 											</li>
 											
									
												<c:if test="${s.imgList != null}">
												<c:forEach var="img" items="${s.imgList }">
												<li draggable="false" class="registUserImages" id="registUserImages">
										 		<c:if test="${img.fileType eq 'C' }">
													
													<div class="imageRepresentive">대표이미지</div>
												</c:if>
												
												<img src="${pageContext.request.contextPath}${contextPath }${img.filePath}${img.changeName }" alt="상품이미지">
												<input type="hidden" name="originName" value="${img.originName }">
												<input type="hidden" name="changeName" value="${img.changeName }">
												<button type="button" class="image_cancleBtn1" onclick="deleteImage1();">
												</button>
												

												
												</li>
												</c:forEach>
 											</c:if>
 											
										</ul>
										
										<div class="add_description">
											<b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b><br> - 이미지는 상품등록 시
											정사각형으로 짤려서 등록됩니다.<br> - 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.<br>
											- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br> - 큰 이미지일경우 이미지가
											깨지는 경우가 발생할 수 있습니다.<br> 최대 지원 사이즈인 640 X 640 으로 리사이즈 해서
											올려주세요.(개당 이미지 최대 10M)
										</div>
									</div>
								</li>
								<!-- 상품이미지 -->

								<!-- title start -->
								<li class="list">
									<div class="title_insert">
										제목<span>*</span>
									</div>
									<div class="title_insert2">
										<div class="title_insert3">
											<div class="title_insertBox">
												<input type="text" minlength="2" maxlength="40" placeholder="상품 제목을 입력해주세요."
													class="titleInput" id="product_subject"
													name="sellTitle" required value="${s.sellTitle }">
											</div>
											<div class="titleSize">
												<span id="textCount">0/40</span>
											</div>
										</div>
										<div class="subjectDiv" id="subjectDiv">상품명을 2자 이상
											입력해주세요.</div>
									</div>
								</li>
								<!-- 제목 -->

								<!-- category start -->
								<li class="list">
									<div class="category_sub">
										카테고리<span>*</span>
									</div>
									<div class="category_sub">
										<select name="categoryNo" id="category_sub" required>
											<c:forEach var="c" items="${cateList }">
												<option value="${c.categoryNo }"
												<c:if test="${s.categoryName eq c.categoryName }">
															selected="selected"
												</c:if>>
												${c.categoryName }</option>
											</c:forEach>
																						
										</select>
									</div>
								</li>

								<li class="list">
									<div class="price_sub">
										가격<span>*</span>
									</div>
									<div class="price_con">
										<div class="priceBox">
											<input type="text" placeholder="숫자만 입력해주세요."
												class="priceInput" id="product_price" name="price" required maxlength="11" value="${s.price }"/>원
										</div>

									</div>
								</li>
								<!-- 가격 -->

								<!-- content start -->
								<li class="list">
									<div class="content_sub">
										설명<span>*</span>
									</div>
									<div class="content_con">
										<textarea style="resize: none;" rows="10" class="content"
											id="sell_content" name="sellContent" required minlength="10" maxlength="2000" >${s.sellContent }"</textarea>
										<div class="text">
											<div class="limit">상품설명을 10자 이상 입력해주세요.</div>
											<div class="contentSize">
											<span id="contentCount">0/2000</span>
										</div>
										</div>
										
									</div>
									
								</li>
								<!-- 설명 -->
							</ul>
						</section>
					</main>
				</div>

				<!--------- insertBtm : 등록하기  --------->
				<footer class="insertBtm">
					<div class="insertBtmArea">
						
						<button type="submit" id="updateBtn"></button>
					</div>
				</footer>
			</div>
		</form>
	</div>
	<div class="foot"></div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	$(function(){
		if($('.registUserImages').length == 0){
			index = 0;
			$div.addClass('imageRepresentive').text('대표이미지');
		}

	})
	
	</script>
	
	
	<script>
	function deleteImage1() {
		const li = document.getElementById('registUserImages');
		 li.remove();
		 
	}
	</script>
	
	
	

	<script>
	/* 가격 유효성 검사 */
		$("#product_price").on("keyup", function() {
			$("#product_price").val($("#product_price").val().replace(/[^0-9]/g, ""));
		});
		
		/* $("#product_price").on("keyup", function() {
			var oldData = $("#product_price").val().replace(/,/gi, "");
			
			var newData = oldData.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			$("#product_price").val(newData);
		}) */
		
	/* 제목 유효성 검사 */
		$(function() {
			$(".titleInput").keyup(function(){
				let content = $(this).val();
				if($(".titleInput").val().length < 2) {
					$(".subjectDiv").show();
					
				} else {
					$(".subjectDiv").hide();
				}
				$("#textCount").text(content.length + " / 최대 40");
				if (content.length > 40) {
					alert("최대 40자까지 입력 가능합니다.");
					$(this).val(content.substring(0, 40));
					$('#textCount').text("40 / 최대 40");
				}
			})
		})
		
	/* 설명 유효성 검사 */
		$(function() {
			$("#sell_content").keyup(function() {
				let content = $(this).val();
				if($("#sell_content").val().length < 10) {
					$(".limit").show();
					
				} else {
					$(".limit").hide();
				}
				$("#contentCount").text(content.length + " / 최대 2000");
				if (content.length > 200) {
					alert("최대 2000자까지 입력 가능합니다.");
					$(this).val(content.substring(0, 2000));
					$('#contentCount').text("2000 / 최대 2000");
				}
			})
		})
	</script>
	
	
</body>
</html>