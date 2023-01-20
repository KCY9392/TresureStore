package com.kh.tresure.heart.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.heart.model.vo.Heart;

@Repository
public class HeartDao {
	
	public void deleteHeart(SqlSession sqlSession, Heart heart) {
		sqlSession.delete("heartMapper.deleteHeart", heart);
	}

}
