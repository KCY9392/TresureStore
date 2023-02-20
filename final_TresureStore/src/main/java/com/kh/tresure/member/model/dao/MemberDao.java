package com.kh.tresure.member.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.tresure.member.model.vo.Account;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.purchase.model.vo.Purchase;
import com.kh.tresure.sell.controller.SellController;

@Repository
public class MemberDao {
	private Logger logger = LoggerFactory.getLogger(MemberDao.class);
//본인인증 방법 & kakao 

	/**
	 * 본인인증 입력정보로 가입한 회원있는 지 여부체크
	 */
	public int selectExistenceStatus(SqlSession sqlSession, Member member) {

		return sqlSession.selectOne("memberMapper.selectExistenceStatus", member);
	}

	/**
	 * 회원 가입 자동으로 진행하는 메소드
	 */
	public int insertMember(SqlSession sqlSession, Member member) {

		return sqlSession.insert("memberMapper.insertMember", member);
	}

	/**
	 * 카카오로 로그인한 member객체 가져오는 메소드
	 */
	public Member loginAndMemberEnrollKaKako(SqlSession sqlSession, Member member) {

		return sqlSession.selectOne("memberMapper.loginAndMemberEnrollKaKako", member);
	}

	/**
	 * 본인인증으로 로그인한 member객체 가져오는 메소드
	 */
	public Member loginAndMemberEnrollauAuthentication(SqlSession sqlSession, Member member) {

		return sqlSession.selectOne("memberMapper.loginAndMemberEnrollauAuthentication", member);
	}

	/**
	 * 관리자가 유저 상태변경하게 만드는기능
	 */
	public int userStatusByadmin(SqlSession sqlSession, int userNo) {

		return sqlSession.update("memberMapper.userStatusByadmin", userNo);
	}

	/**
	 * 회원 탈퇴 메소드
	 */
	public int deleteMember(SqlSession sqlSession, int userNo) {

		return sqlSession.delete("memberMapper.deleteMember", userNo);
	}

	/**
	 * 유저가 다시 로그인할라할때 때 탈퇴한 회원인지 확인하는 메소드
	 */
	public int selectUserState(SqlSession sqlSession, Member member) {

		return sqlSession.selectOne("memberMapper.selectUserState", member);
	}

	/**
	 * 탈퇴한 회원 새롭게 로그인하는 메소드
	 */
	public void updateUserState(SqlSession sqlSession, Member member) {

		sqlSession.update("memberMapper.updateUserState", member);
	}

	/**
	 * 회원번호로 그 사람 객체 가져오기
	 */
	public Member selectUser(SqlSession sqlSession, int userNo) {

		return sqlSession.selectOne("memberMapper.selectUser", userNo);
	}

	/**
	 * 떠나는 유저 다시 값변경해서 넣기
	 */
	public void insertLeaveUser(SqlSession sqlSession, Member member) {
		sqlSession.insert("memberMapper.insertLeaveUser", member);
	}

	/**
	 * 신고 20번되어서 블랙리스트 된 유저인지 확인하는 작업
	 */
	public int selectblackconsumer(SqlSession sqlSession, Member member) {

		return sqlSession.selectOne("memberMapper.selectblackconsumer", member);

	}

	/**
	 * 블랙리스트 유저 다시 값 변경해서 넣기
	 */
	public void insertBlackListUser(SqlSession sqlSession, Member member) {

		sqlSession.insert("memberMapper.insertBlackListUser", member);
	}

	// 계좌 추가하기
	public int userAddAccount(SqlSession sqlSession, Account accountInfo) {

		return sqlSession.insert("memberMapper.userAddAccount", accountInfo);
	}

	// 계좌 수정하기
	public int updateAccount(SqlSession sqlSession, Account accountInfo) {

		return sqlSession.update("memberMapper.updateAccount", accountInfo);

	}

	// 판매자의 계좌번호 가져오기
	public static Account selectAccountInfo(SqlSession sqlSession, String account) {

		return sqlSession.selectOne("memberMapper.selectAccountInfo", account);
	}

	// 로그인 유저 계좌 가져오기
	public int accountNumber(SqlSession sqlSession, Account account) {

		return sqlSession.selectOne("memberMapper.accountNumber", account);
	}

	// 관리자페이지 결제관리
	public List<Purchase> accountList(SqlSession sqlSession) {

		return sqlSession.selectList("memberMapper.accountList");
	}

	// 회원이 계좌번호 값가져오기
	public String userAcountIs(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.userAcountIs", userNo);

	}

	// 입금상태 변경
	public int changeDepoStatus(SqlSession sqlSession, Purchase p) {

		return sqlSession.update("memberMapper.changeDepoStatus", p);

	}

	// 페이징 처리
	public int selectUserCount(SqlSession sqlSession) {
		return sqlSession.selectOne("memberMapper.selectUserCount");
	}

	// 관리자페이지 - 회원리스트
	public List<Member> selectListAll(SqlSession sqlSession, HashMap<Object, Object> paramMap) {
		return sqlSession.selectList("memberMapper.selectListAll", paramMap);
	}

}
