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
			HashMap<String, Object> map = new HashMap<>();
			for(String i : chArr) {
				heartNum = Integer.parseInt(i);
			
				heart.setHeartNo(heartNum);
				
				heartService.deleteHeart(heart);
				
				result=1;
			}
			
						
			int sysHeartNum =  chArr.size();
			map.put("userNo", userNo);
			map.put("sysHeartNum", sysHeartNum);

			logger.info("sysheart : "+sysHeartNum);
			heartService.minusListCount(map);
			
			if(result==1) {
				  Member updateMem = heartService.selectMem(loginUser);
				  session.setAttribute("loginUser", updateMem);
			  }
			
			
		}
		
		logger.info(""+result);
		
		return result;
			
	}
	
	@ResponseBody
	@RequestMapping("addHeart")
	public String addHeart(Member m, Heart heart, HttpSession session) {
		String result = "";
		 Member loginUser = (Member)session.getAttribute("loginUser");
		 if(loginUser != null) {
			  heart.setUserNo(loginUser.getUserNo());
			   
			  heartService.addHeart(heart);
			  
			  result = "c";
			  if(result.equals("c")) {
				  
				  Member updateMem = heartService.selectMem(loginUser);
				  session.setAttribute("loginUser", updateMem);

			
			  }
			 }
			 
			 return result;
		 
	}
	
	@ResponseBody
	@RequestMapping("mypageDeleteHeart")
	public String mypageDeleteHeart(HttpSession session,
								@RequestParam("sellNo") int sellNo) {
		String result = "";
		
		logger.info("sellNo : "+sellNo);
		
		 Member loginUser = (Member)session.getAttribute("loginUser");
		 int userNo = loginUser.getUserNo();
		 
		 HashMap<String, Object> map = new HashMap<>();
		 map.put("sellNo", sellNo);
		 map.put("userNo", userNo);
		 
		 if(loginUser != null) {
			  
		  heartService.mypageDeleteHeart(map);
			  result = "f";
			  
			  if(result.equals("f")) {
				  
				  Member updateMem = heartService.selectMem(loginUser);
				  session.setAttribute("loginUser", updateMem);

			
			  }
			 }
			 
			 return result;
		
	}
	
	
	
	
	

}
