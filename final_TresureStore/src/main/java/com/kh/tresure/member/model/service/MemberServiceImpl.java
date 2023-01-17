package com.kh.tresure.member.model.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.tresure.member.model.dao.MemberDao;
import com.kh.tresure.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	
	private MemberDao memberDao;
	private SqlSession sqlSession;
	
	// 기본생성자
	public MemberServiceImpl() {}
	
	@Autowired
	public MemberServiceImpl(MemberDao memberDao,SqlSession sqlSession) {
		this.memberDao = memberDao;
		this.sqlSession = sqlSession;
	}
	
	// 로그인 및 회원가입 하는 메소드 구현
	@Override
	@Transactional (rollbackFor=Exception.class)
	public Member loginAndMemberEnroll(Member member) {
		
		// 핸드폰번호로 회원이 존재하는지 확인
		int result = memberDao.selectExistenceStatus(sqlSession, member);
		
		if(result == 0) {	// 회원이 없으면 회원가입이 자동 진행
			int result2 = memberDao.insertMember(sqlSession, member);
		} 
		
		// 로그인하게 객체 가져오기
		Member loginUser = memberDao.loginAndMemberEnroll(sqlSession, member);
		
		return loginUser;
	}
	
	
}
