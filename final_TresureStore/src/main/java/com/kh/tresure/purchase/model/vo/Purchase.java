package com.kh.tresure.purchase.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Purchase {

	private int purNo; //구매 고유 번호
	private int userNo; // 구매상품 회원 번호
	private int sellNo; // 판매상품 회원 번호
	private Date createDate; //구매날짜
	private int price;
	private String orderNo;
	
	private String sellTitle; //상품명
	
	
}
