package com.kh.tresure.review.model.service;

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
	
	public ReviewServiceImpl() {
		
	}
	
	@Autowired
	public ReviewServiceImpl(SqlSession sqlSession, ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
		this.sqlSession=sqlSession;
		
	}
	
	
	
	
	

}
