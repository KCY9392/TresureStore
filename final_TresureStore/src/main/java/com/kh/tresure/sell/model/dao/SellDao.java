package com.kh.tresure.sell.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



@Repository
public class SellDao {
	
	/**
	 * 판매수 조회
	 */
	 
	public int sellListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("sellMapper.sellListCount");
	}

}
