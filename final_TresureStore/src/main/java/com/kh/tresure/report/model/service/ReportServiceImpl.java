package com.kh.tresure.report.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.report.model.dao.ReportDao;


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
}
