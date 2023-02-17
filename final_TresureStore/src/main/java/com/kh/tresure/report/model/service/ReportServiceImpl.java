package com.kh.tresure.report.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tresure.member.model.dao.MemberDao;
import com.kh.tresure.member.model.vo.Member;
import com.kh.tresure.report.model.dao.ReportDao;
import com.kh.tresure.report.model.vo.Report;


@Service
public class ReportServiceImpl implements ReportService {

	private ReportDao reportDao;
	private SqlSession sqlSession;
	private MemberDao memberDao;
	
	// 기본생성자
	public ReportServiceImpl() {
		
	}
	
	@Autowired
	public ReportServiceImpl(ReportDao reportDao,SqlSession sqlSession, MemberDao memberDao) {
		this.reportDao = reportDao;
		this.sqlSession = sqlSession;
		this.memberDao = memberDao;
	}
	
	//신고리스트에 추가
	@Override
	public int addReport(Report report, int sellUserNo, String purchaseUserNo, int reporterNo) {
		
		report.setReporterNo(reporterNo);
		int state = 1;
		// 신고자와 판매자가 같은 경우
		if(reporterNo == sellUserNo) {
			report.setReportedNo(Integer.parseInt(purchaseUserNo));
			
		} else {	// 신고자와 구매자가 같은경우
			report.setReportedNo(sellUserNo);
		}
		
		int result = reportDao.addReport(sqlSession, report);
		
		// 성공적으로 신고되면 신고당한 사람이 신고 40번 됐는지 확인
		if(result > 0) { 
			int reportCount = reportDao.selectReportCount(sqlSession, report);
			if(reportCount >= 3) {// 실험중3회로
				// 40번 넘었으니 블랙리스트로 진행
				
				// 우선 이 사람의 객체를 가져와서 저장
				Member member = memberDao.selectUser(sqlSession, report.getReportedNo());
				
				// 객체는 잘 가져왔으니 현재 데베에 해당 유저 삭제
				int deleteSuccess = memberDao.deleteMember(sqlSession, report.getReportedNo());
				
				if(deleteSuccess > 0) {
					// 삭제에 성공했으면 삭제한 유저 상태만 바꿔서 다시 넣어주기
					memberDao.insertBlackListUser(sqlSession, member);
					state = 0;
					
				}
				
			}
		}
		
		// state가 1이면 신고만 된거 0이면 신고되어서 블랙리스트가 된거
		return state;
	}
	
	//신고 리스트 조회(불러오기)
	@Override
	public List<Report> reportSearchResult(String search, String account){
		
			// @포함하여 검색했을 경우
			if(search.charAt(0) == '@') {
				search = search.substring(1);
				
				return reportDao.reportSearchResult(sqlSession, search);
				
			}else {
				
				return reportDao.reportAccountResult(sqlSession, account);
				
			}
		
	}
	
	//신고당한 총 횟수
	@Override
	public Integer reportNumber(String search, String account) {
	
		HashMap<String, Object> map = new HashMap<>();
		map.put("search", search);
		map.put("account", account);
		
		return reportDao.reportNumber(sqlSession, map);
	}
}
