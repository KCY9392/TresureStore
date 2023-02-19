package com.kh.tresure.recent.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.recent.controller.RecentController;
import com.kh.tresure.recent.model.service.RecentService;
import com.kh.tresure.recent.model.vo.Recent;

@Controller
@RequestMapping("/recent")
public class RecentController {

	private Logger logger = LoggerFactory.getLogger(RecentController.class);
	private RecentService recentService;
	
	public RecentController () {
		
	}
	
	@Autowired
	public RecentController(RecentService recentService) {
		this.recentService = recentService;
	}
	
	// 상품을 업데이트하는 컨트롤러. 상품이 여러건일 수도 있기 때문에 List<Recent> 타입으로 파라미터 설정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public List<Recent> updateProducts(@RequestBody List<Recent> recentList, HttpSession session) {

		Member member = (Member) session.getAttribute("loginUser");

		// 총 몇개가 INSERT / UPDATE 되었는지 확인하는 변수
		int mergeCnt = 0;
		
		// 삭제화 상품 목록을 가져올 때 사용할 Recent 타입의 변수
		Recent recent = null;

		try {
			// 넘어온 localStorage의 리스트를 Recent recentObj에 담아서 반복
			for (Recent recentObj : recentList) {
				// 반복할 때 recentObj의 userNo에(session) 대입
				recentObj.setUserNo(member.getUserNo());
				
				// mapper에서 MERGE 구문 수행 후 리턴값을 mergeCnt에 넣기
				mergeCnt += recentService.updateProduct(recentObj);
			}


			recent = new Recent();
			// recent의 userNo에(session) 대입
			recent.setUserNo(member.getUserNo());

			// 세션 유저에 해당하는 20건이 넘어가는 상품 목록 삭제
			int deleteCnt = recentService.deleteProducts(recent);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 상품 목록을 가져와서 리턴
		return recentService.viewProduct(recent);
	}

	// 최근 본 상품들의 목록을 가져올 products
	@RequestMapping(value = "/products", method = RequestMethod.POST)
	@ResponseBody
	public List<Recent> viewProducts(HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");

		Recent recent = new Recent();
		// recent의 userNo에 member의 userN 대입
		recent.setUserNo(member.getUserNo());

		// 상품 목록을 가져와서 리턴
		return recentService.viewProduct(recent);
	}

	// 하나 삭제. 즉 최근 본 상품의 X버튼을 클릭하면 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> deleteProducts(Recent recent) {
		Map<String, Integer> resultMap = new HashMap<>();
		
		// result를 key로 deleteProduct의 결과값을 대입.
		resultMap.put("result", recentService.deleteProduct(recent));
		// resultMap을 JSON 형태로 리턴(출력)
		return resultMap;
	}
}
