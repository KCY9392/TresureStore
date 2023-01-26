package com.kh.tresure.review.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.tresure.sell.model.vo.Sell;
import com.kh.tresure.sell.model.vo.SellImg;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
	
	private int revNo;
	private int sellNo;
	private int userNo;
	private String revContent;
	private int revScore;
	private Date createDate;
	private String status;
	
	private double ravg;

}
