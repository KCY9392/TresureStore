package com.kh.tresure.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class KakaoUserInfo {
	
	private long kakaoId;
	private String nickName;
	private String email;
	
}
