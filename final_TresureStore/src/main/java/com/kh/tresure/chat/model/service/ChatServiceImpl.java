package com.kh.tresure.chat.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.chat.model.dao.ChatDao;
import com.kh.tresure.chat.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService{

	private ChatDao chatDao;
	private SqlSession sqlSession;
	
	@Autowired
	public ChatServiceImpl(ChatDao chatDao, SqlSession sqlSession) {
		this.chatDao = chatDao;
		this.sqlSession = sqlSession;
	}
	
	@Override
	//채팅 목록 조회
	public List<ChatRoom> selectChatRoomList(){
		
		return chatDao.selectChatRoomList(sqlSession);
	}
	
}
