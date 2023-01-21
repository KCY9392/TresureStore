package com.kh.tresure.chat.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatMessage;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;
import com.kh.tresure.member.model.vo.Member;

public interface ChatService {

	//채팅방 리스트 가져오기
	public List<ChatRoom> selectChatRoomList(int userNo);

	// 채팅방 입장하기
	public HashMap<Object,Object> chattingRoomEnter(int chatRoomNo, String userNo);

	// 채팅방 나가기
	public int exitChatRoom(ChatRoomJoin join);

	//차단 목록 가져오기
	public List<Block> selectBlockList(int userNo);
	
	// 채팅방 메세지 보내기
	public int insertMessage(ChatMessage Message);

}
