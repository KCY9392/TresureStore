package com.kh.tresure.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Account {

	private int accountId; //계좌 고유 식별번호
	private int userNo; //유저번호
	private int account; //계좌번호

	
	
}
