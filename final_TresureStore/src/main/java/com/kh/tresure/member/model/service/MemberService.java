package com.kh.tresure.member.model.service;


import java.util.HashMap;
import java.util.List;

import com.kh.tresure.member.model.vo.Account;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.purchase.model.vo.Purchase;


public interface MemberService {

	// 로그인 및 회원가입 하는 메소드
	public Member loginAndMemberEnroll(Member member);

	// 회원 탈퇴하기
	public void deleteMember(int userNo);
	
	// 본인인증 블랙리스트인지 검사
	public int blackConsumer(Member m, String userName, String phone);

	//계좌 추가
	public int userAddAccount(Account accountInfo);

	// 계좌 수정하기
	public int updateAccount(Account accountInfo);

	//로그인 유저 계좌 가져오기
	public int accountNumber(Account account);
	
	// 관리페이지의 유저 전체 가져오기
	   public HashMap<Object, Object> selectListAll(HashMap<Object, Object> paramMap, int currentPage);





	
	//관리자페이지 결제관리
	public List<Purchase> accountList();

	public int changeDepoStatus(Purchase p);





}
