package com.kh.tresure.follow.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Follow {
	private int fiId;
	private int fwId;
	private int sellCount;
	private double avg;
}
