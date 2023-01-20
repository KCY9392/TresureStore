package com.kh.tresure.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Block {

	private int blockNo;
	private int blockerNo;	// 차단한 사람
	private int blockedNo;	// 차단당한 사람
}
