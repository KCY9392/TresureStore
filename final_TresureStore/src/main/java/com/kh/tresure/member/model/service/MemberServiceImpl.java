package com.kh.tresure.member.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.tresure.chat.model.vo.ChatRoom;
import com.kh.tresure.common.model.dto.PageInfo;
import com.kh.tresure.common.template.Pagination;
import com.kh.tresure.member.model.dao.MemberDao;
import com.kh.tresure.member.model.vo.Account;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.purchase.model.vo.Purchase;
import com.kh.tresure.sell.controller.SellController;

@Service
public class MemberServiceImpl implements MemberService {

	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);	
	private MemberDao memberDao;
	private SqlSession sqlSession;
	private Pagination pagination;
	
	// 기본생성자
	public MemberServiceImpl() {}
	
	@Autowired
	public MemberServiceImpl(MemberDao memberDao,SqlSession sqlSession, Pagination pagination) {
		this.memberDao = memberDao;
		this.sqlSession = sqlSession;
		this.pagination = pagination;
	}
	
	// 로그인 및 회원가입 하는 메소드 구현
	@Override
	@Transactional (rollbackFor=Exception.class)
	public Member loginAndMemberEnroll(Member member) {
		Member loginUser = new Member();
		
		// 블랙리스트 유저인지 먼저 검사 (이거 뭔가 된것 같긴한데 컨트롤러를 손좀 봐야할듯)
		int blackConsumer = memberDao.selectblackconsumer(sqlSession, member);
		if(blackConsumer > 0 ) {
			loginUser = null;
			return loginUser;
		}
		
		// 핸드폰번호와 이메일로 회원이 존재하는지 확인
		int existUser = memberDao.selectExistenceStatus(sqlSession, member);
		
		if(existUser == 0) {
			// 혹시 모르니 탈퇴한 사람인지 확인 (이메일 핸드폰번호) 
			int goodByeUser =  memberDao.selectUserState(sqlSession, member);
			
			if(goodByeUser == 1) {	// 탈퇴한 사람이 다시 로그인 한다면 상태변경하고 유저번호 다시
				memberDao.updateUserState(sqlSession, member);
			} else if (goodByeUser == 0){
				int insertgogo = memberDao.insertMember(sqlSession, member);
			}
		}
	
		
		if(member.getPhone() == null) {	// 카카오로 로그인
			
			// 로그인하게 객체 가져오기
			loginUser = memberDao.loginAndMemberEnrollKaKako(sqlSession, member);
			
		} else if(member.getEmail() == null){	// 본인인증했을 시
			
			// 로그인하게 객체 가져오기
			loginUser = memberDao.loginAndMemberEnrollauAuthentication(sqlSession, member);
			
		}
		
		
		return loginUser;
	}
	
	// 회원탈퇴하는 메소드
	public void deleteMember(int userNo) {
		
		// 우선 이 사람의 객체를 가져와서 저장
		Member member = memberDao.selectUser(sqlSession, userNo);
		
		// 객체는 잘 가져왔으니 현재 데베에 해당 유저 삭제
		int deleteSuccess = memberDao.deleteMember(sqlSession, userNo);
		if(deleteSuccess > 0) {
			// 삭제에 성공했으면 삭제한 유저 상태만 바꿔서 다시 넣어주기
			memberDao.insertLeaveUser(sqlSession, member);
		}

	}
	
	// 본인인증에서 블랙리스트인지 검사
	public int blackConsumer(Member m, String userName, String phone) {
		
		int userCount = 0;
		m.setUserName(userName);
		m.setPhone(phone);
		
		int result = memberDao.selectblackconsumer(sqlSession, m);
		
		if(result > 0) {
			userCount = 1;
		} else {
			userCount = 0;
		}
		
		return userCount;

	}
	
	//계좌 추가하기
	@Override
	public int userAddAccount(Account accountInfo) {
		
		return memberDao.userAddAccount(sqlSession, accountInfo);
	}
	
	//계좌 수정하기
	@Override
	public int updateAccount(Account accountInfo) {
		
		return memberDao.updateAccount(sqlSession, accountInfo);
	}
	
	//로그인 유저 계좌 가져오기
	@Override
	public int accountNumber(Account account) {
		
		return memberDao.accountNumber(sqlSession, account);
	}
	


	//관리자페이지 결제관리
	@Override
	public List<Purchase> accountList(){
		
		return memberDao.accountList(sqlSession);

	}
	

	// 관리페이지의 유저 전체 가져오기
	@Override
	public HashMap<Object, Object> selectListAll(HashMap<Object, Object> paramMap, int currentPage){
		
		// 페이징 처리
	    int listCount = memberDao.selectUserCount(sqlSession);
	    int pageLimit = 10;
	    int viewLimit = 10;
	    
	    PageInfo pi = pagination.getPageInfo(listCount, currentPage, pageLimit, viewLimit);
	    
	    // 페이징 처리와 유저번호 해시맵에 담기
	    paramMap.put("pi", pi);
	   
	    List<Member> mList = memberDao.selectListAll(sqlSession, paramMap);
	   
	    // 객체 해시맵에 담기
	    paramMap.put("mList", mList);
	   
	    return paramMap;
		
	}
	

	@Override
	public int changeDepoStatus(Purchase p) {
		return memberDao.changeDepoStatus(sqlSession, p);
	}
	


	
}
