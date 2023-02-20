package com.kh.tresure.sell.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.tresure.common.Image;
import com.kh.tresure.heart.model.vo.Heart;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.mypage.model.service.MyPageService;
import com.kh.tresure.sell.model.service.SellService;
import com.kh.tresure.sell.model.vo.Category;
import com.kh.tresure.sell.model.vo.Sell;
import com.kh.tresure.sell.model.vo.SellImg;

import oracle.net.aso.s;


@Controller
@RequestMapping("/sell")
public class SellController {


   private Logger logger = LoggerFactory.getLogger(SellController.class);
   private SellService sellService;
   private MyPageService mypageService;

   // 기본생성자
   public SellController() {

   }

   @Autowired
   public SellController(SellService sellService, MyPageService mypageService) {
      this.sellService = sellService;
      this.mypageService = mypageService;
   }

   
   /**
    * 더보기 (메인페이지) */
   @ResponseBody
   @RequestMapping(value="/theBogi")
   public List<Sell> theBogi(HttpServletResponse response, @RequestParam("eleCount") int lastSellNo){
      
      logger.info("lastSellNo : "+lastSellNo);
      
      List<Sell> sList = sellService.sellListTheBogi(lastSellNo);
      for(int i=0; i<sList.size(); i++) {
         sList.get(i).setTimeago(sList.get(i).getCreateDate());
      }
      
      logger.info("TheBogi List : "+sList);
      
      return sList;
   }
   
   /**
    * 검색 시 -> 상품이면 시세조회하면서 해당 상품리스트, 상점이면 해당 상점페이지 */
   @RequestMapping(value="/search", method=RequestMethod.POST)
   public ModelAndView searchList(
            ModelAndView mv, 
            HttpSession session,
            String search) {
      
      //상품 검색할 경우
      if(search.charAt(0) != '@') {
      
         List<Sell> sList = sellService.sellListsearch(search);
         List<Sell> success = sellService.successfive(search);
         
         for(int i=0; i<sList.size(); i++) {
            sList.get(i).setTimeago(sList.get(i).getCreateDate());
         }
         
         int price = 0;
         for(int i=0; i<success.size(); i++) {
            price += success.get(i).getPrice();
         }
         price /= 5;
         
         HashMap<String, Object> map = new HashMap<>();
         map.put("s", sList);
         map.put("keyword", search);
         map.put("success", success);
         map.put("price", price);
         
         mv.addObject("m", map);
         mv.setViewName("sell/searchList");
         
      }else { //상점 검색할 경우
    	  int searchSeller = Integer.valueOf((search.substring(1)));
    	  Member member = (Member) session.getAttribute("loginUser");

			if(member != null) {
				Map<String, Integer> map = new HashMap<>();
				map.put("userNo", member.getUserNo());
				map.put("sellerNo", searchSeller);
				mv.addObject("member", sellService.sellerDetail(map));
			}else {
				mv.addObject("member", sellService.searchsellerDetail(searchSeller));
			}
			
			mv.setViewName("sell/sellerPage");
			mv.addObject("sellerUserno",searchSeller);
			// 판매 리스트
			mv.addObject("sellList", sellService.sellList(searchSeller));
			// 리뷰 리스트
			mv.addObject("reviewList", sellService.reviewList(searchSeller));
			
			int reviewAvg = mypageService.reviewAvg(searchSeller);
			mv.addObject("reviewAvg",reviewAvg);
			
			
		  //mv.setViewName("다른사람이 보는 내상점");
			mv.setViewName("sell/searchSellerPage");
		}
		

		return mv;
	}
   
   
   
   /**
    * 상품 상세조회 */
   @RequestMapping(value="/sellDetail/{sellNo}", method= RequestMethod.GET)
   public ModelAndView sellDetail (
         ModelAndView mv, HttpSession session,
         @PathVariable("sellNo") int sellNo,
         HttpServletRequest req,
         HttpServletResponse res) throws Exception{
   
         Member loginUser = (Member)session.getAttribute("loginUser");
         logger.info("loginUser:"+loginUser);
         int userNo = 0;
         
         Map<String, Integer> map = new HashMap<>();
         map.put("sellNo", sellNo);
         
         if(loginUser!=null) {
            userNo = loginUser.getUserNo();
            map.put("userNo", userNo);
         }
         
         Sell s = sellService.selectSellDetail(map);
         List<SellImg> imgList = sellService.selectSellImgList(map);
         
         s.setImgList(imgList);
         s.setTimeago(s.getCreateDate());
         
          
          if (s != null) {
              logger.info("System - 해당 상세페이지로 넘어감");
              
              Cookie[] cookies = req.getCookies();
              Cookie viewCookie = null;  // 비교하기 위해 새로운 쿠키
              
              if (cookies != null && cookies.length > 0) { // 쿠키가 있을 경우
                 for (int i = 0; i < cookies.length; i++) {
                    // Cookie의 name이 cookie + sellNo와 일치하는 쿠키를 viewCookie에 넣어줌 
                    if (cookies[i].getName().equals("cookie"+sellNo)){ 
                       viewCookie = cookies[i];
                    }
                 }
              }


              if(loginUser != null) {
                 
                 // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
               if (viewCookie == null /* && s.getUserNo() != userNo */) {
                     
                     // 쿠키 생성(이름, 값)
                     Cookie newCookie = new Cookie("cookie"+sellNo, "|" + sellNo + "|");
                     // 쿠키 추가
                     res.addCookie(newCookie);
                     // 쿠키를 추가 시키고 조회수 증가시킴
                     int result = sellService.increaseCount(sellNo);
                     
                     if(result>0) {
                         logger.info("조회수 증가");
                         s = sellService.selectSellDetail(map);
                         s.setImgList(imgList);
                      s.setTimeago(s.getCreateDate());
                         
                     }else {
                        logger.info("조회수 증가 에러");
                     }
                 }
            
               // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
                 else {
                     // 쿠키 값 받아옴.
                     String value = viewCookie.getValue();
                     logger.info("cookie 값 : " + value);
                 }
              }
              mv.addObject("s", s);
              mv.setViewName("sell/sellDetailForm");
              
          } //상세정보 없음 -> 에러페이지 이동
          
       return mv;
   }
   
   
   /**
    * 카테고리 선택별 상품목록 조회 */
   @RequestMapping(value="/category/{categoryCode}", method=RequestMethod.GET)
      public ModelAndView Gocategory (
            ModelAndView mv,
            @PathVariable("categoryCode") int categoryCode){
      
      HashMap<String, Object> map = new HashMap<>();
      map.put("categoryCode", categoryCode);
      
      List<Sell> s = sellService.howOrderList(map);
      
      for(int i=0; i<s.size(); i++) {
         s.get(i).setTimeago(s.get(i).getCreateDate());
      }
      
      mv.addObject("s", s);
      mv.addObject("categoryCode",categoryCode);
      mv.setViewName("sell/Gocategory");
      
      return mv;
   }
   
   
   /**
    * 최신순, 인기순, 저가순, 고가순 정렬 */
   @RequestMapping(value="/category/{categoryCode}/{how}", method=RequestMethod.GET)
   public ModelAndView OrderHow (ModelAndView mv,
                          @PathVariable("categoryCode") int categoryCode,
                          @PathVariable("how") String howOrder) {
      
      HashMap<String, Object> map = new HashMap<>();
      map.put("howOrder", howOrder);
      map.put("categoryCode", categoryCode);
      
      List<Sell> s = sellService.howOrderList(map);
      
      for(int i=0; i<s.size(); i++) {
         s.get(i).setTimeago(s.get(i).getCreateDate());
      }
      
      mv.addObject("s", s);
      mv.addObject("map",map);
      mv.setViewName("sell/Gocategory");
      
      return mv;
   }
   
   
   
   // 상품등록페이지
   @RequestMapping(value = "/sellInsertForm", method = RequestMethod.GET)
   public String sellInsertForm(HttpServletRequest request) {
      
      HttpSession session = request.getSession();
      
      
      Member loginUser = (Member)session.getAttribute("loginUser");   
      if(loginUser==null) {
         session.setAttribute("errorMsg", "로그인 후 이용가능");
         return "redirect:/";
      }else {
         return "sell/sellInsertForm";
      }
   }

   
   @RequestMapping(value = "/sellInsert", method = RequestMethod.POST)
   public String insertSell(Sell s, Model model, HttpSession session,
         @RequestParam(value = "mode", required = false, defaultValue = "insert") String mode,
         @RequestParam(value = "upfile", required = false) List<MultipartFile> imgList, // 업로드용 이미지파일
         MultipartFile upfile // 첨부파일) {
   ) {

      String webPath = "/resources/images/sell/";
       String serverFolderPath = session.getServletContext().getRealPath(webPath);

      int result = 0;
      File file = null;

      // 폴더 생성
      if (!upfile.getOriginalFilename().equals("")) {
         String savePath = session.getServletContext().getRealPath("/resources/images/sell/");

         file = new File(savePath);
         if (!file.exists()) {
            file.mkdirs();
         }

         String changeName = Image.saveFile(upfile, savePath);

         System.out.println("s1." + savePath);
         System.out.println("s2." + changeName);

      }

      if (mode.equals("insert")) {
         // db에 board테이블에 데이터 추가

         try {
            Member loginUser = (Member)session.getAttribute("loginUser");
            int userNo = loginUser.getUserNo();
            s.setUserNo(userNo);
            
            result = sellService.insertSell(s, imgList, webPath, serverFolderPath);
         } catch (Exception e) {
            logger.error("에러발생");
            e.printStackTrace();
         }
      }

//      if(mode.equals("insert")) {
//         // db에 sell테이블에 데이터 추가
//
//
//      }
//         else { // 수정
//
//         // 게시글 수정 서비스 호출
//         // b객체 안에 boardNo
//         try {
//            result = sellService.updateSell(s);
//         } catch (Exception e) {
//            logger.error("에러발생");
//         }
//      }sell/sellInsert

      if (result > 0) {
         session.setAttribute("alertMsg", "상품등록에 성공하셨습니다.");
         return "redirect:/";
      } else { // errorPage
         model.addAttribute("errorMsg", "상품등록에 실패하였습니다.");
         return "common/errorPage";
      }

   }
   

   // 상세페이지에서 판매자 이미지 클릭 시 판매자 상점으로 이동
   @RequestMapping(value = "/seller/{userNo}")
   public String sellerPage(@PathVariable("userNo") int userNo, Model model, Sell sell, HttpSession session) {
      Member member = (Member) session.getAttribute("loginUser");
      
      Map <String, Integer> map = new HashMap<>();
      
      // 로그인 했을 때
      if(member != null) {
    	  map.put("userNo", member.getUserNo());
      }
      
      int reviewAvg = mypageService.reviewAvg(userNo);
	  model.addAttribute("reviewAvg",reviewAvg);
		
      map.put("sellerNo", userNo);
      model.addAttribute("member", sellService.sellerDetail(map));
      // 판매 리스트
      model.addAttribute("sellList", sellService.sellList(userNo));
      // 리뷰 리스트
      model.addAttribute("reviewList", sellService.reviewList(userNo));
      
      return "sell/sellerPage";
   }
   
   // 업데이트 폼으로 이동
   @RequestMapping(value = "/sellUpdateForm/{sellNo}" ,method = RequestMethod.GET)
   public ModelAndView  sellUpdateForm(@PathVariable("sellNo") int sellNo, ModelAndView mv) {
      
      Map<String, Integer> map = new HashMap<>();
      map.put("sellNo", sellNo);
      Sell s = sellService.selectSellDetail(map);
      List<SellImg> imgList = sellService.selectSellUpImgList(map);
      List<Category> cateList = sellService.cateList();
      
      s.setImgList(imgList);
      
      mv.addObject("s", s);
      mv.addObject("cateList", cateList);
      mv.setViewName("sell/sellUpdateForm");
      
      return mv;
   }
   
   @RequestMapping(value = "/sellUpdate", method = RequestMethod.POST)
   public String sellUpdate(Sell s, Model model, HttpSession session, HttpServletRequest request,
         @RequestParam(value = "mode", required = false, defaultValue = "update") String mode,
         @RequestParam(value = "upfile", required = false) List<MultipartFile> sellImgList) // 첨부파일) {
   {

      int result = 0;
      try {
         
         // 실제저장 경로
         String webPath = "/resources/images/sell/";
         // 실제로 저장되는 ContextPath
         String serverFolderPath = session.getServletContext().getRealPath(webPath);
   
         //int result = 0;
         // 파일 객체
         File file = null;
   
         // SellService 넘겨줄 SellImg 타입 리스트
         List<SellImg> imgList = new ArrayList<>();

         // 파일 객체가 실제로 넘어왔으면
         if (sellImgList != null) {
            String savePath = session.getServletContext().getRealPath(webPath);
   
            // file 객체에 해당 폴더를 가지고 생성
            file = new File(savePath);
            // 만약 폴더가 없으면?
            if (!file.exists()) {
               // 폴더 생성.
               file.mkdirs();
            }
            
            // 일단 실제 업로드 된 파일 객체를 MultipartFile upfile에 담아서 반복한다.
            for (MultipartFile upfile : sellImgList) {
               // 파일을 저장한 후에 저장된 파일명을 String chagneName으로 돌려받는다.
               String changeName = Image.saveFile(upfile, savePath);
               SellImg img = new SellImg();
               img.setSellNo(s.getSellNo());
               img.setFilePath(webPath);
               img.setOriginName(upfile.getOriginalFilename());
               img.setChangeName(changeName);
               // fileType은 무조건 "D"로 세팅한다. 대표이미지는 SellService에서 처리한다.
               img.setFileType("D");
               imgList.add(img);
               System.out.println("s1." + savePath);
               System.out.println("s2." + changeName);
            }
         }

      if (mode.equals("update")) {
         try {
            result = sellService.updateSell(s, imgList, serverFolderPath);
         } catch (Exception e) {
            logger.error("에러발생");
            e.printStackTrace();
         }
      }

      } catch (Exception e) {
         e.printStackTrace();
      }
      System.out.println(s);

      if (result > 0) {
         session.setAttribute("alertMsg", "상품수정에 성공하셨습니다.");
         return "redirect:/";
      } else { // errorPage
         model.addAttribute("errorMsg", "상품수정에 실패하였습니다.");
         return "common/errorPage";
      }

   }
   
   //게시글 삭제
   @ResponseBody
   @RequestMapping(value="/deleteSell",method = RequestMethod.POST)
   public int deleteHeart(HttpSession session,
           @RequestParam(value = "sellNo") int sellNo) {
      int result = 0;
      Sell s = new Sell();
      s.setSellNo(sellNo);
      if(result==0) {
      sellService.sellDelete(s);
      
         result = 1;
         
      }
      
      
      
      return result;
         
   }
}
   