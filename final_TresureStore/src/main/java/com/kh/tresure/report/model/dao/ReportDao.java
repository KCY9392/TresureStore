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
	public List<Report> reportSearchResult(SqlSession sqlSession,HashMap<String, Object> map) {
	
		return sqlSession.selectList("reportMapper.reportSearchResult", map);
	}

	// 성공적으로 신고되면 신고당한 사람이 신고 40번 됐는지 확인
	public int selectReportCount(SqlSession sqlSession, Report report) {

		return sqlSession.selectOne("reportMapper.selectReportCount", report);
	}

	//신고 카운트
	public int selectListCount(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("reportMapper.selectListCount", map);
	}

	
}
