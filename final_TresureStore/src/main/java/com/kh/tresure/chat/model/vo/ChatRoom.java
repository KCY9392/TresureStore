package com.kh.tresure.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatRoom {

	private int chatRoomNo;
	private int userNo;
	private int sellNo;
	private String status;
	

}
