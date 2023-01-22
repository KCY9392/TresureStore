package com.kh.tresure.sell.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.tresure.sell.model.vo.Sell;

public interface SellService {
	
	/**
	 * 상품목록 조회 */
	public List<Sell> sellListselect();
	
	/**
	 * 상품등록 */
	public int insertSell(Sell s, List<MultipartFile> list, String webPath, String serverFolderPath);

	/**
	 * 상품 상세조회 */
	public Sell selectSellDetail(HashMap<String, Integer> map);

	/**
	 * 상품 조회수 */
	public int increaseCount(int sellNo);

	/**
	 * 카테고리별 상품목록 */
	public List<Sell> GocategoryList(int categoryCode);

}
