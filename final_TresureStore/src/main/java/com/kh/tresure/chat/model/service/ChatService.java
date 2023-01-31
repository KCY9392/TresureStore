package com.kh.tresure.chat.model.service;

import java.util.HashMap;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatMessage;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;
import com.kh.tresure.member.model.vo.Member;

public interface ChatService {

   //채팅방 리스트 가져오기
   public List<ChatRoom> selectChatRoomList(int userNo);

   // 채팅하기 (방생성 > 입장하기 or 입장하기)
   public HashMap<Object, Object> createAndEnterChatRoom(ChatRoom room, String sellUserNo, ChatRoomJoin roomJoin);

   // 채팅방 나가기
   public int exitChatRoom(ChatRoomJoin join, String chatRoomNo, String userNo);

   //차단 목록 가져오기
   public List<Block> selectBlockList(int userNo);
   
   //차단 목록에 추가
   public int addBlock(Block block);
   
   //차단 목록에서 삭제
   public int deleteBlock(String chatRoomNo, String userNo, Block block);
   
   // 채팅방 메세지 보내기
   public int insertMessage(ChatMessage Message);

   // 네고 가격결정
   public int insertNegoPrice(int negoPrice, int sellNo, int chatRoomNo);

   


}