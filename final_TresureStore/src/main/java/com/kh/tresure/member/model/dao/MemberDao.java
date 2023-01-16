package com.kh.tresure.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tresure.member.model.vo.Member;

@Repository
public class MemberDao {

	
	// 로그인 및 회원가입 하는 메소드
	public int selectExistenceStatus(SqlSession sqlSession, Member member) {
		
		return sqlSession.selectOne("memberMapper.selectExistenceStatus", member);
	}

	// 회원 가입 자동으로 진행하는 메소드
	public int insertMember(SqlSession sqlSession, Member member) {
		
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	// 로그인하게 객체 가져오는 메소드
	public Member loginAndMemberEnroll(SqlSession sqlSession, Member member) {
		
		return sqlSession.selectOne("memberMapper.loginAndMemberEnroll", member);
	}

}
