package com.kh.tresure.chat.model.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.tresure.chat.controller.ChatController;
import com.kh.tresure.chat.model.dao.ChatDao;
import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatMessage;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.sell.model.dao.SellDao;
import com.kh.tresure.sell.model.vo.Sell;

@Service
public class ChatServiceImpl implements ChatService{
	private ChatDao chatDao;
	private SqlSession sqlSession;
	private Logger logger = LoggerFactory.getLogger(ChatServiceImpl.class);
	
	@Autowired
	public ChatServiceImpl(ChatDao chatDao, SqlSession sqlSession) {
		this.chatDao = chatDao;
		this.sqlSession = sqlSession;
	}
	
	@Override
	//채팅 목록 조회
	public List<ChatRoom> selectChatRoomList(int userNo){
		
		return chatDao.selectChatRoomList(sqlSession, userNo);
	}
	
	// 채팅방 입장하기
	@Override
	public HashMap<Object,Object> chattingRoomEnter(int chatRoomNo, String userNo, ChatRoomJoin join) {
		
		HashMap<Object,Object> AllList = new HashMap<>();
		
			
		// 판매게시글 가져오기
		Sell product = SellDao.selectSellProduct(sqlSession, chatRoomNo);
		if(product != null) {
			AllList.put("product", product);
		}
		
		
		// 채팅방 참여
		int result = ChatDao.joinCheck(sqlSession, join);
		if(result == 0) {
			ChatDao.inChatRoomJoin(sqlSession, join);
		}
		// 메세지 가져오기
		List<ChatMessage> roomMessageList = chatDao.selectChatMessageList(sqlSession, join);
		if(roomMessageList.size() != 0) {
			AllList.put("roomMessageList", roomMessageList);
			logger.info(roomMessageList+"");
		}
		
		
		// 첨부파일 가져오기
			

		
		return AllList; 
		
	}
	
	//채팅방 나가기
	@Override
	public int exitChatRoom(ChatRoomJoin join) {

		return  chatDao.exitChatRoom(sqlSession, join.getChatRoomNo());
			
	}
	
	//차단 목록 가져오기
	@Override
	public List<Block> selectBlockList(int userNo){
		
		return chatDao.selectBlockList(sqlSession, userNo);
		
	}
	
	// 채팅방 메세지 보내기
	public int insertMessage(ChatMessage Message) {
		
		return chatDao.insertMessage(sqlSession, Message);
	}
	
	
}
