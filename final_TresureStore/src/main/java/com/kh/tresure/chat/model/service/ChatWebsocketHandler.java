package com.kh.tresure.chat.model.service;



import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebsocketHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ChatWebsocketHandler.class);
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		
		logger.info(session.getId() + "연결됨"); 
        
		sessions.add(session); 
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		
		logger.info(session.getId() + "종료됨");
		
		sessions.remove(session);
	}
	

	public void handlerMessage(WebSocketSession session, WebSocketMessage message) throws Exception {
		
		// 나중에 작성할거임
		logger.info("전달된 메세지; : " + message.getPayload()); 
	}
}
