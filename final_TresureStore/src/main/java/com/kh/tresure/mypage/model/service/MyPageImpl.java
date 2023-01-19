package com.kh.tresure.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.mypage.model.dao.MyPageDao;
import com.kh.tresure.sell.model.vo.Sell;


@Service
public class MyPageImpl implements MyPageService{
	
	private MyPageDao mypageDao;
	private SqlSession sqlSession;
	
	
	// 기본생성자
	public MyPageImpl() {
		
	}
	
	@Autowired
	public MyPageImpl(MyPageDao mypageDao, SqlSession sqlSession) {
		this.mypageDao=mypageDao;
		this.sqlSession=sqlSession;
		
	}	
	
	/**
	 * 상품판매수 조회
	 */
	@Override
	public int sellCount(int userNo) {
		return mypageDao.sellCount(sqlSession,userNo);
	}
	
	/**
	 * 팔로워수 조회
	 */
	
	@Override
	public int followCount(int userNo) {
		return mypageDao.followCount(sqlSession, userNo);
	}
	
	/**
	 * 신고 수 조회
	 */
	
	@Override
	public int reportCount(int userNo) {
		return mypageDao.reportCount(sqlSession, userNo);
	}
	
	/**
	 * 상점오픈일
	 */
	
	@Override
	public int marketOpen(int userNo) {
		return mypageDao.marketOpen(sqlSession, userNo);
	}
	
	/**
	 * 마이페이지 상품 목록
	 */
	@Override
	public List<Sell> mypageSellList(int userNo){
		return mypageDao.mypageSellList(sqlSession, userNo);
	}
	
	
	
	

}
