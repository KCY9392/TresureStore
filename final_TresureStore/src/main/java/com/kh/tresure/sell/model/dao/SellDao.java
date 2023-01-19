package com.kh.tresure.sell.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.sell.model.vo.Sell;



@Repository
public class SellDao {
	
	/**
	 * 채팅방안에 판매게시글 가져오기
	 * @param sqlSession
	 * @param chatRoomNo
	 * @return
	 */
	public static Sell selectSellProduct(SqlSession sqlSession, int chatRoomNo) {
		
		return sqlSession.selectOne("sellMapper.selectSellProduct", chatRoomNo);
	}
	
	
	/**
	 * 판매목록 조회
	 */
	public List<Sell> sellListselect(SqlSession sqlSession) {
		
		return sqlSession.selectList("sellMapper.sellListselect");
	}
	
}
