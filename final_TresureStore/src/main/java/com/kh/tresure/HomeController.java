package com.kh.tresure;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tresure.sell.model.service.SellService;
import com.kh.tresure.sell.model.vo.Sell;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private SellService sellService;
	
	public HomeController() {}
	
	@Autowired
	public HomeController(SellService sellService) {
		this.sellService = sellService;
	}

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		List<Sell> sList = sellService.sellListselect();
		logger.info("sList ? "+sList);
		
		model.addAttribute("sellList", sList);
		
		return "home";
	}
	
}
