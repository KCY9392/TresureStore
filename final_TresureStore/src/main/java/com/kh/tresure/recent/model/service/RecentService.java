package com.kh.tresure.recent.model.service;

import java.util.List;

import com.kh.tresure.recent.model.vo.Recent;

public interface RecentService {

	public int updateProduct(Recent recent);
	
	public List <Recent> viewProduct(Recent recent); 
	
	public int deleteProducts(Recent recent);
	
	public int deleteProduct(Recent recent);
	
	
}
