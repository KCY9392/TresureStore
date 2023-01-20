package com.kh.tresure.sell.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.tresure.sell.model.vo.Sell;

public interface SellService {
	
	/**
	 * 상품목록 조회 */
	public List<Sell> sellListselect();
	
	public int insertSell(Sell s, List<MultipartFile> list, String webPath, String serverFolderPath);


}
