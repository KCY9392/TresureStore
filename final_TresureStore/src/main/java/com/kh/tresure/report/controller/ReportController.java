package com.kh.tresure.report.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.member.model.vo.Member;
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

	
	//사기조회 페이지 
	@RequestMapping(value = "report/reportSearch", method = RequestMethod.GET)
	public String selectChatRoomList( Model model, HttpServletRequest request) {
		
		
			logger.info(">> 사기조회로 이동");
			
			return "report/reportSearch";
	}
		
	
	
}

