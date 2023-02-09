package com.kh.tresure.purchase.model.service;

import com.kh.tresure.purchase.model.vo.Purchase;

public interface PurchaseService {

	// 상품 구매 
	public int purchaseComplete(Purchase purchase);

}
