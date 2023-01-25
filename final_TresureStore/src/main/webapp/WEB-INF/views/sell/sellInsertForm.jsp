<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form id="sellInsertForm" action= "${pageContext.request.contextPath}/sell/sellInsert" onsubmit="return sell_file();" enctype="multipart/form-data" method="post">
			<div class="main-section">
				<div class="sellInsert1">           
					<main class="sellInsert2">
						<section class="sellInsert3">
							<h2 class="sellInsert4">
								판매등록 <span>필수항목</span>
							</h2>
							<ul id="listBody">
								<!-- image start -->
								<li class="list">
									<div class="image_sub">
										상품이미지<span>*</span><small>(0/3)</small>
									</div>
									<div class="image_con">
										<ul class="sellInsertImages" id="imageList">
 											<li class="imageList">이미지 등록 <input type="file"
 												 id="inputImage" name="upfile" multiple>
 											</li>
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
												<input type="text" placeholder="상품 제목을 입력해주세요."
													class="titleInput" id="product_subject"
													name="sellTitle">
											</div>
											<div class="titleSize">
												<span>최대 40글자</span>
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
										<select name="categoryNo" id="category_sub">
											<option value="">카테고리</option>
											<option value="10">디지털기기</option>
											<option value="20">생활가전</option>
											<option value="30">유아용품</option>
											<option value="40">패션</option>
											<option value="50">도서</option>
											<option value="60">반려동물용품</option>
											<option value="70">스포츠</option>
											<option value="80">뷰티</option>
											<option value="90">교환권</option>
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
												class="priceInput" id="product_price" name="price">원
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
											id="product_content" name="sellContent"></textarea>
										<div class="text">
											<div class="limit">최대 2000자</div>
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
						
						<button type="submit" class="insertBtn" id="insertBtn"></button>
					</div>
				</footer>
			</div>
		</form>
	</div>
	<div class="foot"></div>
	
	<jsp:include page="../common/footer.jsp"/>


	
</body>
</html>