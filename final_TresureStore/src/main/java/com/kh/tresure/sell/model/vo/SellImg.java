package com.kh.tresure.sell.model.vo;


import java.util.Date;

import lombok.Data;


@Data
public class SellImg {

	private int sfileNo;
	private int sellNo;
	private String originName;
	private String changeName;
	private Date upLoadDate;
	private String filePath;
	private String fileType;
	private String status;
}
