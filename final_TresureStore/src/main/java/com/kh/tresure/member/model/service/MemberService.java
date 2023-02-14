package com.kh.tresure.member.model.service;


import java.util.HashMap;

import com.kh.tresure.member.model.vo.Account;
import com.kh.tresure.member.model.vo.Member;


public interface MemberService {

	// 로그인 및 회원가입 하는 메소드
	public Member loginAndMemberEnroll(Member member);

	// 회원 탈퇴하기
	public void deleteMember(int userNo);

	//계좌 추가
	public int userAddAccount(Account accountInfo);

	// 계좌 수정하기
	public int updateAccount(Account accountInfo);

	//로그인 유저 계좌 가져오기
	public int accountNumber(Account account);

}
