package com.kh.tresure.heart.model.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.heart.model.dao.HeartDao;
import com.kh.tresure.heart.model.vo.Heart;
import com.kh.tresure.member.model.vo.Member;

@Service
public class HeartServiceImpl implements HeartService{
	
	private SqlSession sqlSession;
	private HeartDao heartDao;
	
	public HeartServiceImpl() {
		
	}
	
	@Autowired
	public HeartServiceImpl(SqlSession sqlSession, HeartDao heartDao) {
		this.heartDao=heartDao;
		this.sqlSession=sqlSession;
		
	}
	
	@Override
	public void deleteHeart(Heart heart) {
		 heartDao.deleteHeart(sqlSession, heart);
		 
		 
		
	}
	
	@Override
	public void addHeart(Heart heart) {
		heartDao.addHeart(sqlSession, heart);
		
		heartDao.addHeartCount(sqlSession, heart);
		
		
		
		
	}
	
	@Override
	public  Member selectMem(Member m){
		return heartDao.selectMem(sqlSession, m);
	}
	
	@Override
	public void mypageDeleteHeart(HashMap<String, Object> map) {
		heartDao.mypageDeleteHeart(sqlSession, map);
		
		heartDao.minusHeartCount(sqlSession, map);
	}
	
	
	
	

}
