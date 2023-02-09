/**
 * payment.js
 */
 
 	
 	
 	
 	
 	
 
 
	 function requestPay(sellTitle, price, userNo, userNo2, context) {
	 		
	 		console.log(sellTitle);
	 		console.log(price);
	 		console.log(userNo); //구매자번호
	 		console.log(userNo2); //판매자번호
	 		console.log(context);
	 		
			var context = '${pageContext.request.contextPath}';

			const make_merchant_uid = () => {
				const current_time = new Date();
				const year = current_time.getFullYear().toString();
				const month = (current_time.getMonth()+1).toString();
				const day = current_time.getDate().toString();
				const hour = current_time.getHours().toString();
				const minute = current_time.getMinutes().toString();
				const second = current_time.getSeconds().toString();
				const merchant_uid = 'TRESURE' + year + month + day + hour + minute + second;
			
				return merchant_uid;
			};
			
			const merchant_uid = make_merchant_uid();
	 
	 
	 
			  IMP.init('imp14878074'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
			  
			  IMP.request_pay({
			    pg: "html5_inicis", //또는 ,kakaopay.TC0ONETIME
			    pay_method: "card",
			    merchant_uid : merchant_uid,    //'merchant_'+new Date().getTime(),
			    name : sellTitle,
			    amount : price,
			    buyer_email : 'tresure@tresure.do',
			    buyer_name : userNo
			    //buyer_tel : '010-1234-5678',
			  }, function (rsp) {
				console.log(rsp);
					if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
			                
							// 주문정보 생성 및 테이블에 저장 
							$.ajax({
								url: "purchase/complete", 
								type: "POST",
								data : {
									"amount" : price,
									"name" : sellTitle,
									"merchant_uid" : merchant_uid
								},
								success: function(rsp) {
							          if (rsp) {
							              alert("완료");
							          } else {
							              alert("전송된 값 없음");
							          }
							    },
							    error: function() {
							          alert("ajax 에러 발생");
							    }
							})
						} else {
						Swal.fire({
								title: '결제 실패',
								text: '다시 결제해주세요.',
								icon:'error'
								})
						}
						
				});
			  
	}
	
	
	
	
		