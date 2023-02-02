package com.kh.tresure.report.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.report.model.dao.ReportDao;
import com.kh.tresure.report.model.vo.Report;


@Service
public class ReportServiceImpl implements ReportService {

	private ReportDao reportDao;
	private SqlSession sqlSession;
	
	// 기본생성자
	public ReportServiceImpl() {
		
	}
	
	@Autowired
	public ReportServiceImpl(ReportDao reportDao,SqlSession sqlSession) {
		this.reportDao = reportDao;
		this.sqlSession = sqlSession;
	}
	
	//신고리스트에 추가
	@Override
	public int addReport(Report report) {
		
		return reportDao.addReport(sqlSession, report);
	}
	
	//신고 리스트 조회(불러오기)
	@Override
	public List<Report> reportSearchResult(String search){
		
		return reportDao.reportSearchResult(sqlSession, search);
	}
	
	//신고당한 총 횟수
	@Override
	public int reportNumber(String search) {
	
		return reportDao.reportNumber(sqlSession, search);
	}
}
