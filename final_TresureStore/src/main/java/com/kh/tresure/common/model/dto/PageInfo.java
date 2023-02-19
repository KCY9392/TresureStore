package com.kh.tresure.common.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageInfo {

	private int listCount;	// 총 게시글 개수
	private int currentPage;	// 현재 페이지(즉, 요청한 페이지)
	private int pageLimit;		// 하단에 보여질 페이징바의 페이지 목록 최대 갯수
	private int viewLimit;		// 해당 페이지에 보여질 게시글 최대 갯수
	
	private int maxPage;		// 가장 마지막 페이지의 숫자
	private int startPage;		// 해당 페이지에 보여질 페이징 바의 시작수
	private int endPage;		// 해당 페이지에 보여질 페이징 바의 끝수
}