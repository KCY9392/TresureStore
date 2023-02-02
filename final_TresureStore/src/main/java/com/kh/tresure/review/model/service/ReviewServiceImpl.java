package com.kh.tresure.review.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.review.model.dao.ReviewDao;
import com.kh.tresure.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	private SqlSession sqlSession;
	private ReviewDao reviewDao;
	private HashMap<Object, Object> map;
	
	public ReviewServiceImpl() {
		
	}
	
	@Autowired
	public ReviewServiceImpl(SqlSession sqlSession, ReviewDao reviewDao, HashMap<Object, Object> map) {
		this.reviewDao = reviewDao;
		this.sqlSession=sqlSession;
		this.map = map;
	}
	
	
	/**
	 * 상점 후기 작성 */
	@Override
	public int reviewInsertUpdate(int score, String reviewContent, int sellNo, int userNo, String reviewIs) {
		
		int result = 0;
		
		map.put("score", score);
		map.put("reviewContent", reviewContent);
		map.put("sellNo", sellNo);
		map.put("userNo", userNo);
		
		if(reviewIs.equals("N")) {
			result = reviewDao.reviewInsert(sqlSession,map);
		}else {
			result = reviewDao.reviewUpdate(sqlSession, map);
		}
		
		return result;
	}
	
	
	/**
	 * 상점 후기 상세 */
	public Review reviewDetail(int userNo, int sellNo) {
		
		map.put("sellNo", sellNo);
		map.put("userNo", userNo);
		
		return reviewDao.reviewDetail(sqlSession, map);
	}
	
	
	/**
	 * 상점 후기 삭제 */
	public int reviewDelete(int userNo, int sellNo) {
		
		map.put("sellNo", sellNo);
		map.put("userNo", userNo);
		
		return reviewDao.reviewDelete(sqlSession, map);
	}
}
