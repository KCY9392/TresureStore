package com.kh.tresure.review.model.service;

import java.util.List;

import com.kh.tresure.review.model.vo.Review;

public interface ReviewService {
	
	/**
	 * 상점 후기 작성 */
	public int reviewInsertUpdate(int score, String reviewContent, int sellNo, int userNo, String reviewIs);

	
	/**
	 * 상점 후기 상세 */
	public Review reviewDetail(int userNo, int sellNo);


	/**
	 * 상점 후기 삭제 */
	public int reviewDelete(int userNo, int sellNo);

}
