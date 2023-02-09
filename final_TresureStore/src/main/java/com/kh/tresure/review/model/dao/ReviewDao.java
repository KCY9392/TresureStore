package com.kh.tresure.review.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.review.model.vo.Review;

@Repository

public class ReviewDao {
	
	
	/**
	 * 상점 후기 작성 */
	public int reviewInsert(SqlSession sqlSession, HashMap<Object, Object> map) {
		return sqlSession.insert("reviewMapper.reviewInsert",map);
	}

	/**
	 * 상점 후기 상세 */
	public Review reviewDetail(SqlSession sqlSession, HashMap<Object, Object> map) {
		return sqlSession.selectOne("reviewMapper.reviewDetail",map);
	}
	
	/**
	 * 상점 후기 수정 */
	public int reviewUpdate(SqlSession sqlSession, HashMap<Object, Object> map) {
		return sqlSession.update("reviewMapper.reviewUpdate",map);
	}

	/**
	 * 상점 후기 삭제 */
	public int reviewDelete(SqlSession sqlSession, HashMap<Object, Object> map) {
		return sqlSession.delete("reviewMapper.reviewDelete", map);
	}
}
