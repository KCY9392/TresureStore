package com.kh.tresure.recent.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.recent.controller.RecentController;
import com.kh.tresure.recent.model.service.RecentService;
import com.kh.tresure.recent.model.vo.Recent;

@Controller
@RequestMapping("/recent")
public class RecentController {

	private Logger logger = LoggerFactory.getLogger(RecentController.class);
	private RecentService recentService;
	
	public RecentController () {
		
	}
	
	@Autowired
	public RecentController(RecentService recentService) {
		this.recentService = recentService;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public List <Recent> updateProducts(@RequestBody List <Recent> recentList, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginUser");
		
		for(Recent recent : recentList) {
			recent.setUserNo(member.getUserNo());
			recentService.updateProduct(recent);
		}
		
		Recent recent = new Recent();
		recent.setUserNo(member.getUserNo());
		
		recentService.deleteProduct(recent);
		
		return recentService.viewProduct(recent);
	}
	
	@RequestMapping(value = "/products", method = RequestMethod.POST)
	@ResponseBody
	public List <Recent> viewProducts(HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		
		Recent recent = new Recent();
		recent.setUserNo(member.getUserNo());
		
		return recentService.viewProduct(recent);
	}
}
