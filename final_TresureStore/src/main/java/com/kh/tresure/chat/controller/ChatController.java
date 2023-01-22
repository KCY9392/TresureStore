package com.kh.tresure.chat.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.tresure.chat.model.service.ChatService;
import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;
import com.kh.tresure.member.model.vo.Member;

@Controller
@SessionAttributes({"chatRoomNo", "loginUser"})
public class ChatController {
	private HttpSession session;
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	private ChatService chatService;
	
	// 기본생성자
	public ChatController() {
		
	}
	
	@Autowired
	public ChatController( ChatService chatService){
		this.chatService = chatService;
	}
	
	
	//채팅방 목록 조회
	@RequestMapping(value = "chat/chatRoomList", method = RequestMethod.GET)
	public String selectChatRoomList( Model model, HttpServletRequest request) {
		
		session = request.getSession();
		if(session.getAttribute("loginUser")== null) {
			
			session.setAttribute("alertMsg", "로그인 후 이용 가능합니다.");
			
			return "redirect:/";
		}else {
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			logger.info(userNo+ ">> 유저 정보 조회");
			
			List<ChatRoom> crList = chatService.selectChatRoomList(userNo);
			
			model.addAttribute("chatRoomList", crList);
			
			logger.info(crList+ ">> 채팅방 리스트 조회");
			
			logger.info(">> 채팅방 리스트로 이동");
			
			return "chat/chatRoomList";
		}
		
	}
	
	
	//채팅방 상세조회(아직 미완성 : 정승필 하는중)
	@RequestMapping(value = "chat/chatRoom/{chatRoomNo}", method = RequestMethod.POST)
	public String enterChatRoom(Model model,
								@PathVariable int chatRoomNo,
								@RequestParam String userNo,
								ChatRoomJoin join
								) {
		join.setUserNo(Integer.parseInt(userNo));
		join.setChatRoomNo(chatRoomNo);
		HashMap<Object,Object> AllList = new HashMap<>();
		
		logger.info(">> 채팅방으로 이동");
		
		model.addAttribute("chatRoomNo", chatRoomNo );
		AllList =  chatService.chattingRoomEnter(chatRoomNo, userNo, join);
		
		if(AllList.size() > 0) {
			
			
			model.addAttribute("AllList", AllList);
			
			return "chat/chatRoom";
			
		} else {
			
			session.setAttribute("alertMsg", "채팅방 입장에 실패하였습니다.");
			return "redirect:/";
		}
		
		
	}
	
	
	//채팅방 차단목록 이동
	@RequestMapping(value = "chat/chatBlockList", method = RequestMethod.GET)
	public String selectBlockList(Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		List<Block> blockList = chatService.selectBlockList(userNo);
		
		model.addAttribute("chatRoomList", blockList);
		
		logger.info(">> 차단목록으로 이동");
		
		return "chat/chatBlockList";
	}
	
	//채팅방 나가기
	@RequestMapping(value = "chat/chatRoom/{chatRoomNo}", method = RequestMethod.GET)
	@ResponseBody //@ResponseBody :데이터 자체를 반환
	public int exitChatRoom(@ModelAttribute("loginUser") Member loginUser,
							@PathVariable int chatRoomNo,
							ChatRoomJoin join) {
		
		return chatService.exitChatRoom(join);
		 
	}

}
