package com.kh.tresure.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.tresure.chat.model.service.ChatServiceImpl;
import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatMessage;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;

@Repository
public class ChatDao {
	private Logger logger = LoggerFactory.getLogger(ChatDao.class);
	
	//채팅방 리스트 가져오기
	public List<ChatRoom> selectChatRoomList(SqlSession sqlSession, int userNo) {

		return sqlSession.selectList("chattingMapper.selectChatRoomList", userNo);
	
	}

	
	//채팅방 나가기
	public int exitChatRoom(SqlSession sqlSession, ChatRoomJoin join) {

		return sqlSession.delete("chattingMapper.exitChatRoom", join);
	}

	//차단 리스트 가져오기
	public List<Block> selectBlockList(SqlSession sqlSession, int userNo) {
		
		return sqlSession.selectList("chattingMapper.selectBlockList", userNo);
	}
	
	//차단 리스트에 추가
	public int addBlock(SqlSession sqlSession) {
		
		return sqlSession.insert("chattingMapper.addBlock");
	}
	
	
	// 메세지 입력하기
	public int insertMessage(SqlSession sqlSession, ChatMessage message) {
		
		return sqlSession.insert("chattingMapper.insertMessage", message);
	}

	// 채팅방 참여확인
	public static int joinCheck(SqlSession sqlSession, ChatRoomJoin join) {
		
		return sqlSession.selectOne("chattingMapper.joinCheck", join);
	}

	// 채팅방 참여
	public static void inChatRoomJoin(SqlSession sqlSession, ChatRoomJoin join) {
		
		sqlSession.insert("chattingMapper.inChatRoomJoin", join);
	}

	// 채팅방 메세지
	public List<ChatMessage> selectChatMessageList(SqlSession sqlSession, ChatRoomJoin join) {
		
		return sqlSession.selectList("chattingMapper.selectChatMessageList", join);
	}

	// 채팅방 생성하기
	public int createChatRoom(SqlSession sqlSession, ChatRoom room) {
		
		int result =  sqlSession.insert("chattingMapper.createChatRoom", room);
		
		if(result > 0) {

			return room.getChatRoomNo();
		} else {
			return 0;
		}
	}


	// 채팅방이 존재하는지 확인 (객체에 판매글 번호와 채팅 신청한 유저번호)
	public int selectChatRoomByObject(SqlSession sqlSession, ChatRoom room) {
		
		return sqlSession.selectOne("chattingMapper.selectChatRoomByObject", room);
	}

	// 채팅방 번호가져오기
	public int selectChatRoomNo(SqlSession sqlSession, ChatRoom room) {

		return sqlSession.selectOne("chattingMapper.selectChatRoomNo", room);
	}

	// 채팅방번호로 인해 채팅방 정보가져오기
	public ChatRoom selectChatRoomByNo(SqlSession sqlSession, int chatRoomNo) {

		return sqlSession.selectOne("chattingMapper.selectChatRoomByNo", chatRoomNo);
	}








	
	
	
	
}
