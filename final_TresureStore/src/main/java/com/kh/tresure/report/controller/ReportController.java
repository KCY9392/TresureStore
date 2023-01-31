package com.kh.tresure.report.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.report.model.service.ReportService;
import com.kh.tresure.report.model.vo.Report;

@Controller
public class ReportController {

	private Logger logger = LoggerFactory.getLogger(ReportController.class);
	private	ReportService reportService;
	
	// 기본생성자
	public ReportController() {
		
	}
	
	@Autowired
	public ReportController( ReportService reportService){
		this.reportService = reportService;
	}

	
	//사기조회 페이지 
	@RequestMapping(value = "report/reportSearch", method = RequestMethod.GET)
	public String reportSearch( Model model) {
		
		
		logger.info(">> 사기조회로 이동");
		
		return "report/reportSearch";
	}
	
	//사기조회 결과 페이지 
	@RequestMapping(value = "report/reportSearchResult", method = RequestMethod.GET)
	public String reportSearchResult( Model model) {
		
		
		logger.info(">> 사기조회로 이동");
		
		return "report/reportSearchResult";
	}
	
	//신고 추가하기
	@RequestMapping(value = "report/addReport", method= RequestMethod.GET)
	public String addReport (Model model,
							HttpSession session,
							@RequestParam(value="chatRoomNo", required=false) int chatRoomNo) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int reportNo = loginUser.getUserNo();
		
		Report report = new Report();
		report.setReportNo(reportNo);
		
		
		
		
		logger.info(">> 신고 리스트에 추가");
		return "";
	}
		
		
		
		
	
	
}

