package com.kh.tresure.chat.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tresure.chat.model.service.ChatService;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.member.model.vo.Member;

@Controller
public class ChatController {

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
	public String selectChatRoomList(Model model, Member loginUser) {
		
		List<ChatRoom> crList = chatService.selectChatRoomList(loginUser);
		
		model.addAttribute("chatRoomList", crList);
		
		logger.info(">> 채팅방 리스트로 이동");
		
		return "chat/chatRoomList";
	}
	
	
	//채팅방 상세조회
	@RequestMapping(value = "chat/chatRoom", method = RequestMethod.GET)
	public String enterChatRoom(Model model) {
		
		logger.info(">> 채팅방으로 이동");
		
		return "chat/chatRoom";
	}
	
	
	//채팅방 차단목록 이동
	@RequestMapping(value = "chat/chatBlockList", method = RequestMethod.GET)
	public String enterChatBlockList(Model model) {
		
		logger.info(">> 차단목록으로 이동");
		
		return "chat/chatBlockList";
	}
}
