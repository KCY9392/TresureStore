package com.kh.tresure.purchase.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tresure.purchase.model.service.PurchaseService;
import com.kh.tresure.purchase.model.vo.Purchase;

@Controller
public class PurchaseController {
	
	private Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	   private PurchaseService purchaseService;
	   
	   // 기본생성자
	   public PurchaseController() {
	      
	   }
	   
	   @Autowired
	   public PurchaseController( PurchaseService purchaseService){
	      this.purchaseService = purchaseService;
	   }

	   
	   // 상품 구매 
	   @ResponseBody
	   @RequestMapping(value = "purchase/complete", method = RequestMethod.POST)
	   public int purchaseComplete(
				   Model model,
				   HttpSession session,
				   Purchase purchase,
				   String merchant_uid, int amount, String name, int buyer_name, int sellNo) {
		   
		   	   purchase.setSellNo(sellNo);
			   purchase.setUserNo(buyer_name);
			   purchase.setOrderNo(merchant_uid);
			   purchase.setPrice(amount);
			   purchase.setSellTitle(name);
			   
			   int result = purchaseService.purchaseComplete(purchase);
				
			   logger.info(" 구매내역 >>"+ purchase);
			   logger.info(" >> 구매내역 리스트에 추가 완료");
			   
			   return result;
	   }
	   
	   
	   
	
}
