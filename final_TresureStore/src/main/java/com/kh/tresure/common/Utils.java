package com.kh.tresure.common;

public class Utils {

	// 기본 생성자
	public Utils() {}
	
	// 랜덤 5자리 숫자 나오게하는 메소드
	public static int randomNumber() {
		int randomNumber = 0;
		
		randomNumber = ((int)(Math.random() * 90000))+10000;
		// 0 <= x < 90000   >>  10000<= x < 100000
		
		return randomNumber;
	}
	
}
