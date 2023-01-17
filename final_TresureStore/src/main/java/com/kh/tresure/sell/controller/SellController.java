package com.kh.tresure.sell.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.tresure.sell.model.service.SellService;

@Controller
public class SellController {
		
	private Logger logger = LoggerFactory.getLogger(SellController.class);
	private	SellService sellService;
	
	// 기본생성자
	public SellController() {
		
	}
	
	@Autowired
	public SellController( SellService sellService){
		this.sellService = sellService;
	}
	
}
