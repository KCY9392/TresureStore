<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/tresure/resources/css/common/header.css">
<link rel="stylesheet" href="/tresure/resources/css/font.css">
<!-- Alert 창  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="headerbar">
		<div class="header1">
			<div class="header2">
				<div class="header3">
					<a href="${pageContext.request.contextPath}" class="logo"> <img
						src="/tresure/resources/images/icon/icon.png" width="136" height="80"
						alt="보물상점 로고">
					</a>
					<form id="sfm" action= "${pageContext.request.contextPath}/sell/search" enctype="multipart/form-data" method="post">
					<div class="search1">
						<div class="search2">
							<input onclick="checkInput(this.form)" type="text" id="search" class="search3"
								placeholder=" 상품명 , @상점명 입력해주세요" name="search">
								<img onclick="test()" class="exx" id="exit"
									src="/tresure/resources/images/icon/x.png"
									width="10" height="12" alt="검색어 삭제 버튼 아이콘">
							<a class="searchicon"> <img
								src="/tresure/resources/images/icon/search.png" width="85%"
								height="92%" alt="검색 버튼 아이콘" id="searchGO">
							</a>
						</div>
					</div>
					</form>
					<div class="etIgxm">
					  <!-- 본인인증 방법 로그인 O && 카카오로그인 X -->
						<c:if test="${loginUser.phone != null && access_Token == null}">
							<a class="accountBankButton" id="tresureAccount">
							<img src="https://cdn-icons-png.flaticon.com/512/1424/1424949.png " width="20px;"> 계좌 등록</a>
							
							<a href="/tresure/logout" class="items">
								${loginUser.userName}님 환영합니다^ㅁ^<br> 로그아웃
							</a>
						</c:if>
						
					  <!-- 본인인증 로그인 X && 카카오로그인 O -->	
					  	<c:if test="${loginUser.phone == null && access_Token != null}">
					  		<a class="accountBankButton" id="tresureAccount">
							<img src="https://cdn-icons-png.flaticon.com/512/1424/1424949.png " width="20px;"> 계좌 등록</a>
					  	
					  		<a href="https://kauth.kakao.com/oauth/logout?client_id=2f3c85098b01f4c1919eb4761e43a541&logout_redirect_uri=http://localhost:8888/tresure/logout/kakao" class="items">
					  			${loginUser.userName}님 환영합니다^ㅁ^<br> 로그아웃
					  		</a>
					    </c:if>
					    
					  <!-- 본인인증 로그인 X && 카카오로그인 X -->
						<c:if test="${loginUser.phone == null && access_Token == null}">
							<a href="/tresure/loginJoinForm" class="items">
								<p>로그인/회원가입</p>
							</a>
						</c:if>
						
						<input type="hidden" value="${p.rev_is}" name="accStatus">
					</div>

				</div>
				
				<a href="${pageContext.request.contextPath}/common/admin" style="float:right; font-size:15px;">관리자 페이지</a> 
				
				<div class="sun_wrap">
					<div class="sun_wrap_div">
						<a href="#" class="sun_wrap_div_cate" id="sun_wrap_div_cate">
							<span class="onecate"></span> <span class="onecate"></span> <span
							class="onecate"></span>
						</a>

					</div>
					<div class="sun_wrap_li">
						<ul id="sun_wrap_ul">
							
							<li><a href="${pageContext.request.contextPath}/chat/chatRoomList" class="checkUserNo"><img
									src="/tresure/resources/images/icon/번개.png" alt="채팅 이미지">채팅하기</a></li>
                  
							<li><a onclick="sellGo()" class="checkUserNo">
								<img src="/tresure/resources/images/icon/원.png" alt="판매등록 이미지"> 판매하기</a></li>
							
							<li><a href="${pageContext.request.contextPath}/report/reportSearch"><img
									src="/tresure/resources/images/icon/사기조회.png" alt="사기조회 이미지">사기조회</a></li>
							<li><a href="${pageContext.request.contextPath}/member/myPage" class="checkUserNo"><img
									src="/tresure/resources/images/icon/내상점.png" alt="내상점 이미지">내상점</a></li>
						</ul>
					</div>
				</div>
				<div class="catebox3">

					<ul class="inner-menu">
						<li class="catebox cate1"><a href="${pageContext.request.contextPath}/sell/category/1"><img
								src="/tresure/resources/images/icon/star.png" width="40px"
								height="35px"><br>인기매물</a></li>
						<li class="catebox cate2"><a href="${pageContext.request.contextPath}/sell/category/10"><img
								src="/tresure/resources/images/icon/디지털기기.png" width="40px"
								height="35px"><br>디지털기기</a></li>
						<li class="catebox cate3"><a href="${pageContext.request.contextPath}/sell/category/20"><img
								src="/tresure/resources/images/icon/가전제품.png" width="40px"
								height="35px"><br>생활가전</a></li>
						<li class="catebox cate4"><a href="${pageContext.request.contextPath}/sell/category/30"><img
								src="/tresure/resources/images/icon/유아용품.png" width="40px"
								height="35px"><br>유아용품</a></li>
						<li class="catebox cate5"><a href="${pageContext.request.contextPath}/sell/category/40"><img
								src="/tresure/resources/images/icon/패션.png" width="40px"
								height="35px"><br>패션</a></li>
						<li class="catebox cate6"><a href="${pageContext.request.contextPath}/sell/category/50"><img
								src="/tresure/resources/images/icon/도서.png" width="40px"
								height="35px"><br>도서</a></li>
						<li class="catebox cate7"><a href="${pageContext.request.contextPath}/sell/category/60"><img
								src="/tresure/resources/images/icon/반려동물용품.png" width="40px"
								height="35px"><br>반려동물용품</a></li>
						<li class="catebox cate8"><a href="${pageContext.request.contextPath}/sell/category/70">&nbsp;&nbsp;<img
								src="/tresure/resources/images/icon/스포츠.png" width="40px"
								height="35px"><br>스포츠
						</a></li>
						<li class="catebox cate9"><a href="${pageContext.request.contextPath}/sell/category/80"><img
								src="/tresure/resources/images/icon/뷰티.png" width="40px"
								height="35px"><br>뷰티</a></li>
						<li class="catebox cate10"><a href="${pageContext.request.contextPath}/sell/category/90"><img
								src="/tresure/resources/images/icon/교환권.png" width="40px"
								height="35px"><br>교환권</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		
		//카테고리 클릭시 해당 카테고리로 이동
		function Gocategory(categoryCode){
			location.href = "${pageContext.request.contextPath}/sell/category/"+categoryCode;
		}
		
		
		//계좌번호 등록 alert
		 $('#tresureAccount').on('click', function(){
			 
			 var accountNum = /^[0-9]*$/;
			 var accountExist = document.getElementById('accountEnroll');
			 
			 Swal.fire({
		 		  title: '계좌 등록하기',
		 		  text: '등록할 계좌번호를 숫자만 입력해주세요.',
		 		  input: 'text',
		 		  showCancelButton: true,
		 		  cancelButtonText: '취소',
		 		  confirmButtonText: '등록',
		 		  confirmButtonColor: 'gold',
		 		  allowOutsideClick : false
				}).then(function(account) {
				    if (account.value) {
				    	if(accountNum.test(account.value)){
				    		if(accountAdd(account.value) == null){
						    	Swal.fire('계좌 등록 완료!', "", "success");
						    	//accountAdd(account.value);
						        console.log("Result: " + account.value);
				    		}else{
				    			Swal.fire('', "계좌가 이미 등록 되어있어요", "info");
				    			console.log("Result2: " + account.value);
				    		}
				    		
				    	} else{
				    		Swal.fire('계좌 등록 실패!', "숫자만 입력해주세요.", "warning");
				    	}
				    }
				})
		 });
		 
		
		let userNo2 =  "${loginUser.userNo}";
		
		 //계좌 추가
		 function accountAdd(value){
				
				$.ajax({
					url : "${pageContext.request.contextPath}/member/account",
					type : "post",
					data : {account : value,
							userNo : userNo2},
					success : function(result){
						if(result){
							console.log(result+"result값");
							console.log(userNo2+">> 유저번호 조회");
							console.log(value+">> 계좌번호 조회");
						} else if(result > 1){
							$.ajax({
								url : "${pageContext.request.contextPath}/member/accountUpdate",
								type : "post",
								data : {account : value,
										userNo : userNo2},
								success : function(result){
									if (result) {
										console.log(result+"update 계좌 값");
										console.log(userNo2+">> 유저번호 조회");
										console.log(value+">> 계좌번호 조회");
									}else{
										console.log(update+">> 계좌번호 수정실패");
									}
								}
							})
						}
					},
					error : function(){
						console.log("통신실패");
					}
				});
	    }; 
	    
	    
	  //판매하기 버튼 클릭 시
	    function sellGo(){
	    	$.ajax({
	    		url : "${pageContext.request.contextPath}/member/sellEnter",
	    		type : "post",
	    		data : {userNo : userNo2},
	    		success : function(result){
	    			if(result){
	    				location.href = "${pageContext.request.contextPath }/sell/sellInsertForm";
	    			}else{
	    				Swal.fire('계좌 등록 후, 판매글 등록이 가능합니다.', "", "error");
	    			}
	    		},
 				error : function(){
 					console.log("판매하기 버튼 통신실패");
 				}
	    	});
	    }

		
	    $(".checkUserNo").on('click',function(){
	    	if(!userNo2){
	    		
	    		Swal.fire({
	                icon: 'error',
	                title: '로그인 후 가능합니다.'                  
	            });		
	    		return false;
	    		
	    	}
	    });
		
	</script>
</body>
</html>