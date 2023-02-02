<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-content"
		style="width: 800px; height: 600px; margin-top: 150px; margin-left: -125px;">
		<div class="modal-header" style="background-color: #fff5ba;">
			<h5 class="modal-title" id="exampleModalLabel"
				style="margin-left: 42%; font-size: 30px;">상점 후기 수정</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal"
				aria-label="Close"></button>
		</div>
		<div class="modal-body" style="text-align: center;">

			<form id="reviewUpdateForm">

				<div class="star-rating">
					<input type="radio" id="5-stars" name="rating" value="5" /> <label
						for="5-stars" class="star">&#9733;</label> 
					
					<input type="radio" id="4-stars" name="rating" value="4" /> <label for="4-stars"
						class="star">&#9733;</label> 
					
					<input type="radio" id="3-stars" name="rating" value="3" /> <label for="3-stars" class="star">&#9733;</label>
					
					<input type="radio" id="2-stars" name="rating" value="2" /> <label
						for="2-stars" class="star">&#9733;</label> 
						
					<input type="radio" id="1-star" name="rating" value="1" /> <label for="1-star"
						class="star">&#9733;</label>
				</div>
				<div class="mb-3" style="margin-top: 50px;">
					<label for="exampleInputEmail1" class="form-label">후기 내용</label>
					<textarea name="reviewContent" class="form-control"
						id="reviewContent" aria-describedby="emailHelp"
						style="width: 700px; margin: auto; height: 140px;"></textarea>
					<div id="emailHelp" class="form-text">소중한 후기 작성해주세요 ^ㅁ^</div>
				</div>

				<input type="hidden" th:value="${p.sellNo}" name="sellNo">

			</form>
		</div>
		<div class="modal-footer">
			<button type="button" onclick="reviewInsert();"
				class="btn btn-primary">수정하기</button>
		</div>
	</div>
</body>
</html>