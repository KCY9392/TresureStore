package com.kh.tresure.chat.model.service;



import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.tresure.chat.model.vo.ChatMessage;

public class ChatWebsocketHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ChatWebsocketHandler.class);
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	private ChatService chatService;
	
	@Autowired
	public ChatWebsocketHandler(ChatService chatService) {
		this.chatService = chatService;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		
		logger.info(session.getId() + " 연결됨"); 
        
		sessions.add(session); 
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		
		logger.info(session.getId() + " 종료됨");
		
		sessions.remove(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
	    logger.info("전달된 메세지; : " + message.getPayload()); 

	    // Jackson-databind : ObjectMapper 를 이용해서 JSON형태로 넘어온 데이터를 특정VO필드에 맞게 자동매핑
	    ObjectMapper objectMapper = new ObjectMapper();

	    
	    ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
	    chatMessage.setCreateDate(new Date(System.currentTimeMillis()));

	    
	    int result = chatService.insertMessage(chatMessage);
	    
	    if(result > 0) {
	        // 같은방에 접속중인 클라이언트에게 전달받은 메세지를 보내기
	        for(WebSocketSession s : sessions) {
	            //반복을 진행중인 websocketSession안에 담겨있는 방번호
	            int chatRoomNo = (Integer)s.getAttributes().get("chatRoomNo");

	            //메세지에 담겨있는 채팅방 번호와 chatRoomNo가 같은지 비교
	            if(chatMessage.getChatRoomNo() == chatRoomNo) {
	                //같은 방 클라이언트에게 JSON형식으로 메세지를 보냄

	                s.sendMessage(new TextMessage( new Gson().toJson(chatMessage )));
	            }
	        }

	    }
	}
}