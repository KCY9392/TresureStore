package com.kh.tresure.sell.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	
	@RequestMapping(value="/sellDetail/{sellNo}", method= RequestMethod.GET)
	public ModelAndView sellDetail (
			ModelAndView mv, HttpSession session,
			@PathVariable("sellNo") int sellNo,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception{
	
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			
			HashMap<String, Integer> map = new HashMap<>();
			map.put("sellNo", sellNo);
			
			if(loginUser!=null) {
			map.put("userNo", loginUser.getUserNo());
			}
			Sell s = sellService.selectSellDetail(map);
			
			logger.info("s : "+s);
	
//		// 쿠키를 이용해서 조회수 중복으로 증가되지 않도록 방지 + 본인의 글은 애초에 조회수가 증가되지않도록
//		if(s != null) { //상세 조회 성공
//			
//			int userNo = 0;
//			if(loginUser != null) {
//				userNo = loginUser.getUserNo();
//			}
//			
//			//작성자의 번호와 현재세션의 유저번호가 같지않을 때만 조회수 증가
//			if(s.getUserNo() != userNo) {
//				
//				Cookie cookie = null; //기존의 존재하던 쿠키를 저장하는 변수
//				
//				Cookie[] cArr = req.getCookies(); //쿠키얻기
//				
//				if(cArr != null && cArr.length > 0) {
//					for( Cookie c : cArr) {
//						if(c.getName().equals("readsellNo")) {
//							cookie = c;
//							break;
//						}
//					}
//				}
//				
//				int result = 0;
//				if(cookie == null) { //원래 readsellNo라는 이름의 쿠키가 없다
//					cookie = new Cookie("readsellNo", sellNo+"");//쿠키생성
//					result = sellService.increaseCount(sellNo); //조회수 증가서비스 호출
//	
//				}else { 
//					
//					String[] arr = cookie.getValue().split("/");
//					List<String> list = Arrays.asList(arr); //일치하지 않는 다면, -1반환(아직 조회하지않은 게시물임)
//					
//					if(list.indexOf(sellNo+"") == -1) { //기존값에 같은 글 번호가 없다면,
//						
//						cookie.setValue(cookie.getValue()+"/"+sellNo);
//						result = sellService.increaseCount(sellNo);//조회수 증가서비스 호출
//					}
//				}
//				
//				if(result > 0) { // 성공적으로 조회수가 증가되었다.
//					s.setCount(s.getCount()+1);
//					
//					cookie.setPath(req.getContextPath());
//					cookie.setMaxAge(60*60*1); //1시간
//					res.addCookie(cookie); //응답객체인 response에 쿠키가 담겨져서 사용자에게 전송됨
//					
//				}
//			}
			//상세보기할 정보를 조회
			mv.addObject("s",s);
			mv.setViewName("sell/sellDetailForm");
			
//			}
//		mv.setViewName("sell/sellDetailForm");
			return mv;
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
	
