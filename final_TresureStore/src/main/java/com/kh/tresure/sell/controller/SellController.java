package com.kh.tresure.sell.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.common.Image;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.sell.model.service.SellService;
import com.kh.tresure.sell.model.vo.Sell;

import retrofit2.http.Multipart;

@Controller
@RequestMapping("/sell")
public class SellController {

	private Logger logger = LoggerFactory.getLogger(SellController.class);
	private SellService sellService;

	// 기본생성자
	public SellController() {

	}

	@Autowired
	public SellController(SellService sellService) {
		this.sellService = sellService;
	}

	// 상품등록페이지
	@RequestMapping(value = "/sellInsertForm", method = RequestMethod.GET)
	public String sellInsertForm(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");	
		if(loginUser==null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능");
			return "redirect:/";
		}else {
		
			return "sell/sellInsertForm";
		}
	}

	
	@RequestMapping(value= "/sellInsert", method = RequestMethod.POST)
	public String insertSell (Sell s, Model model, HttpSession session ,
			@RequestParam(value="upfile", required=false) List<MultipartFile> imgList, // 업로드용 이미지파일
			MultipartFile upfile // 첨부파일) {
			) {
			
		String mode = "insert";
		
		String webPath = "/resources/images/sell/";
		String serverFolderPath = session.getServletContext().getRealPath(webPath);
		int result = 0;

		if (!upfile.getOriginalFilename().equals("")) {
			String savePath = session.getServletContext().getRealPath("/resources/images/sell/");
			String changeName = Image.saveFile(upfile, savePath);
			
			
			/*try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				logger.error(e.getMessage());
			}*/
			
			s.setChangeName("resources/images/uploadFiles/" + changeName);
			s.setOriginName(upfile.getOriginalFilename());
		}
		
		if(mode.equals("insert")) {
			// db에 board테이블에 데이터 추가
			
			try {
				result = sellService.insertSell(s, imgList, webPath, serverFolderPath);
			} catch (Exception e) {
				logger.error("에러발생");
				e.printStackTrace();
			}
		}
		
		System.out.println(s);
			
		
		
//		if(mode.equals("insert")) {
//			// db에 board테이블에 데이터 추가
//			
//				
//		}
//			else { // 수정
//		
//			// 게시글 수정 서비스 호출
//			// b객체 안에 boardNo
//			try {
//				result = sellService.updateSell(s);
//			} catch (Exception e) {
//				logger.error("에러발생");
//			}
//		}sell/sellInsert
		
		if (result > 0) {
			session.setAttribute("alertMsg", "상품등록에 성공하셨습니다.");
			return "home";
		} else { // errorPage
			model.addAttribute("errorMsg", "상품등록에 실패하였습니다.");
			return "common/errorPage";
		}
		
		
	}
	
}
	
