package com.kh.tresure.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class Image {
	private static Logger logger = LoggerFactory.getLogger(Image.class);
	// 변경된이름을 돌려주면서 원본파일을 변경된 파일이름으로 서버에 저장시키는 메서드
	static public String saveFile(MultipartFile upfile, String savePath) {

		String originName = upfile.getOriginalFilename(); // "dog.jpg"
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 	// 20230119125235

		int random = (int) (Math.random() * 90000 + 10000);	// 90000 < X < 100000	// 95242

		String ext = originName.substring(originName.lastIndexOf("."));	// jpg png 

		String changeName = currentTime + random + ext;	// 2023011912523595242.jpg
		System.out.println("1."+changeName);

		System.out.println("2."+savePath);
			try {
				upfile.transferTo(new File(savePath + changeName));
				System.out.println("3."+upfile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				logger.error("에러남");
				e.printStackTrace();
			}

		return changeName;
	}
}
