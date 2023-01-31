package com.kh.tresure.follow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tresure.follow.model.service.FollowService;
import com.kh.tresure.follow.model.vo.Follow;
import com.kh.tresure.member.model.vo.Member;

@Controller
@RequestMapping("/follow")
public class FollowController {

	private Logger logger = LoggerFactory.getLogger(FollowController.class);
	private FollowService followService;

	// 기본생성자
	public FollowController() {

	}

	@Autowired
	public FollowController(FollowService followService) {
		this.followService = followService;
	}

	@RequestMapping(value = "/followList")
	public String followList(HttpSession session, Model model) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		Follow follow = new Follow();
		follow.setFiId(loginUser.getUserNo());
		
		List<Follow> followList = followService.selectFollowList(follow);

		model.addAttribute("followList", followList);
		/* model.addAttribute("loginUser", followService.selectMember(follow)); */
		
		return "follow/followingDetailForm";
	}
	
	
	public int selectFollow(Follow follow, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		follow.setFiId(member.getUserNo());

		return followService.selectFollow(follow);
	}

	// 팔로우
	@RequestMapping(value = "/addFollow")
	@ResponseBody
	public Map<String, Integer> addFollow(Follow follow, HttpSession session) {

		HashMap<String, Integer> json = new HashMap<>();

		try {

			int count = selectFollow(follow, session);

			if (count == 0) {
				json.put("result", followService.insertFollow(follow));
			} else {
				json.put("result", 2); // 이미 존재한다.
			}

		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", -1); // 오류 시에 -1로 세팅
		} finally {
			logger.debug("JSON : {}", json);
		}

		return json;
	}

	// 팔로우
	@RequestMapping(value = "/delFollow")
	@ResponseBody
	public Map<String, Integer> delFollow(Follow follow, HttpSession session) {

		HashMap<String, Integer> json = new HashMap<>();

		try {

			selectFollow(follow, session);
			logger.debug("FOLLOW : {}", follow);
			json.put("result", followService.deleteFollow(follow));

		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", -1); // 오류 시에 -1로 세팅
		} finally {
			logger.debug("JSON : {}", json);
		}

		return json;
	}
}
