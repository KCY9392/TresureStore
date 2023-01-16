package com.kh.tresure.sell.model.vo;

import java.sql.Date;

import com.kh.tresure.chat.model.vo.ChatRoomJoin;
import com.kh.tresure.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Sell {

	private int sellNo;	
	private int userNo;	
	private int categoryNo;
	private String sellTitle;		
	private String sellContent;
	private int count;
	private int price;
	private String sellStatus;
	private Date createDate;
	private Date updateDate;
	private String status;
	
}
