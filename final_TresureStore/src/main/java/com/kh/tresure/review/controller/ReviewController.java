package com.kh.tresure.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.review.model.service.ReviewService;
import com.kh.tresure.review.model.vo.Review;

import org.json.simple.JSONObject;

@Controller
public class ReviewController {
	
	private Logger logger = LoggerFactory.getLogger(ReviewController.class);
	private ReviewService reviewService;
	
	// 기본생성자
	public ReviewController() {
		
	}
	
	@Autowired
	public ReviewController(ReviewService reviewService) {
		this.reviewService = reviewService;
		
	}
	
	/**
	 * review 등록 */
	@ResponseBody
	@RequestMapping(value="reviewInsertUpdate")
	public int reviewInsert(@RequestParam("rating") int score,
							@RequestParam("reviewContent") String reviewContent,
							@RequestParam("sellNo") int sellNo, 
							@RequestParam("reviewIs") String reviewIs,
							HttpSession session) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		int result = reviewService.reviewInsertUpdate(score, reviewContent, sellNo, userNo, reviewIs);
		
		logger.info("rating : "+score);
		logger.info("reviewContent : "+reviewContent);
		logger.info("sellNo : "+sellNo);
		
		return result;
	}
	
	/**
	 * review 수정할 Form 데이터 가져오기 */
	@ResponseBody
	@RequestMapping(value="reviewDetail")
	public Object reviewDetail(@RequestParam("sellNo") int sellNo, HttpSession session,
								HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		Review review = reviewService.reviewDetail(userNo, sellNo);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(review);
	}
	
	
	/**
	 * review 삭제 */
	@ResponseBody
	@RequestMapping(value="reviewDelete")
	public int reviewDelete(@RequestParam("sellNo") int sellNo, HttpSession session) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int result = reviewService.reviewDelete(userNo, sellNo);
		
		return result;
	}
	
}
