package com.kh.tresure.recent.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.recent.model.vo.Recent;

@Repository
public class RecentDao {

	public int updateProduct(SqlSession sqlSession, Recent recent) {
		return sqlSession.update("recentMapper.updateProduct", recent);
	}
	
	public List <Recent> viewProduct(SqlSession sqlSession, Recent recent) {

		return sqlSession.selectList("recentMapper.viewProduct", recent);
	}
	
	public int deleteProduct(SqlSession sqlSession, Recent recent) {
		return sqlSession.update("recentMapper.deleteProduct", recent);
	}
	
	public int deleteProducts(SqlSession sqlSession, Recent recent) {
		return sqlSession.delete("recentMapper.deleteProducts", recent);
	}
}
