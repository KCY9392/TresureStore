package com.kh.tresure.chat.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.tresure.HomeController;
import com.kh.tresure.chat.model.service.ChatService;
import com.kh.tresure.chat.model.vo.Block;
import com.kh.tresure.chat.model.vo.ChatFiles;
import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.chat.model.vo.ChatRoomJoin;
import com.kh.tresure.common.Image;
import com.kh.tresure.member.model.vo.Account;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.sell.model.vo.Sell;

@Controller
@SessionAttributes({ "chatRoomNo", "loginUser" })
public class ChatController {

	private HttpSession session;
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	private ChatService chatService;

	// 기본생성자
	public ChatController() {}

	@Autowired
	public ChatController(ChatService chatService) {
		this.chatService = chatService;
	}

	/**
	 * 채팅방 리스트 가져오는 기능 - 리팩토링 완료
	 * @param model
	 * @param request
	 * @param paramMap
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(value = "chat/chatRoomList", method = RequestMethod.GET)
	public String selectChatRoomList(Model model, 
									 HttpServletRequest request, HashMap<Object, Object> paramMap,
									 @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
	      session = request.getSession();
	      
	      
	      if(session.getAttribute("loginUser")== null) {
	    	  
	         session.setAttribute("errorMsg", "로그인 후 이용 가능합니다.");
	         
	         return HomeController.HOME;

	      } else {
	    	  int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
	    	  
	    	  HashMap<Object, Object> map = chatService.selectChatRoomList(userNo, paramMap, currentPage);

	          model.addAttribute("map", map);
	          
	          logger.info(">> 채팅방 리스트로 이동");


			return "chat/chatRoomList";
		}

	}
	
	 /**
     * 방 생성하기, 방입장하기 - 리팩토링 중
     * @param sellNo
     * @param userNo
     * @param sellUserNo
     * @param chatRoomNo
     * @param room
     * @param roomJoin
     * @param account
     * @param model
     * @param block
     * @param session
     * @return
     */
 @RequestMapping(value = "chat/chatRoom/{sellNo}/{userNo}", method = RequestMethod.GET)
 public String createAndEnterChatRoom(@PathVariable String sellNo,
                            @PathVariable String userNo,
                               @RequestParam(value="sellUserNo", required=false) String sellUserNo,
                               @RequestParam(value="chatRoomNo", required=false) String chatRoomNo,
                               ChatRoom room,
                               ChatRoomJoin roomJoin,
                               Account account,
                               Model model,
                               Block block,
                               HttpSession session,
                               HashMap<Object,Object> AllList) {

    room.setSellNo(Integer.parseInt(sellNo));
    room.setUserNo(Integer.parseInt(userNo));
    
     logger.info("chatRoomNo : "+chatRoomNo);
    
      // 채팅방이 있으면 채팅방 객체에 채팅방 번호 넣어주겠다.
       if(chatRoomNo != null) {
          room.setChatRoomNo(Integer.parseInt(chatRoomNo));
       }


       
       AllList =  chatService.createAndEnterChatRoom(AllList, room, sellUserNo, roomJoin, block, account);
       
       // @SessionAttributes 쓰기위한 작업
       model.addAttribute("chatRoomNo", AllList.get("chatRoomNo") );
       
       if(AllList.size() > 0) {
    	  String reviewIs = chatService.reviewIs(Integer.valueOf(sellNo));
    	  model.addAttribute("reviewIs",reviewIs);
          model.addAttribute("AllList", AllList);
          logger.info(">> 채팅방으로 이동");
          
          logger.info(""+AllList.get("chatRoomNo"));
          
          return "chat/chatRoom";
          
       } else {
          
       session.setAttribute("alertMsg", "채팅방 입장에 실패하였습니다.");
       return HomeController.HOME;
    }
 }


	// 채팅방 차단목록 이동
	@RequestMapping(value = "chat/chatBlockList", method = RequestMethod.POST)
	public String selectBlockList(Model model, HttpSession session) {

		int userNo = ((Member) session.getAttribute("loginUser")).getUserNo();

		List<Block> blockList = chatService.selectBlockList(userNo);
		model.addAttribute("blockList", blockList);

		return "chat/chatBlockList";
	}

	// 차단 리스트에 추가, 차단하기
	@RequestMapping(value = "chat/chatBlockAdd", method = RequestMethod.POST)
	@ResponseBody
	public String addBlock(@RequestParam(value = "sellUserNo", required = false) int sellUserNo,
			@RequestParam(value = "chatRoomNo", required = false) int chatRoomNo,
			@RequestParam(value = "purchaseUserNo", required = false) int purchaseUserNo, Model model,
			HttpSession session, Block block) {

		// 로그인 한유저
		int userNo = ((Member) session.getAttribute("loginUser")).getUserNo();

		int result = chatService.addBlock(sellUserNo, chatRoomNo, purchaseUserNo, userNo, block);

		return String.valueOf(result);

	}

	// 차단 풀기
	@RequestMapping(value = "chat/chatBlockremove", method = RequestMethod.POST)
	@ResponseBody
	public String deleteBlock(@RequestParam(value = "sellUserNo", required = false) String sellUserNo,
			@RequestParam(value = "chatRoomNo", required = false) String chatRoomNo,
			@RequestParam(value = "purchaseUserNo", required = false) String purchaseUserNo,
			@RequestParam(value = "blockedUserNo", required = false) String blockedUserNo, Model model,
			HttpSession session, Block block) {

		logger.info(purchaseUserNo + "");
		logger.info(blockedUserNo + "");
		logger.info(sellUserNo + "");

		// 로그인 한유저
		int userNo = ((Member) session.getAttribute("loginUser")).getUserNo();

		int result = chatService.deleteBlock(sellUserNo, chatRoomNo, purchaseUserNo, userNo, block, blockedUserNo);
		if (result == 1) {
			return String.valueOf(result);
		} else {
			return "0";
		}

	}

	// 채팅방 나가기
	@RequestMapping(value = "chat/chatRoom/exit", method = RequestMethod.POST)
	@ResponseBody
	public int exitChatRoom(@RequestParam String userNo, @RequestParam String chatRoomNo, ChatRoomJoin join) {

		int result = chatService.exitChatRoom(join, chatRoomNo, userNo);

		return result;
	}

	// 네고 가격결정
	@RequestMapping(value = "join/nego", method = RequestMethod.POST)
	@ResponseBody
	public int insertNegoPrice(@RequestParam int negoPrice, @RequestParam int sellNo, @RequestParam int chatRoomNo,
			Sell nego) {

		int result = chatService.insertNegoPrice(negoPrice, sellNo, chatRoomNo, nego);

		return result;

	}

	// 채팅첨부파일
	@ResponseBody
	@RequestMapping(value = "chat/chatFile/insert", method = RequestMethod.GET)
	public Map<String, String> insertFile(MultipartFile uploadfile, @RequestParam(value = "chatRoomNo") int chatRoomNo,
			ChatFiles chatfiles, HttpSession session) {

		List<ChatFiles> chatFilesList = new ArrayList<>();

		int result = 0;

		if (!uploadfile.isEmpty()) {

			String webPath = "/resources/images/chat/";
			String serverFolderPath = session.getServletContext().getRealPath(webPath);

			File file = null;

			// 폴더 생성
			if (!uploadfile.getOriginalFilename().equals("")) {
				String savePath = session.getServletContext().getRealPath("/resources/images/chat/");

				file = new File(savePath);
				if (!file.exists()) {
					file.mkdirs();
				}

				String changeName = Image.saveFile(uploadfile, savePath);

				System.out.println("chat savePath ." + savePath);
				System.out.println("chat ChangeName 2." + changeName);

				chatfiles.setChatRoomNo(chatRoomNo);
				chatfiles.setOriginName(uploadfile.getOriginalFilename());
				chatfiles.setChangeName(changeName);
				chatfiles.setFilePath(savePath);
				chatfiles.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
			}

			result = chatService.insertchatImage(chatfiles);

		}

		Map<String, String> map = new HashMap<>();

		if (result > 0) {

			map.put("originName", chatfiles.getOriginName());
			map.put("changeName", chatfiles.getChangeName());

		}

		return map;
	}
}