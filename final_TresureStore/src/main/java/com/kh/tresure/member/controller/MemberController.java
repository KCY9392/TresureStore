package com.kh.tresure.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tresure.heart.model.vo.Heart;
import com.kh.tresure.member.model.service.KakaoAPI;
import com.kh.tresure.member.model.service.MemberService;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.mypage.model.service.MyPageService;
import com.kh.tresure.review.model.vo.Review;
import com.kh.tresure.sell.model.vo.Sell;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MessageController messageController;
	private KakaoAPI kakao;
	private MemberService memberService;
	private MyPageService mypageService;
	
	// 기본생성자
	public MemberController() {}
	
	@Autowired
	public MemberController(MessageController messageController, MemberService memberService, KakaoAPI kakao, MyPageService mypageService){
		this.messageController = messageController;
		this.memberService = memberService;
		this.kakao = kakao;
		this.mypageService=mypageService;
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
		int randomNum = messageController.sendOne(phone);
		
		model.addAttribute("userName", userName);
		model.addAttribute("birth", birth);
		model.addAttribute("phone", phone);
		model.addAttribute("randomNum",randomNum);
		
		return "member/authenticationNumberForm";
	}
	
	
	// 인증번호 입력하고 회원가입 및 로그인하기
	@RequestMapping(value="/loginJoin/loginStrart", method = RequestMethod.POST)
	public String loginAndMemberEnroll(Member member,	
		   							   @RequestParam(value="inputNumber") String inputNumber,	// 사용자가 입력한 인증번호
		   							   @RequestParam(value="randomNum") String randomNum,		// 생성된 인증번호
		   							   Model model,
		   							   HttpSession session) {
		
		if(inputNumber.equals(randomNum)) {
			// 인증번호와 같은경우
			Member loginUser = memberService.loginAndMemberEnroll(member);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", loginUser.getUserName()+"님 환영합니다");
		}
		
		return "redirect:/";
	}
	
	
	// 임의적으로 관리자로 로그인하는 컨트롤러생성(이거 문자가 무제한이아니라서 임의적으로 넣어둔 거 - 삭제예정)
	@RequestMapping(value="/loginJoin/pp")
	public String pp(HttpServletRequest request) {
		
		Member loginUser = Member.builder().userNo(10).userName("관리자").phone("01012345678").count(0).status("Y").build();
		
		logger.info(">> 관리자로 로그인");
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser);
		session.setAttribute("alertMsg", loginUser.getUserName()+"님 환영합니다");
		
		logger.info("loginUser ? "+loginUser);
		
		return "redirect:/";
	}
	
	// 임의적으로 사용자로 로그인하는 컨트롤러생성(이거 문자가 무제한이아니라서 임의적으로 넣어둔 거 - 삭제예정)
	@RequestMapping(value="/loginJoin/qq")
	public String qq(HttpServletRequest request) {
		
		Member loginUser = Member.builder().userNo(1).userName("사용자").phone("01099887766").count(0).status("Y").build();
		
		logger.info(">> 사용자로 로그인");
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser);
		session.setAttribute("alertMsg", loginUser.getUserName()+"님 환영합니다");
		
		return "redirect:/";
	}
	
	
	// 로그아웃 하는 메소드
	@RequestMapping(value="/logout")
	public String memberLogOut(HttpServletRequest request) {
		
		logger.info(">> 로그아웃");
		
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		session.setAttribute("alertMsg", "다음에 또 오세요 ^ㅁ^");
		return "redirect:/";
	}
	
	
	

	/**
	 * kakao 로그인 
	 * @param code
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/loginJoin/kakao")
	public String login(@RequestParam("code") String code, HttpSession session) {
		
		//받은 code로 access_token 가져오기
		String access_Token = kakao.getAccessToken(code); 
		
		
	    //access_token으로 user정보 가져오기 (닉네임, 이메일계정)
	    Member member = kakao.getUserInfo(access_Token);
	    logger.info("login Controller : " + member.toString());
	    
	    //클라이언트의 이메일이 존재할 때(즉, 카카오 로그인 성공)
	    if (member != null) {
	    	
	    	// email과 nickname으로 회원체크, 회원가입/로그인 성공 후 member객체 반환
	    	member = memberService.loginAndMemberEnroll(member);
	    	logger.info("member : "+member);
	    	
	    	session.setAttribute("loginUser", member);
	    	session.setAttribute("access_Token", access_Token);
	    	session.setAttribute("alertMsg", member.getUserName()+"님 환영합니다");
	    }
        
		return "redirect:/";
	}
	
	/**
	 * kakao 이 서비스에서만 로그아웃
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout/kakao")
	public String logout(HttpSession session) throws IOException{
		String access_Token = (String)session.getAttribute("access_Token");
		 if(access_Token != null && !"".equals(access_Token)){
	            kakao.kakaoLogout(access_Token);
	            session.removeAttribute("access_Token");
	            session.removeAttribute("loginUser");
	            session.removeAttribute("userId");
	            session.setAttribute("alertMsg", "다음에 또 오세요 ^ㅁ^");
	        }else{
	            System.out.println("access_Token is null");
	        }
		 return "redirect:/";
	}

	/**
	 * kakao 계정과 함께 로그아웃(연결끊기)
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/kakaounlink")
	public String unlink(HttpSession session) {
		kakao.unlink((String)session.getAttribute("access_Token"));
		session.invalidate();
		session.removeAttribute("loginUser");
		session.setAttribute("alertMsg", "다음에 또 오세요 ^ㅁ^");
		return "redirect:/";
	}
	
	
	// 회원탈퇴
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String deleteMember(HttpSession session) {
	      
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		memberService.deleteMember(userNo);
		
		if((String)session.getAttribute("access_Token") != null) {
			kakao.unlink((String)session.getAttribute("access_Token"));
			session.removeAttribute("access_Token");
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "감사했습니다 ^_^7");
		}
      
		return "redirect:/";
	}
	   
	
	
	
	
	

}
