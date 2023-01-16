package com.kh.tresure.chat.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatMessage {

	private int chatNo;
	private int chatRoomNo;
	private int userNo;
	private String chatContent;
	private Date createDate;
	private String readStatus;
	
}
