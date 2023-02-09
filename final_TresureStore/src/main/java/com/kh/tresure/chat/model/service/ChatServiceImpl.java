package com.kh.tresure.chat.model.service;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.tresure.chat.model.dao.ChatDao;
import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatFiles;
import com.kh.tresure.chat.model.vo.ChatMessage;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;
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
   
   // 채팅하기 (방생성 > 입장하기 or 입장하기)
   @Override
   @Transactional
   public HashMap<Object, Object> createAndEnterChatRoom(ChatRoom room, String sellUserNo, ChatRoomJoin roomJoin, Block block) {
      
      HashMap<Object,Object> AllList = new HashMap<>();
      int chatRoomNo = 0;
      
      
      if(Integer.parseInt(sellUserNo) != room.getUserNo()) {
         // 채팅방 존재하는지 검사
         int result = chatDao.selectChatRoomByObject(sqlSession, room);
         
         // 채팅방 생성
         if(result == 0) {
            chatRoomNo = chatDao.createChatRoom(sqlSession, room);
         } else {
            chatRoomNo = chatDao.selectChatRoomNo(sqlSession, room);
         }
      } else {
         chatRoomNo = room.getChatRoomNo();
      }
      
      if(chatRoomNo == 0) {
         return AllList;
      }
      
      room.setChatRoomNo(chatRoomNo);
      AllList.put("chatRoomNo", chatRoomNo);
      
      logger.info("내가고른 chatRoomNo : " + chatRoomNo);
      
      roomJoin.setChatRoomNo(room.getChatRoomNo());
      roomJoin.setUserNo(room.getUserNo());
      
      // 채팅방 참여 (o)
      int result2 = chatDao.joinCheck(sqlSession, roomJoin);
      if(result2 == 0) {
         chatDao.inChatRoomJoin(sqlSession, roomJoin);
      }
      
      // 판매게시글 가져오기 (o)
      Sell product = SellDao.selectSellProduct(sqlSession, room.getChatRoomNo());
      if(product != null) {
         AllList.put("product", product);
      }
      
      // 메세지 가져오기 (o)
      List<ChatMessage> roomMessageList = chatDao.selectChatMessageList(sqlSession, roomJoin);
      if(roomMessageList.size() != 0) {
         AllList.put("roomMessageList", roomMessageList);
      }
      
      // 구매자 번호, 평점 가져오기 (x) 이거 왜 실패냐
      ChatRoom purchaseInfo = chatDao.selectUserNoByChatRoomNo(sqlSession, room.getChatRoomNo());
      AllList.put("purchaseInfo", purchaseInfo);
      
      // 현재 채팅방에서 누군가 차단했는지 확인하기
      ChatRoom Users = chatDao.selectUsers(sqlSession, chatRoomNo);
      
      // 경우1) 구매자가 판매자 차단한경우 찾기
      block.setBlockerNo(Users.getUserNo());
      block.setBlockedNo(Users.getSellUserNo());
      int puTose = chatDao.selectBlockFind1(sqlSession, block);
      
      // 경우2) 판매자가 구매자 차단한경우 찾기
      block.setBlockerNo(Users.getSellUserNo());
      block.setBlockedNo(Users.getUserNo());
      int seTopu = chatDao.selectBlockFind2(sqlSession, block);
      

      AllList.put("puTose", puTose);
      AllList.put("seTopu", seTopu);
      
      // 탈퇴한 사람있는지 찾기
      int state = chatDao.selectMemberFind(sqlSession, chatRoomNo);
      if(state == 0) { // 탈퇴한 사람이 있으면 0
    	  AllList.put("state", state);
      }
      
      
      // 첨부파일 가져오기
         

      
      return AllList; 
      
   }
   
   //채팅방 나가기
   @Override
   public int exitChatRoom(ChatRoomJoin join, String chatRoomNo, String userNo) {

      join.setChatRoomNo(Integer.parseInt(chatRoomNo));
      join.setUserNo(Integer.parseInt(userNo));
      
      return  chatDao.exitChatRoom(sqlSession, join);
         
   }
   
   //차단 목록 가져오기
   @Override
   public List<Block> selectBlockList(int userNo){
      
      return chatDao.selectBlockList(sqlSession, userNo);
      
   }
   

   
   // 채팅방 메세지 보내기
   public int insertMessage(ChatMessage Message) {
      
      int chatRoomNo = Message.getChatRoomNo();
      int sendUserNo = Message.getUserNo();
      int result = 0;
      ChatRoomJoin roomJoin = new ChatRoomJoin();
      Block block = new Block();
      
      roomJoin.setChatRoomNo(chatRoomNo);
      
      
      ChatRoom room = chatDao.selectChatRoomByNo(sqlSession, chatRoomNo);
      
      // 보내는 사람이 판매자유저번호와같으면 
      if(sendUserNo == room.getSellUserNo()) {
    	  
         roomJoin.setUserNo(room.getUserNo());
         
         // 보내는 사람이 차단 당했는지 확인
         block.setBlockedNo(sendUserNo);
         block.setBlockerNo(room.getUserNo());
         
         int blockCheck = chatDao.blockCheck(sqlSession, block);
         if(blockCheck != 0) {
        	 return 0;
         }
         
         result = chatDao.joinCheck(sqlSession, roomJoin);
      } 
      
      // 보내는 사람이 구매자 유저와같으면
      if(sendUserNo == room.getUserNo() ){
         roomJoin.setUserNo(room.getSellUserNo());
         
         // 보내는 사람이 차단 당했는지 확인
         block.setBlockedNo(sendUserNo);
         block.setBlockerNo(room.getSellUserNo());
         
         int blockCheck = chatDao.blockCheck(sqlSession, block);
         if(blockCheck != 0) {
        	 return 0;
         }
         
         result = chatDao.joinCheck(sqlSession, roomJoin);
      }
      
      if( result == 0 ) {
         
         chatDao.inChatRoomJoin(sqlSession, roomJoin);
      }
      
      
      return chatDao.insertMessage(sqlSession, Message);
   }
   
   
   // 네고 가격결정
   @Override
   public int insertNegoPrice(int negoPrice, int sellNo, int chatRoomNo, Sell nego) {

      nego.setNegoPrice(negoPrice);
      nego.setSellNo(sellNo);
      nego.setChatRoomNo(chatRoomNo);
      
      return SellDao.insertNegoPrice(sqlSession, nego);
      
   }
   
   // 로그인한 유저가 상대방 차단 하기
   public int addBlock(int sellUserNo, int chatRoomNo, int purchaseUserNo, int userNo, Block block) {
	   
	   
	   
	   block.setBlockerNo(userNo);
	   
	   // 로그인한 유저가 구매자인 경우
	   if(userNo == purchaseUserNo) {
		   block.setBlockedNo(sellUserNo);
		   
	   } else if ( userNo == sellUserNo ) {	// 로그인한 유저가 판매자인경우
		   block.setBlockedNo(purchaseUserNo);  
	   }
	   
	   int result = chatDao.addBlock(sqlSession, block);
	   
	   return result;
   }

   // 로그인한 유저가 상대방 차단 풀기
   public int deleteBlock(int sellUserNo, int chatRoomNo, int purchaseUserNo, int userNo, Block block) {
	   
	   block.setBlockerNo(userNo);
	   
	   // 로그인한 유저가 구매자인 경우
	   if(userNo == purchaseUserNo) {
		   block.setBlockedNo(sellUserNo);
		   
	   } else if ( userNo == sellUserNo ) {	// 로그인한 유저가 판매자인경우
		   block.setBlockedNo(purchaseUserNo);  
	   }
	   
	   int result = chatDao.deleteBlock(sqlSession, block);
	   
	   
	   return result;
   }
   
   
   //채팅 첨부파일 보내기
   public int insertchatImage(ChatFiles chatfiles) {
	   
	   return chatDao.insertchatImage(sqlSession, chatfiles);
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}