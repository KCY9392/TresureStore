package com.kh.tresure.chat.model.vo;

import java.sql.Timestamp;
import java.util.Date;

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
	private Timestamp createDate;
	private String readStatus;
	
}
