package com.kh.tresure.heart.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.heart.model.dao.HeartDao;
import com.kh.tresure.heart.model.vo.Heart;

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
		System.out.println("서비스 : "+heart);
	}
	
	
	

}
