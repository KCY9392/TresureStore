package com.kh.tresure.heart.model.service;

import java.util.HashMap;
import java.util.Map;

import com.kh.tresure.heart.model.vo.Heart;

public interface HeartService {
	
	public void deleteHeart(Heart heart);
	
	public void addHeart(Heart heart);
	
	public void mypageDeleteHeart(HashMap<String, Object> map);
	
	

}
