package com.kh.tresure.heart.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.heart.model.vo.Heart;

@Repository
public class HeartDao {
	
	public void deleteHeart(SqlSession sqlSession, Heart heart) {
		sqlSession.delete("heartMapper.deleteHeart", heart);
	}
	
	public void addHeart(SqlSession sqlSession, Heart heart) {
		sqlSession.insert("heartMapper.addHeart", heart);
	}
	
	public void mypageDeleteHeart(SqlSession sqlSession, HashMap<String, Object> map) {
		sqlSession.delete("heartMapper.mypageDeleteHeart", map);
	}
	

}
