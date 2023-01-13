package com.kh.tresure.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tresure.member.model.service.MemberService;
import com.kh.tresure.member.model.vo.Member;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MessageController messageController;
	
	// 기본생성자
	public MemberController() {}
	
	@Autowired
	public MemberController(MessageController messageController){
		this.messageController = messageController;
	}
	
	
	
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
	
	
	// 인증번호 입력창으로 이동하는 메소드 
	@RequestMapping(value="/loginJoin/authenticationNumber", method = RequestMethod.POST)
	public String authenticationNumberForm(@RequestParam(value="userName") String userName,	// 사용자이름
			   							   @RequestParam(value="birth") String birth,		// 생년월일
			   							   @RequestParam(value="birth2") int birth2,		// 뒷 첫번째 자리(필요는 없음)
			   							   @RequestParam(value="phone") String phone,		// 핸드폰 번호
			   							   Model model) {
		
		logger.info(">> 인증번호 입력하기 폼으로 이동");

		// 메세지 보내기 실행
		logger.info(phone);
		messageController.sendOne(phone);
		
		model.addAttribute("userName", userName);
		model.addAttribute("birth", birth);
		model.addAttribute("phone", phone);
		
		return "member/authenticationNumberForm";
	}
	

	// 빌더 사용법이니 작성만 해둠 (백도어형식으로 관리자 만들거나 카카오로그인 되면 지우겠음)
	// Member user = Member.builder().userName("관리자").birth("000101").phone("01012345678").build();
	// model.addAttribute("user", user);
	
	//
	
	

}
