package com.kh.tresure.mypage.model.service;


import java.util.List;

import com.kh.tresure.heart.model.vo.Heart;
import com.kh.tresure.review.model.vo.Review;
import com.kh.tresure.sell.model.vo.Sell;

public interface MyPageService{
	
	/**
	 * 상품판매수 조회
	 * @return
	 */
	public int sellCount(int userNo);
	
	/**
	 팔로워 수 조회
	 */
	public int followCount(int userNo);
	
	/**
	 * 신고 수 조회 */
	public int reportCount(int userNo);

	
	/**
	 * 상점 오픈일 */
	public int marketOpen(int userNo);
	
	public int reviewAvg(int userNo);
	
	
	/**
	 * 마이페이지 상품 목록 */
	public List<Sell> mypageSellList(int userNo);
	
	/**
	 * 마이페이지 찜 상품 목록 */
	public List<Heart> mypageHeartList(int userNo);
	
	
	/**
	 * 마이페이지 상점후기 목록 */
	public List<Review> mypageReviewList(int userNo);
	
  /**
   * 판매내역 상태변경
   */
	public int changeStatus(int sellNo);
	
	public List<Sell> mypagetSellList(int userNo);

	
	/**
	 * 마이페이지 구매목록 */
	public List<Sell> mypagePurchaseList(int userNo);
	
	public int heartCount(int userNo);


}
