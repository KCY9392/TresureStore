package com.kh.tresure.common.scheduler;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kh.tresure.chat.model.service.ChatService;
import com.kh.tresure.chat.model.vo.ChatFiles;

@Component
@Repository
public class ImageScheduler {
	private Logger logger = LoggerFactory.getLogger(ImageScheduler.class);
	
	private ChatService chatService;
	
	@Autowired
	private ServletContext application;
	
	
	@Autowired
	public ImageScheduler(ChatService chatService) {
		this.chatService = chatService;
	}

	@Scheduled(cron="* 0/50 0/5 * * * ")// 1000 = 1000ms 이므로 1초이다.
	public void chatImageDeleteSchduler() {
		
		//logger.info("스케쥴링 실행중입니다.");
		
		// 1) board테이블안에있는 모든 파일 목록 조회
		// 2) resources/uploadFiles폴더 아래에 존재하는 모든 이미지 파일 목록 조회.
		// 3) 두 목록을 비교해서 일치하지 않는 파일 삭제
		// delete();
		
		// 1) 데이터베이스에 파일 가져와보자
		ArrayList<ChatFiles> list = chatService.selectAttachment();
		
		//  파일경로
		File path = new File(application.getRealPath("resources/images/chat"));
		
		// 서버에있는 파일 경로에있는 파일들 배열로 뽑아오기
		File[] files = path.listFiles();	// path참조하고있는 폴더에 들어가 있는 모든 파일을 얻어와서 File배열로 반환해주는 녀석
		
		// 배열로된걸 리스트로 변경
		List<File> fileList = (List)Arrays.asList(files);
		HttpServletRequest request = null;
		
		if(!list.isEmpty()) {
			// 서버에 있는파일 반복문 돌리기
			for(int i = 0; i < fileList.size(); i++) {
				String fileSavaPath = fileList.get(i).toString();
				
				// 데베에있는 파일 반복문 돌리기
				for(int j = 0; j < list.size(); j++) {
					
					String dbChangeName = list.get(j).getChangeName();

					logger.info("dbChangeName : " + dbChangeName);
					logger.info("fileSavaPath : " + fileSavaPath);
					
					if((fileSavaPath.indexOf(dbChangeName) > 0)) {
						logger.info("있는 파일이군요?");
						break;
					}
					
					if(j == list.size()- 1 && !(fileSavaPath.indexOf(dbChangeName) > 0)) {
					
						logger.info("이 파일은 데베에 없군요? : " + fileSavaPath);
						boolean result = fileList.get(i).delete();
						logger.info(result+"");
					}
					

				}
			}
		
		}
		
	
		
		
	}

}
