package com.kh.tresure.common.interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jetbrains.annotations.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tresure.member.controller.MessageController;
import com.kh.tresure.member.model.service.KakaoAPI;
import com.kh.tresure.member.model.service.MemberService;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.mypage.model.service.MyPageService;


public class AccessValidator implements HandlerInterceptor{
	private KakaoAPI kakao;
	
	// 기본생성자
	public AccessValidator() {}
	

	@Autowired
	public AccessValidator(KakaoAPI kakao){
		this.kakao = kakao;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 권한체크
		String state = getBlackListStatus(request.getSession());
		HttpSession session = request.getSession();
		
		
		// 블랙리스트유저 바로 강제로그아웃되게 실행
		if(state == null || state.equals("Y")) {
			try {
				
					
				if((String)session.getAttribute("access_Token") != null) {
					kakao.unlink((String)session.getAttribute("access_Token"));

				}
				session.removeAttribute("access_Token");
				session.removeAttribute("loginUser");
				
				session.setAttribute("alertMsg", "이용할 수 없는 유저입니다.");
				response.sendRedirect("/tresure");

			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return false;
		}
		// 토큰만 남아있는 순간일때 이름없이 "님 환영합니다" 만있을시 제거
		if(((Member)session.getAttribute("loginUser")).getUserName().equals("") || ((Member)session.getAttribute("loginUser")).getUserName() == null) {
			try {
				
					
				if((String)session.getAttribute("access_Token") != null) {
					kakao.unlink((String)session.getAttribute("access_Token"));

				}
				session.removeAttribute("access_Token");
				session.removeAttribute("loginUser");
				
				session.setAttribute("alertMsg", "이용할 수 없는 유저입니다.");
				response.sendRedirect("/tresure");

			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return false;
		}
		
		return true;
	}
	
	public String getBlackListStatus(HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginUser");
		if(member == null) {
			return null;
		} 
	
		return member.getBlackListStatus();
	}
	
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
    
	}

	@Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
    }
}
