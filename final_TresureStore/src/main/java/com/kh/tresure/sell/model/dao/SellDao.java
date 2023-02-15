package com.kh.tresure.sell.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.review.model.vo.Review;
import com.kh.tresure.sell.model.vo.Category;
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
	
	/**
	 * 상품 검색 */
	public List<Sell> sellListsearch(String keyword, SqlSession sqlSession) {
		return sqlSession.selectList("sellMapper.sellListsearch", keyword);
	}
	
	
	/**
	 * 최근 거래성공한 5개 상품 가격 */
	public List<Sell> successfive(String keyword, SqlSession sqlSession) {
		return sqlSession.selectList("sellMapper.successfive", keyword);
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
	
	public int getSellNo(SqlSession sqlSession) {
		
		return sqlSession.selectOne("sellMapper.getSellNo");
	}
	
	/**
	 * 상품 상세조회
	 */
	public List<SellImg> selectSellImgList(Map<String, Integer> map, SqlSession sqlSession) {
		return sqlSession.selectList("sellMapper.selectSellImgList", map);
	}

	/**
	* 채팅방안에 판매게시글 가져오기 */
	public static Sell selectSellProduct(SqlSession sqlSession, int chatRoomNo) {
      
      return sqlSession.selectOne("sellMapper.selectSellProduct", chatRoomNo);
	}
	
	
	/**
	 * 상품 상세조회 */
	public Sell selectSellDetail(Map<String, Integer> map, SqlSession sqlSession) {
		return sqlSession.selectOne("sellMapper.selectSellDetail", map);
	}

	/**
	 * 상품 조회수 증가 */
	public int increaseCount(int sellNo, SqlSession sqlSession) {
		return sqlSession.update("sellMapper.increaseCount",sellNo);
	}

	/**
	 * 네고하기 */
	public static int insertNegoPrice(SqlSession sqlSession, Sell nego) {
		
		return sqlSession.insert("sellMapper.insertNegoPrice", nego);
	}

	/**
	 * 최신순, 인기순, 저가순, 고가순 정렬 */
	public List<Sell> howOrderLIst(HashMap<String, Object> map, SqlSession sqlSession) {
		
		return sqlSession.selectList("sellMapper.howOrderList",map);
	}

	public List<Sell> sellList(SqlSession sqlSession, int userNo) {
		return sqlSession.selectList("sellMapper.sellList", userNo);
	}

	
	public List<Review> reviewList(SqlSession sqlSession, int userNo) {
		return sqlSession.selectList("sellMapper.reviewList", userNo);

	}
	
	public Map<String, Object> sellerDetail(SqlSession sqlSession, Map<String, Integer> map) {
		return sqlSession.selectOne("sellMapper.sellerDetail", map);
	}


	
	/**
	 * 상품목록 더보기 */
	public List<Sell> sellListTheBogi(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("sellMapper.sellListTheBogi", map);
	}

	/**
	 * 제일 마지막 Sell 번호 조회 */
	public int finishSellNo(SqlSession sqlSession) {
		return sqlSession.selectOne("sellMapper.finishSellNo");
	}

	
	public List<Category> cateList(SqlSession sqlSession){
		return sqlSession.selectList("sellMapper.cateList");
	}
	
	/**
	 *	상품 수정 이미지 리스트 */
	public List<SellImg> selectSellUpImgList(Map<String, Integer> map, SqlSession sqlSession) {
		return sqlSession.selectList("sellMapper.selectSellUpImgList", map);
	}
	
	/**
	 * 상품 수정 */
	public int updateSell(SqlSession sqlSession, Sell s) {
		return sqlSession.update("sellMapper.updateSell", s);
	}
	
	/**
	 * 상품 삭제 */
	public int deleteSell(SqlSession sqlSession, Sell s) {
		return sqlSession.update("sellMapper.deleteSell", s);
	}
	
	/**
	 * 상품 이미지 수정 */
	public int updateSellImgList(SqlSession sqlSession, List<SellImg> sellImageList) {
		return sqlSession.update("sellMapper.updateSellImgList", sellImageList);
	}

	/**
	 * 상품 이미지 삭제 */
	public int deleteSellImg(SqlSession sqlSession, SellImg img) {
		return sqlSession.delete("sellMapper.deleteSellImg", img);
	}

	/**
	 * SFILE의 대표이미지 업데이트 */
	public int updateSellImg(SqlSession sqlSession, SellImg img) {
		return sqlSession.update("sellMapper.updateSellImg", img);
	}

	/**
	 * SELL의 대표이미지 업데이트 */
	public int updateSellFile(SqlSession sqlSession, Sell sell) {
		return sqlSession.update("sellMapper.updateSellFile", sell);
	}

}
