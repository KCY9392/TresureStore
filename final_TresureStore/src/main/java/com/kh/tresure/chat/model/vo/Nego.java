package com.kh.tresure.chat.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder //클래스 순서 상관없이 사용가능한 어노테이션
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Nego {

	private int negoPrice;
	private int negoStatus;
	private int sellNo;
	private int chatRoomNo;
	
}
