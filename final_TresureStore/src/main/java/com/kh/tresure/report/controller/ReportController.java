package com.kh.tresure.report.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.tresure.report.model.service.ReportService;

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
	
}
