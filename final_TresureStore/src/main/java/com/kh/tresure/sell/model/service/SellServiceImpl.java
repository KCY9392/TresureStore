package com.kh.tresure.sell.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.sell.model.dao.SellDao;
import com.kh.tresure.sell.model.vo.Sell;

@Service
public class SellServiceImpl implements SellService  {

	
	private SellDao sellDao;
	private SqlSession sqlSession;
	
	// 기본생성자
	public SellServiceImpl() {
		
	}
	
	@Autowired
	public SellServiceImpl(SellDao sellDao, SqlSession sqlSession) {
		this.sellDao = sellDao;
		this.sqlSession = sqlSession;
	}
	
	
	/**
	 * 판매목록 조회
	 */
	@Override
	public List<Sell> sellListselect(){
		return sellDao.sellListselect(sqlSession);
	}
	
	
	
}
