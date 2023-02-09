package com.kh.tresure.report.model.dao;

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
	public int reportNumber(SqlSession sqlSession, String search) {

		return sqlSession.selectOne("reportMapper.reportNumber", search);
	}

	public int selectReportCount(SqlSession sqlSession, Report report) {

		return sqlSession.selectOne("reportMapper.selectReportCount", report);
	}

	
}
