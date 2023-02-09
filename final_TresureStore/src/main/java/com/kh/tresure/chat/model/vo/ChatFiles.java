package com.kh.tresure.chat.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatFiles {
	
	private int cfileNo;
	private int chatRoomNo;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private String filePath;
	private String status;
	private int userNo;
	
}
