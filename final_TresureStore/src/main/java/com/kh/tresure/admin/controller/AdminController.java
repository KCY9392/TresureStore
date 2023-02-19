package com.kh.tresure.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kh.tresure.member.model.service.MemberService;
import com.kh.tresure.member.model.vo.Account;
import com.kh.tresure.member.model.vo.Member;


@Controller
public class AdminController {

	private MemberService memberService;
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	private IpValid ipvalid;
	
	
	@Autowired
	public AdminController (MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder, IpValid ipvalid) {
		this.memberService = memberService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
		this.ipvalid = ipvalid;
	}
	
	
	
	//관리자 페이지로 이동
	@RequestMapping(value = "common/admin", method = RequestMethod.GET)
	public String admin(HttpServletRequest request,
						Model model,
						HashMap<Object, Object> paramMap,
						@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) { 
	
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String secretIp = getIp(req);
		
		boolean result = ipvalid.IpValidCheck(secretIp);
		
		if(result == true ) {
			
			HashMap<Object, Object> map = memberService.selectListAll(paramMap, currentPage);
			
			
			model.addAttribute("map", map);
			
			
			return "common/admin";
		} else {
			return "redirect:/";
		}
		

	}
	

	//관리자페이지 결제관리
	@RequestMapping(value = "admin/payAdmin", method = RequestMethod.GET)
	public String accountList(Model model, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
			
		List<Account> accountList = memberService.accountList(loginUser.getUserNo());
		model.addAttribute("accountList", accountList);
		
		
		return "common/admin";
	}
	
	
	
	
	// ip 가져오는 메소드
	public String getIp(HttpServletRequest request){
	     String ip = request.getHeader("X-Forwarded-For");

	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	    }
	    
	    String newIp = bcryptPasswordEncoder.encode(ip);
	   
	    return newIp;
	}
}
