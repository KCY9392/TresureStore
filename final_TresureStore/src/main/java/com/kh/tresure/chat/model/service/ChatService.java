package com.kh.tresure.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatFiles;
import com.kh.tresure.chat.model.vo.ChatMessage;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.sell.model.vo.Sell;

public interface ChatService {

   //채팅방 리스트 가져오기
   public List<ChatRoom> selectChatRoomList(int userNo);

   // 채팅하기 (방생성 > 입장하기 or 입장하기)
   public HashMap<Object, Object> createAndEnterChatRoom(ChatRoom room, String sellUserNo, ChatRoomJoin roomJoin, Block block);

   // 채팅방 나가기
   public int exitChatRoom(ChatRoomJoin join, String chatRoomNo, String userNo);

   //차단 목록 가져오기
   public List<Block> selectBlockList(int userNo);
   
   // 채팅방 메세지 보내기
   public int insertMessage(ChatMessage Message);

   // 네고 가격결정
   public int insertNegoPrice(int negoPrice, int sellNo, int chatRoomNo, Sell nego);

   // 로그인한 유저가 상대방 차단 하기
   public int addBlock(int sellUserNo, int chatRoomNo, int purchaseUserNo, int userNo, Block block);

   // 차단 풀기
   public int deleteBlock(String sellUserNo, String chatRoomNo, String purchaseUserNo, int userNo, Block block, String blockedUserNo);

   // 채팅 첨부파일 데베 저장
   public int insertchatImage(ChatFiles chatfiles);

   // 스케줄링 실행할 채팅창 첨부파일 가져오기
   public ArrayList<ChatFiles> selectAttachment();



}