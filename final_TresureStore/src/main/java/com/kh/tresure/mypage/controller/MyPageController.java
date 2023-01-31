package com.kh.tresure.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tresure.heart.model.vo.Heart;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.mypage.model.service.MyPageService;
import com.kh.tresure.review.model.vo.Review;
import com.kh.tresure.sell.model.vo.Sell;


@Controller
public class MyPageController {
	private Logger logger = LoggerFactory.getLogger(MyPageController.class);
	private MyPageService  mypageService;
	
	public MyPageController() {
		
	}
	
	
	@Autowired
	public MyPageController(MyPageService mypageService) {
		this.mypageService = mypageService;
	}
	
	
	
	@RequestMapping(value = "member/myPage", method = RequestMethod.GET)
	public String myPage(HttpServletRequest request,Model m) {
		HttpSession session = request.getSession();
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");	
		if(loginUser==null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능");
			return "redirect:/";
		}else {
			logger.info(">> 마이페이지 폼으로 이동");
			
			//상품판매 조회
			int sellCount = mypageService.sellCount(loginUser.getUserNo());
			//팔로워 수 조회
			int followCount = mypageService.followCount(loginUser.getUserNo());
			//신고 수 조회
			int reportCount = mypageService.reportCount(loginUser.getUserNo());
			
			//상점 오픈일
			int marketOpen = mypageService.marketOpen(loginUser.getUserNo());
			
			//리뷰 평점
			int reviewAvg = mypageService.reviewAvg(loginUser.getUserNo());
			
			
			
			//판매상품 리스트
			List<Sell> sellList = mypageService.mypageSellList(loginUser.getUserNo());
			//찜 상품 리스트
			List<Heart> heartList = mypageService.mypageHeartList(loginUser.getUserNo());
			//리뷰 리스트
			List<Review> reviewList = mypageService.mypageReviewList(loginUser.getUserNo());
			m.addAttribute("sellCount", sellCount);
			m.addAttribute("followCount", followCount);
			m.addAttribute("reportCount", reportCount);
			m.addAttribute("marketOpen", marketOpen);
			m.addAttribute("sellList", sellList);
			m.addAttribute("heartList", heartList);
			m.addAttribute("reviewList", reviewList);
			m.addAttribute("reviewAvg", reviewAvg);

			
			System.out.println();
			
			return "member/myPage";
		}
		
	}
	
	
	
	@RequestMapping(value = "member/tracsac", method = RequestMethod.GET)
	public String tracsac(Model m,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");	
		
		//판매내역
		List<Sell> sellList = mypageService.mypageSellList(loginUser.getUserNo());
		m.addAttribute("sellList", sellList);
		
		//구매내역
		List<Sell> purchaseList = mypageService.mypagePurchaseList(loginUser.getUserNo());
		m.addAttribute("purchaseList", purchaseList);
		
		return "member/tracsac";
	}

	
	
	@ResponseBody
	@RequestMapping("changeStatus")
	public int changeStatus(@PathVariable("sellNo") int sellNo) {
		int result = 0;
		if(result==0) {
			
			mypageService.changeStatus(sellNo);
			result =1;
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	

}
