package com.kh.tresure.mypage.model.service;

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

}
