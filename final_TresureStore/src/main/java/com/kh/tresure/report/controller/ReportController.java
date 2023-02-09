package com.kh.tresure.report.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String reportSearchResult(Model model,
									String search,
									HttpSession session) {
			
		//@ 포함하고 상점 검색할 경우
		if(search.charAt(0) == '@') {
			
			search = search.substring(1);
			
			List<Report> reList = reportService.reportSearchResult(search);
			int reportNum = reportService.reportNumber(search);
				
				model.addAttribute("search", search);
				model.addAttribute("reportList", reList );
				model.addAttribute("reportNum", reportNum);
				
				logger.info(">> 사기조회 결과페이지로 이동");
				logger.info(">> 사기조회번호 : " + search);													
		        logger.info(">> 사기조회 리스트" + reList);
		        logger.info(">> 사기 횟수 : "+ reportNum);
			
		}else {
			//session.setAttribute("alertMsg", "@ 포함하여 다시 입력해주세요.");
			return "redirect:/reportSearch";
		}
		
		return "report/reportSearchResult";
	}


	
	//신고 추가하기
	@RequestMapping(value = "report/addReport", method =  RequestMethod.GET)
	public String addReport (HttpSession session,
							 @RequestParam(value="sellUserNo", required=false) int sellUserNo,
							 @RequestParam(value="purchaseUserNo", required=false) int purchaseUserNo,
							 @RequestParam(value="reportContent", required=false) String reportContent,
							 Report report) {
		
		int reporterNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		report.setReportContent(reportContent);
		
		int state = reportService.addReport(report, sellUserNo, purchaseUserNo, reporterNo);
		
		if(state == 0) {
			session.removeAttribute("loginUser");
			if(session.getAttribute("access_Token") != null) {
				session.removeAttribute("access_Token");
			}
		}
		
		logger.info(">> 신고 리스트에 추가");
		
		return "redirect:/";
	
	}
	

}

