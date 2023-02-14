package com.kh.tresure.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.tresure.chat.model.dao.ChatDao;
import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatFiles;
import com.kh.tresure.chat.model.vo.ChatMessage;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;

import com.kh.tresure.common.model.dto.PageInfo;
import com.kh.tresure.common.template.Pagination;
import com.kh.tresure.member.model.dao.MemberDao;
import com.kh.tresure.member.model.vo.Account;

import com.kh.tresure.sell.model.dao.SellDao;
import com.kh.tresure.sell.model.vo.Sell;

@Service
public class ChatServiceImpl implements ChatService{
   private ChatDao chatDao;
   private SqlSession sqlSession;
   private Pagination pagination;
   private Logger logger = LoggerFactory.getLogger(ChatServiceImpl.class);
   
   @Autowired
   public ChatServiceImpl(SqlSession sqlSession, ChatDao chatDao, Pagination pagination) {
	   this.sqlSession = sqlSession;
	   this.chatDao = chatDao;
	   this.pagination = pagination;
      
   }
   
   
   /**
    * 채팅방 리스트 가져오기 (페이징처리) - 리팩토링 완료
    */
   @Override
   public HashMap<Object, Object> selectChatRoomList(int userNo, HashMap<Object, Object> paramMap, int currentPage){
	   
	   
	   
	   // 페이징 처리
	   int listCount = chatDao.selectChatListCount(sqlSession, userNo);
	   int pageLimit = 10;
	   int viewLimit = 10;
	   
	   PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, viewLimit);
	   
	   // 페이징 처리와 유저번호 해시맵에 담기
	   paramMap.put("userNo", userNo);
	   paramMap.put("pi", pi);
	   
	   List<ChatRoom> crList = chatDao.selectChatRoomList(sqlSession, paramMap);
	   
	   // 객체 해시맵에 담기
	   paramMap.put("crList", crList);
	   
	   return paramMap;
   }
   
   /**
    * 채팅방 생성하기, 입장하기 - 리팩토링 완료
    */
   @Override
   @Transactional
   public HashMap<Object, Object> createAndEnterChatRoom(HashMap<Object, Object> allList, ChatRoom room, String sellUserNo, 
		   													ChatRoomJoin roomJoin, Block block, Account account) {
      // Controller 에서 채팅방 번호를 null 값으로 받았을 경우를 대비

      int chatRoomNo = 0;
      
      // 구매자만 채팅방 만들 수 있음
      if(Integer.parseInt(sellUserNo) != room.getUserNo()) {
    	  
         // 채팅방 존재하는지 검사
         int roomCheck = chatDao.selectChatRoomByObject(sqlSession, room);
         
         // 채팅방 생성
         if(roomCheck == 0) {
            chatRoomNo = chatDao.createChatRoom(sqlSession, room);
         } else {
            chatRoomNo = chatDao.selectChatRoomNo(sqlSession, room);
         }
         
      } else {	// 채팅방 목록에서 들어올 때
         chatRoomNo = room.getChatRoomNo();
      }
      
      // 채팅방이 없거나, 생성하지 못했으면 못들어가게 해야하므로 리턴
      if(chatRoomNo == 0) {
         return allList;
      }
      
      room.setChatRoomNo(chatRoomNo);
      allList.put("chatRoomNo", chatRoomNo);
      
      // 채팅방 들어온 사람 유저번호와, 채팅방 번호 넣은 객체
      roomJoin.setChatRoomNo(room.getChatRoomNo());
      roomJoin.setUserNo(room.getUserNo());
      
      // 채팅방 참여되어 있는지 체크 (o)
      int inRoomCheck = chatDao.joinCheck(sqlSession, roomJoin);
      if(inRoomCheck == 0) {
         chatDao.inChatRoomJoin(sqlSession, roomJoin);
      }
      
      // 판매 제품 정보 가져오기 (o)
      Sell product = SellDao.selectSellProduct(sqlSession, room.getChatRoomNo());
      if(product != null) {
    	  allList.put("product", product);
      }
      
      // 메세지 가져오기 (o)
      List<ChatMessage> roomMessageList = chatDao.selectChatMessageList(sqlSession, roomJoin);
      if(roomMessageList.size() != 0) {
    	  allList.put("roomMessageList", roomMessageList);
      }
      
      // 구매자 번호, 평점 가져오기 (o)
      ChatRoom purchaseInfo = chatDao.selectUserNoByChatRoomNo(sqlSession, room.getChatRoomNo());
      allList.put("purchaseInfo", purchaseInfo);
      
      
      // 현재 채팅방에서 누군가 차단했는지 확인하기 (판매자,구매자 유저번호 가져옴)
      ChatRoom Users = chatDao.selectUsers(sqlSession, chatRoomNo);
      
      // 경우1) 구매자가 판매자 차단한경우 찾기
      block.setBlockerNo(Users.getUserNo());
      block.setBlockedNo(Users.getSellUserNo());
      int puTose = chatDao.selectBlockFind1(sqlSession, block);
      
      // 경우2) 판매자가 구매자 차단한경우 찾기
      block.setBlockerNo(Users.getSellUserNo());
      block.setBlockedNo(Users.getUserNo());
      int seTopu = chatDao.selectBlockFind2(sqlSession, block);
      
      allList.put("puTose", puTose);
      allList.put("seTopu", seTopu);
      
      // 탈퇴한 사람있는지 찾기
      int state = chatDao.selectMemberFind(sqlSession, chatRoomNo);
      if(state == 0) { // 탈퇴한 사람이 있으면 0
    	  allList.put("state", state);
      }
      
     //판매자의 계좌번호 가져오기
      Account acc = MemberDao.selectAccountInfo(sqlSession, (int) account.getAccount());
      if(acc != null) {
    	  allList.put("acc", acc);
      }

      
      return allList; 
      
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

   // 차단 풀기
   public int deleteBlock(String sellUserNo, String chatRoomNo, String purchaseUserNo, int userNo, Block block, String blockedUserNo) {
	   
	   block.setBlockerNo(userNo);
	   
	   if(blockedUserNo == null) {
		   // 로그인한 유저가 구매자인 경우
		   if(userNo == Integer.parseInt(purchaseUserNo)) {
			   block.setBlockedNo(Integer.parseInt(sellUserNo));
			   
		   } else if ( userNo == Integer.parseInt(sellUserNo) ) {	// 로그인한 유저가 판매자인경우
			   block.setBlockedNo(Integer.parseInt(purchaseUserNo));  
		   }
	   } else {
		   block.setBlockedNo(Integer.parseInt(blockedUserNo));
	   }
	   

	   
	   int result = chatDao.deleteBlock(sqlSession, block);
	   
	   
	   return result;
   }
   
   
   //채팅 첨부파일 보내기
   public int insertchatImage(ChatFiles chatfiles) {
	   
	   return chatDao.insertchatImage(sqlSession, chatfiles);
   }
   
	// 스케줄링 실행할 채팅창 첨부파일 가져오기
   public ArrayList<ChatFiles> selectAttachment(){
	   
	   ArrayList<ChatFiles> list= chatDao.selectAttachment(sqlSession);
	   
	   return list;
	   
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}