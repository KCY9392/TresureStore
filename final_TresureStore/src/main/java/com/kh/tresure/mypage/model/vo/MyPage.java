package com.kh.tresure.mypage.model.vo;

import java.sql.Date;

import com.kh.tresure.sell.model.vo.Sell;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MyPage {
	
	private int sellNo;	
	private int reportNo;
	private int fwId;
	private int userNo;	
	private Date createDate;
	private String status;
	
	private int sellCount;

}
