/**
 * payment.js
 */
 
	var context = '${pageContext.request.contextPath}';
 	
 
	 function requestPay(sellTitle, price, userNo,context) {
	 		
	 		console.log(sellTitle);
	 		console.log(price);
	 		console.log(userNo);
	 		console.log(context);
	 		
	 
			  IMP.init('imp14878074'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
			  
			  IMP.request_pay({
			    pg: "html5_inicis", //또는 ,kakaopay.TC0ONETIME
			    pay_method: "card",
			    merchant_uid : 'merchant_'+new Date().getTime(),
			    name : sellTitle,
			    amount : price,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : userNo
			    //buyer_tel : '010-1234-5678',
			    //buyer_addr : '서울특별시 강남구 삼성동',
			    //buyer_postcode : '123-456'
			  }, function (rsp) {
			    	console.log(rsp);
			    if (rsp.success) {
					Swal.fire({
						title: '결제 완료',
						text: sellTitle+'가 결제되었습니다.',
						icon:'success',
						timer: 4000
					}).then((rsp) => {
						location.reload(context);
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
	
	
	
	
		