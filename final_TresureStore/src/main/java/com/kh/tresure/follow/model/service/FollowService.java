package com.kh.tresure.follow.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.tresure.follow.model.dao.FollowDao;
import com.kh.tresure.follow.model.vo.Follow;

public interface FollowService {
	
	/**
	 * 멤버 조회
	 */
	public Map <String, Object> selectMember(Follow follow);
	
	/**
	 * 팔로우 리스트 조회
	 */
	public List <Follow> selectFollowList(Follow follow);
	
	/**
	 * 팔로우 조회
	 */
	public int selectFollow(Follow follow);

	/**
	 * 팔로우 등록
	 */
	public int insertFollow(Follow follow);

	/**
	 * 팔로우 삭제
	 */
	public int deleteFollow(Follow follow);
}
