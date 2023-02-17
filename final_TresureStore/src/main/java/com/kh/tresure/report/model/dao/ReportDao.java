package com.kh.tresure.report.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.report.model.vo.Report;

@Repository
public class ReportDao {

	//신고 추가
	public int addReport(SqlSession sqlSession, Report report) {

		return sqlSession.insert("reportMapper.addReport", report);
	}

	//신고 조회
	public List<Report> reportSearchResult(SqlSession sqlSession, String search) {
	
		return sqlSession.selectList("reportMapper.reportSearchResult", search);
	}

	//신고 당한 총 횟수
	public Integer reportNumber(SqlSession sqlSession, HashMap<String, Object> map) {

		return sqlSession.selectOne("reportMapper.reportNumber", map);
	}

	public int selectReportCount(SqlSession sqlSession, Report report) {

		return sqlSession.selectOne("reportMapper.selectReportCount", report);
	}

	//신고 조회(계좌번호로 조회)
	public List<Report> reportAccountResult(SqlSession sqlSession, String account) {

		return sqlSession.selectList("reportMapper.reportAccountResult", account);
	}

	
}
