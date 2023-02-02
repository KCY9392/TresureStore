package com.kh.tresure.report.model.service;

import java.util.List;

import com.kh.tresure.report.model.vo.Report;

public interface ReportService {

	////신고 추가
	public int addReport(Report report);

	//신고 리스트 조회(불러오기)
	public List<Report> reportSearchResult(String search);

	//신고 카운트
	public int reportNumber(String search);

	
	
	
	
}
