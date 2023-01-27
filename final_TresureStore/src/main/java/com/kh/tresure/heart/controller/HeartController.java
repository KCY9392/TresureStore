package com.kh.tresure.heart.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tresure.heart.model.service.HeartService;
import com.kh.tresure.heart.model.vo.Heart;
import com.kh.tresure.member.model.vo.Member;

@Controller
public class HeartController {
	
	private Logger logger = LoggerFactory.getLogger(HeartController.class);
	private HeartService heartService;
	
	public HeartController() {
		
	}
	
	
	@Autowired
	public HeartController(HeartService heartService) {
		this.heartService=heartService;
		
	}
	
	@ResponseBody
	@RequestMapping("deleteHeart")
	public int deleteHeart(HttpSession session,
		     @RequestParam(value = "chbox[]") List<String> chArr, Heart heart ) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		System.out.println(chArr + "정보들");
		int userNo = loginUser.getUserNo();
		
		int result = 0;
		int heartNum = 0;
			
		if(loginUser != null){
			heart.setUserNo(userNo);
			
			for(String i : chArr) {
				heartNum = Integer.parseInt(i);
				heart.setHeartNo(heartNum);
				heartService.deleteHeart(heart);
			}
			result = 1;
			
		}
		
		logger.info(""+result);
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping("addHeart")
	public int addHeart(Heart heart, HttpSession session) {
		 int result = 0;
		 Member loginUser = (Member)session.getAttribute("loginUser");
		 if(loginUser != null) {
			  heart.setUserNo(loginUser.getUserNo());
			  heartService.addHeart(heart);
			  result = 1;
			 }
			 
			 return result;
		 
	}
	
	@ResponseBody
	@RequestMapping("mypageDeleteHeart")
	public int mypageDeleteHeart(HttpSession session,
								@RequestParam("sellNo") int sellNo) {
		int result = 0;
		
		logger.info("sellNo : "+sellNo);
		
		 Member loginUser = (Member)session.getAttribute("loginUser");
		 int userNo = loginUser.getUserNo();
		 
		 HashMap<String, Object> map = new HashMap<>();
		 map.put("sellNo", sellNo);
		 map.put("userNo", userNo);
		 
		 if(loginUser != null) {
			  
		  heartService.mypageDeleteHeart(map);
			  result = 1;
			 }
			 
			 return result;
		
	}
	
	
	
	
	

}
