package com.kh.tresure.heart.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.heart.model.vo.Heart;
import com.kh.tresure.member.model.vo.Member;

@Repository
public class HeartDao {
	
	public void deleteHeart(SqlSession sqlSession, Heart heart) {
		sqlSession.delete("heartMapper.deleteHeart", heart);
	}
	
	public int addHeart(SqlSession sqlSession, Heart heart) {
		return sqlSession.insert("heartMapper.addHeart", heart);
	}
	
	public void mypageDeleteHeart(SqlSession sqlSession, HashMap<String, Object> map) {
		sqlSession.delete("heartMapper.mypageDeleteHeart", map);
	}


	public void addHeartCount(SqlSession sqlSession, Heart heart) {
		
		sqlSession.update("heartMapper.addHeartCount", heart);
	}

	public Member selectMem(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectMem", m);
		
	}

	public void minusHeartCount(SqlSession sqlSession, HashMap<String, Object> map) {
		sqlSession.update("heartMapper.minusHeartCount", map);
		
	}

	
	

}
