package com.kh.tresure.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDao {
	
	/**
	 * 판매수 조회
	 */
	 
	public int sellCount(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("mypageMapper.sellCount", userNo);
	}
	
	/**
	 * 팔로워 수 조회
	 */
	public int followCount(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("mypageMapper.followCount", userNo);
	}
	
	/**
	 * 신고 숫 조회
	 * 
	 */
	public int reportCount(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("mypageMapper.reportCount", userNo);
	}
	
	/**
	 * 상점 오픈일
	 */
	
	public int marketOpen(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("mypageMapper.marketOpen", userNo);
	}


}
