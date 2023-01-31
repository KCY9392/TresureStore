package com.kh.tresure.chat.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.tresure.chat.model.service.ChatService;
import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;
import com.kh.tresure.member.model.vo.Member;

@Controller
@SessionAttributes({"chatRoomNo", "loginUser"})
public class ChatController {
   private HttpSession session;
   private Logger logger = LoggerFactory.getLogger(ChatController.class);
   private ChatService chatService;
   
   // 기본생성자
   public ChatController() {
      
   }
   
   @Autowired
   public ChatController( ChatService chatService){
      this.chatService = chatService;
   }
   
   
   //채팅방 목록 조회
   @RequestMapping(value = "chat/chatRoomList", method = RequestMethod.GET)
   public String selectChatRoomList( Model model, HttpServletRequest request) {
      
      session = request.getSession();
      if(session.getAttribute("loginUser")== null) {
         
         session.setAttribute("alertMsg", "로그인 후 이용 가능합니다.");
         
         return "redirect:/";
      }else {
         int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
         
         logger.info("유저 정보 "+userNo+"번");
         
         List<ChatRoom> crList = chatService.selectChatRoomList(userNo);
         
         model.addAttribute("chatRoomList", crList);
         
         logger.info(crList+ ">> 채팅방 리스트 조회");
         
         logger.info(">> 채팅방 리스트로 이동");
         
         return "chat/chatRoomList";
      }
      
   }
   
   
   // 채팅하기 (방생성 > 입장하기 or 입장하기)
   @RequestMapping(value="chat/chatRoom/{sellNo}/{userNo}", method = RequestMethod.POST)
   public String createAndEnterChatRoom(@PathVariable String sellNo,
                         @PathVariable String userNo,
                         @RequestParam(value="sellUserNo", required=false) String sellUserNo,
                         @RequestParam(value="chatRoomNo", required=false) String chatRoomNo,
                         ChatRoom room,
                         ChatRoomJoin roomJoin,
                         Model model) {
      
      room.setSellNo(Integer.parseInt(sellNo));
      room.setUserNo(Integer.parseInt(userNo));
      if(chatRoomNo != null) {
         room.setChatRoomNo(Integer.parseInt(chatRoomNo));
      }
      
      logger.info(">> 채팅방으로 이동");
      
      
      HashMap<Object,Object> AllList = new HashMap<>();
      AllList =  chatService.createAndEnterChatRoom(room, sellUserNo, roomJoin);
      model.addAttribute("chatRoomNo", room.getChatRoomNo() );
      
      if(AllList.size() > 0) {
         
         model.addAttribute("AllList", AllList);
         
         return "chat/chatRoom";
         
      } else {
         
         session.setAttribute("alertMsg", "채팅방 입장에 실패하였습니다.");
         return "redirect:/";
      }
   }

   
   
   //채팅방 차단목록 이동
   @RequestMapping(value = "chat/chatBlockList",  method = RequestMethod.POST)
   public String selectBlockList(Model model, HttpSession session) {
   
      int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
      
      List<Block> blockList = chatService.selectBlockList(userNo);
      model.addAttribute("blockList", blockList);
      
      logger.info(blockList+ ">> 차단 리스트 조회");
      logger.info(">> 차단 리스트로 이동");
      
      return "chat/chatBlockList";
   }
   
   
   
   //차단 리스트에 추가
   @RequestMapping(value="chat/chatBlockAdd", method = RequestMethod.POST)
   public String addBlock(@RequestParam(value="sellUserNo", required=false) int sellUserNo,
                     	  @RequestParam(value="chatRoomNo", required=false) int chatRoomNo,
                     	  Model model,
                     	  HttpSession session) {
	   
	   // 로그인 한유저
	   int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
	   
	   
	   
	   
	   
      
	  
	   
      return "redirect:chatBlockList";
      
    }

   
   
   
   //채팅방 나가기
   @RequestMapping(value = "chat/chatRoom/exit", method = RequestMethod.POST)
@ResponseBody
	public int exitChatRoom(@RequestParam String userNo,
							@RequestParam String chatRoomNo,
							ChatRoomJoin join) {
		
		int result = chatService.exitChatRoom(join, chatRoomNo, userNo);
		
		return result;
   }

   
   // 네고 가격결정
   @RequestMapping(value="join/nego", method = RequestMethod.POST)
   @ResponseBody
   public int insertNegoPrice(@RequestParam int negoPrice,
                        @RequestParam int sellNo,
                        @RequestParam int chatRoomNo
                                 ) {
      
      int result = chatService.insertNegoPrice(negoPrice, sellNo, chatRoomNo);
      
      return result;
      
   }
   

}