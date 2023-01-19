package com.kh.tresure.mypage.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.mypage.model.dao.MyPageDao;


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
	
	@Override
	public int marketOpen(int userNo) {
		return mypageDao.marketOpen(sqlSession, userNo);
	}
	
	
	
	

}
