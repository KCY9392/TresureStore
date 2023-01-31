package com.kh.tresure.follow.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.follow.model.vo.Follow;

@Repository
public class FollowDao {
	
	/**
	 * 멤버 조회
	 */
	public Map <String, Object> selectMember(Follow follow, SqlSession sqlSession) {
		return sqlSession.selectOne("followMapper.selectMember", follow);
	}
	
	/**
	 * 팔로우 리스트 조회
	 */
	public List <Follow> selectFollowList(Follow follow, SqlSession sqlSession) {
		return sqlSession.selectList("followMapper.selectFollowList", follow);
	}

	/**
	 * 팔로우 조회
	 */
	public int selectFollow(Follow follow, SqlSession sqlSession) {
		return sqlSession.selectOne("followMapper.selectFollow", follow);
	}

	/**
	 * 팔로우 insert
	 */
	public int insertFollow(Follow follow, SqlSession sqlSession) {
		return sqlSession.insert("followMapper.insertFollow", follow);
	}

	/**
	 * 팔로우 insert
	 */
	public int deleteFollow(Follow follow, SqlSession sqlSession) {
		return sqlSession.delete("followMapper.deleteFollow", follow);
	}
}
