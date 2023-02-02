package com.kh.tresure.report.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder //클래스 순서 상관없이 사용가능한 어노테이션
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Report {

	private int reportNo;
	private int reporterNo;
	private int reportedNo;
	private String reportContent;
	private Date createDate;
	private String status;
	
	//신고당한 전체 횟수
	private int reportCount;
}
