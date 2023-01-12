package com.kh.tresure.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tresure.member.model.service.MemberService;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
//	private MemberService memberService;
//	
//	// 기본생성자
//	public MemberController() {}
//	
//	@Autowired
//	public MemberController(MemberService memberService) {
//		this.memberService = memberService;
//	}
	
	
	// 통합로그인 창으로 이동하는 메소드
	@RequestMapping(value = "/loginJoinForm", method = RequestMethod.GET)
	public String enrollForm() {
		
		logger.info(">> 회원가입 폼으로 이동");
		
		return "member/memberLoginForm";
	}
	
	
	// 본인인증 창으로 이동하는 메소드
	@RequestMapping(value="/loginJoin/identification", method = RequestMethod.GET)
	public String identificationForm() {
		
		logger.info(">> 본인인증 폼으로 이동");
		
		return "member/identificationForm";
	}

}
