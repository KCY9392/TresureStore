package com.kh.tresure.recent.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.recent.model.dao.RecentDao;
import com.kh.tresure.recent.model.vo.Recent;

@Service
public class RecentServiceImpl implements RecentService {

	private RecentDao recentDao;
	private SqlSession sqlSession;
	
	public RecentServiceImpl() {
		
	}
	
	@Autowired
	public RecentServiceImpl(RecentDao recentDao, SqlSession sqlSession) {
		this.recentDao = recentDao;
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int updateProduct(Recent recent) {
		return recentDao.updateProduct(sqlSession, recent);
	}
	
	@Override
	public List <Recent> viewProduct(Recent recent) {
		return recentDao.viewProduct(sqlSession, recent);
	}
	
	@Override
	public int deleteProduct(Recent recent) {
		return recentDao.deleteProduct(sqlSession, recent);
	}
	
	@Override
	public int deleteProducts(Recent recent) {
		return recentDao.deleteProducts(sqlSession, recent);
	}
}
