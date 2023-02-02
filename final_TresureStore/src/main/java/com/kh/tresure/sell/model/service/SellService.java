package com.kh.tresure.sell.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.tresure.review.model.vo.Review;
import com.kh.tresure.sell.model.vo.Sell;
import com.kh.tresure.sell.model.vo.SellImg;

public interface SellService {
	
	/**
	 * 상품목록 조회 */
	public List<Sell> sellListselect();
	
	/**
	 * 상품 검색 */
	public List<Sell> sellListsearch(String keyword);
	
	/**
	 * 최근 거래성공 5개 상품가격
	 */
	public List<Sell> successfive(String search);
	
	/**
	 * 상품등록 */
	public int insertSell(Sell s, List<MultipartFile> list, String webPath, String serverFolderPath);

	/**
	 * 상품 상세조회 */
	public Sell selectSellDetail(Map<String, Integer> map);
	
	/**
	 * 상품 이미지 조회
	 */
	public List<SellImg> selectSellImgList(Map<String, Integer> map);

	/**
	 * 상품 조회수 */
	public int increaseCount(int sellNo);

	/**
	 * 최신순, 인기순, 저가순, 고가순 정렬 */
	public List<Sell> howOrderList(HashMap<String, Object> map);

	// 판매 리스트
	public List<Sell> sellList(int userNo);

	// 리뷰 리스트
	public List<Review> reviewList(int userNo);
  
	
	public Map<String, Object> sellerDetail(Map<String, Integer> map);

}
