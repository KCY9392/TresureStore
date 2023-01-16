package com.kh.tresure.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.chat.model.vo.ChatRoom;

@Repository
public class ChatDao {

	//채팅방 리스트 가져오기
	public List<ChatRoom> selectChatRoomList(SqlSession sqlSession) {

		return sqlSession.selectList("chattingMapper.selectChatRoomList");
	
	}
	
	
	
	
}
