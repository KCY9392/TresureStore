package com.kh.tresure.heart.model.vo;

import java.util.Date;

import com.kh.tresure.member.model.vo.Member;

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
	
	
	

}
