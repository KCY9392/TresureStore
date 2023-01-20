package com.kh.tresure.sell.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.sell.model.vo.Sell;
import com.kh.tresure.sell.model.vo.SellImg;



@Repository
public class SellDao {
	
	
	/**
	 * 판매목록 조회
	 */
	public List<Sell> sellListselect(SqlSession sqlSession) {
		
		return sqlSession.selectList("sellMapper.sellListselect");
	}
	
	public int insertSell(SqlSession sqlSession, Sell s) {
		int result = sqlSession.insert("sellMapper.insertSell", s);
		
		if(result > 0) {
			result = s.getSellNo();
		}
		
		return result;

	}
	
	public int insertSellImgList(SqlSession sqlSession, List<SellImg> sellImageList) {
		return sqlSession.insert("sellMapper.insertSellImgList", sellImageList);
	}
	
	public int getSellNo(SqlSession sqlSession, String userNo) {
		
		return sqlSession.selectOne("sellMapper.getSellNo", userNo);
	}

	/**
	* 채팅방안에 판매게시글 가져오기
	* @param sqlSession
	* @param chatRoomNo
	* @return
	*/
	public static Sell selectSellProduct(SqlSession sqlSession, int chatRoomNo) {
      
      return sqlSession.selectOne("sellMapper.selectSellProduct", chatRoomNo);
	}
}
