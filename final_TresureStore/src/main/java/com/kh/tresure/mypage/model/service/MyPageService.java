package com.kh.tresure.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

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
	 * 신고 수 조회
	 */
	public int reportCount(int userNo);

	
	/**
	 * 상점 오픈일
	 */
	
	public int marketOpen(int userNo);
	
	/**
	 * 마이페이지 상품 목록
	 */
	
	public List<Sell> mypageSellList(int userNo);

}
