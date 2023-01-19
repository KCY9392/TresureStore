package com.kh.tresure.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.mypage.model.service.MyPageService;
import com.kh.tresure.sell.model.vo.Sell;



public class MyPageController {
	private Logger logger = LoggerFactory.getLogger(MyPageController.class);
	private MyPageService  mypageService;
	
	public MyPageController() {
		
	}
	
	
	@Autowired
	public MyPageController(MyPageService mypageService) {
		this.mypageService = mypageService;
	}
	
	
	
	

}
