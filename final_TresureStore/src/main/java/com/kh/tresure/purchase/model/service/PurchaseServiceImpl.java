package com.kh.tresure.purchase.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.purchase.model.dao.PurchaseDao;
import com.kh.tresure.purchase.model.vo.Purchase;

@Service
public class PurchaseServiceImpl implements PurchaseService {


	private PurchaseDao purchaseDao;
	private SqlSession sqlSession;
	
	
	// 기본생성자
	public PurchaseServiceImpl() {
		
	}
	
	@Autowired
	public PurchaseServiceImpl(PurchaseDao purchaseDao, SqlSession sqlSession) {
		this.purchaseDao = purchaseDao;
		this.sqlSession = sqlSession;
		
	}	
	
	// 상품 구매 
	@Override
	public int purchaseComplete(Purchase purchase) {
		
		return purchaseDao.purchaseComplete(sqlSession, purchase);
	}
}
