package com.kh.tresure.heart.model.vo;





import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Heart {
	
	private int userNo;
	private int sellNo;
	private Date createDate;
	private int heartNo;
	
	//찜한 상품 제목, 가격, 사진
	private String sellTitle;
	private int price;
	private String imgSrc;
	
	
	private int sysHeartNum;
	
	private String crawl;
	
	
	
	
	

}
