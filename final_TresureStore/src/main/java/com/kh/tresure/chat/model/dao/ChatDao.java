package com.kh.tresure.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatMessage;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;

@Repository
public class ChatDao {

	//채팅방 리스트 가져오기
	public List<ChatRoom> selectChatRoomList(SqlSession sqlSession, int userNo) {

		return sqlSession.selectList("chattingMapper.selectChatRoomList", userNo);
	
	}

	
	//채팅방 나가기
	public int exitChatRoom(SqlSession sqlSession, int join) {

		return sqlSession.delete("chattingMapper.exitChatRoom", join);
	}

	//차단 리스트 가져오기
	public List<Block> selectBlockList(SqlSession sqlSession, int userNo) {
		
		return sqlSession.selectList("chattingMapper.selectBlockList", userNo);
	}
	
	// 메세지 입력하기
	public int insertMessage(SqlSession sqlSession, ChatMessage message) {
		
		return sqlSession.insert("chattingMapper.insertMessage", message);
	}
	
	
	
	
}
