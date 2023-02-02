package com.kh.tresure;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tresure.member.model.service.KakaoAPI;
import com.kh.tresure.member.model.service.MemberService;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.sell.model.service.SellService;
import com.kh.tresure.sell.model.vo.Sell;

@Controller
public class HomeController {
	private int count = 0; 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private SellService sellService;
	private KakaoAPI kakao;
	private MemberService memberservice;
	
	public HomeController() {}
	
	@Autowired
	public HomeController(SellService sellService, KakaoAPI kakao,MemberService memberservice) {
		this.sellService = sellService;
		this.kakao = kakao;
		this.memberservice = memberservice;
	}

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session) {

		List<Sell> sList = sellService.sellListselect();
		logger.info("sList ? "+sList);
		for(int i=0; i<sList.size(); i++) {
			sList.get(i).setTimeago(sList.get(i).getCreateDate());
		}
		
		
		String access_Token = (String)session.getAttribute("access_Token");
		
		
		if(access_Token != null) {
			
			Member member = kakao.getUserInfo(access_Token);
			member = memberservice.loginAndMemberEnroll(member);
			session.setAttribute("loginUser", member);
	    	session.setAttribute("access_Token", access_Token);
	    	if(count == 0) {
	    		session.setAttribute("alertMsg", member.getUserName()+"님 환영합니다");
	    		count++;
	    	}
		}
		
		model.addAttribute("sellList", sList);
		
		return "home";
	}
	
}
