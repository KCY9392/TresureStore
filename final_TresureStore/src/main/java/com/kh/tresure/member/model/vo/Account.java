package com.kh.tresure.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Account {

	private int accountId; //계좌 고유 식별번호
	private int userNo; //유저번호
	private String account; //계좌번호
	
	private String bank; //은행이름
	
}
