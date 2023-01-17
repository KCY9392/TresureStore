package com.kh.tresure.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.member.model.vo.Member;

@Repository
public class MemberDao {

//본인인증 방법 & kakao 
	
	/**
	 * 본인인증 입력정보로 가입한 회원있는 지 여부체크 */
	public int selectExistenceStatus(SqlSession sqlSession, Member member) {
		
		return sqlSession.selectOne("memberMapper.selectExistenceStatus", member);
	}

	/**
	 * 회원 가입 자동으로 진행하는 메소드 */
	public int insertMember(SqlSession sqlSession, Member member) {
		
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	/**
	 * 로그인한 member객체 가져오는 메소드 */
	public Member loginAndMemberEnroll(SqlSession sqlSession, Member member) {
		
		return sqlSession.selectOne("memberMapper.loginAndMemberEnroll", member);
	}


}
