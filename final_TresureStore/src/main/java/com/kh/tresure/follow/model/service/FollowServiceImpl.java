package com.kh.tresure.follow.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.follow.controller.FollowController;
import com.kh.tresure.follow.model.dao.FollowDao;
import com.kh.tresure.follow.model.vo.Follow;
import com.kh.tresure.sell.model.dao.SellDao;

@Service
public class FollowServiceImpl implements FollowService {
	private FollowDao followDao;
	private SqlSession sqlSession;
	
	// 기본생성자
	public FollowServiceImpl() {
		
	}
	
	@Autowired
	public FollowServiceImpl(FollowDao followDao, SqlSession sqlSession) {
		this.followDao = followDao;
		this.sqlSession = sqlSession;
	}

	/**
	 * 팔로우 리스트 조회
	 */
	@Override
	public List<Follow> selectFollowList(Follow follow) {
		return followDao.selectFollowList(follow, sqlSession);
	}
	
	/**
	 * 팔로우 조회
	 */
	@Override
	public int selectFollow(Follow follow) {
		return followDao.selectFollow(follow, sqlSession);
	}

	/**
	 * 팔로우 insert
	 */
	@Override
	public int insertFollow(Follow follow) {
		return followDao.insertFollow(follow, sqlSession);
	}

	@Override
	public int deleteFollow(Follow follow) {
		return followDao.deleteFollow(follow, sqlSession);
	}
}
