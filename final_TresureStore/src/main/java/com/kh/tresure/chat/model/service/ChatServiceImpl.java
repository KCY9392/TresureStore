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
   public HashMap<Object, Object> createAndEnterChatRoom(ChatRoom room, String sellUserNo, ChatRoomJoin roomJoin) {
      
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
      
      // 채팅방 참여
      int result2 = ChatDao.joinCheck(sqlSession, roomJoin);
      if(result2 == 0) {
         ChatDao.inChatRoomJoin(sqlSession, roomJoin);
      }
      
      // 판매게시글 가져오기
      Sell product = SellDao.selectSellProduct(sqlSession, room.getChatRoomNo());
      if(product != null) {
         AllList.put("product", product);
      }
      
      // 메세지 가져오기
      List<ChatMessage> roomMessageList = chatDao.selectChatMessageList(sqlSession, roomJoin);
      if(roomMessageList.size() != 0) {
         AllList.put("roomMessageList", roomMessageList);
         logger.info(roomMessageList+"");
      }
      
      // 구매자 번호, 평점 가져오기
      ChatRoom purchaseInfo = chatDao.selectUserNoByChatRoomNo(sqlSession, room.getChatRoomNo());
      AllList.put("purchaseInfo", purchaseInfo);
      
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
   
   
   //차단 목록에 추가
   @Override
   public int addBlock(Block block) {

      return chatDao.addBlock(sqlSession, block);
   }
   
   //차단 목록에서 삭제
   public int deleteBlock( String chatRoomNo, String userNo, Block block) {
      
      block.setChatRoomNo(Integer.parseInt(chatRoomNo));
      block.setUserNo(Integer.parseInt(userNo));
      
      return chatDao.deleteBlock(sqlSession, block);
   
   }

   
   // 채팅방 메세지 보내기
   public int insertMessage(ChatMessage Message) {
      
      int chatRoomNo = Message.getChatRoomNo();
      int sendUserNo = Message.getUserNo();
      int result = 0;
      ChatRoomJoin roomJoin = new ChatRoomJoin();
      roomJoin.setChatRoomNo(chatRoomNo);
      
      
      ChatRoom room = chatDao.selectChatRoomByNo(sqlSession, chatRoomNo);
      
      // 보내는 사람이 판매자유저번호와같으면 
      if(sendUserNo == room.getSellUserNo()) {
         roomJoin.setUserNo(room.getUserNo());
         result = ChatDao.joinCheck(sqlSession, roomJoin);
      } 
      
      // 보내는 사람이 구매자 유저와같으면
      if(sendUserNo == room.getUserNo() ){
         roomJoin.setUserNo(room.getSellUserNo());
         result = ChatDao.joinCheck(sqlSession, roomJoin);
      }
      
      if( result == 0 ) {
         logger.info(">> 채팅방은? : " + roomJoin.getChatRoomNo());
         logger.info(">> 보내는사람은? : " + sendUserNo);
         logger.info(">> 구매자는?? 나?: " + room.getUserNo());
         logger.info(">> 판매자자는? 상대방!?: " + room.getSellUserNo());
         
         ChatDao.inChatRoomJoin(sqlSession, roomJoin);
      }
      
      
      return chatDao.insertMessage(sqlSession, Message);
   }
   
   
   // 네고 가격결정
   @Override
   public int insertNegoPrice(int negoPrice, int sellNo, int chatRoomNo) {
      
      Sell nego = new Sell();
      nego.setNegoPrice(negoPrice);
      nego.setSellNo(sellNo);
      nego.setChatRoomNo(chatRoomNo);
      
      return SellDao.insertNegoPrice(sqlSession, nego);
      
   }
   

   
   
}