package com.kh.tresure.review.controller;

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

import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.review.model.service.ReviewService;
import com.kh.tresure.review.model.vo.Review;

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
	
	
}
