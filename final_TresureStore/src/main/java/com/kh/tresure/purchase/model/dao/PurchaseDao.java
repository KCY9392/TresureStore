package com.kh.tresure.purchase.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.purchase.model.vo.Purchase;

@Repository
public class PurchaseDao {


	// 상품 구매 
	public int purchaseComplete(SqlSession sqlSession, Purchase purchase) {
		return sqlSession.insert("purchaseMapper.purchaseComplete", purchase);
	}

	// 구매한 상품 상태값 C로 변경
	public int purchaseSellStatusC(SqlSession sqlSession, Purchase purchase) {
		return sqlSession.update("purchaseMapper.purchaseSellStatusC", purchase);
	}
}
