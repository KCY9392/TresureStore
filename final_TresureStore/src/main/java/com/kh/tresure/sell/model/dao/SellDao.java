package com.kh.tresure.sell.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.sell.model.vo.Sell;



@Repository
public class SellDao {
	
	
	/**
	 * 판매목록 조회
	 */
	public List<Sell> sellListselect(SqlSession sqlSession) {
		
		return sqlSession.selectList("sellMapper.sellListselect");
	}
	
}
