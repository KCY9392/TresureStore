package com.kh.tresure.sell.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tresure.common.Image;
import com.kh.tresure.sell.model.dao.SellDao;
import com.kh.tresure.sell.model.vo.Sell;
import com.kh.tresure.sell.model.vo.SellImg;

@Service
public class SellServiceImpl implements SellService  {

	
	private SellDao sellDao;
	private SqlSession sqlSession;
	
	// 기본생성자
	public SellServiceImpl() {
		
	}
	
	@Autowired
	public SellServiceImpl(SellDao sellDao, SqlSession sqlSession) {
		this.sellDao = sellDao;
		this.sqlSession = sqlSession;
	}
	
	
	/**
	 * 판매목록 조회(메인페이지)
	 */
	@Override
	public List<Sell> sellListselect(){
		return sellDao.sellListselect(sqlSession);
	}
	
	
	/**
	 * 판매 등록
	 */
	@Override
	public int insertSell(Sell s, List<MultipartFile> list, String webPath, String serverFolderPath) {

		s.setSellTitle(s.getSellTitle());
		s.setSellContent(s.getSellContent());
		s.setPrice(s.getPrice());

		int sellNo = sellDao.getSellNo(sqlSession);

		if (list != null/* && b.getBoardCd().equals("T") */) {
			// 2) 이미지 삽입.

			// list -> 실제 파일이 담겨있는 리스트
			List<SellImg> sellImageList = new ArrayList<>();
			List<String> renameList = new ArrayList<>();
			// renameList : 변경된 파일명을 저장할 리스트.

			// list에서 담겨있는 파일정보 중 실제로 업로드된 파일만 분류하기.
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getSize() > 0) { // i번째 요소에 업로드된 이미지가 존재하는 경우.

					// 변경된 파일명 저장.
					String changeName = Image.saveFile(list.get(i), serverFolderPath);
					renameList.add(changeName);

					// BoardImg객체를 생성해서 값을 추가한 후 boardImageList;
					SellImg img = new SellImg();
					img.setSellNo(sellNo); // 게시글 번호
					img.setFileType(i == 0 ? "C" : "D");
					img.setOriginName(list.get(i).getOriginalFilename()); // 원본이름
					img.setChangeName(changeName);
					img.setUpLoadDate(new Date());
					img.setFilePath(webPath);
					System.out.println(img.toString());

					sellImageList.add(img);
				}
			}

			if (sellImageList.size() > 0) {
				s.setImgSrc(webPath + sellImageList.get(0).getChangeName());
			}
			s.setSellNo(sellNo);
			int sellCount = sellDao.insertSell(sqlSession, s);
			// 분류작업완료 후 boardImageList가 비워있다 ? --> 등록한 이미지가 없음
			// 비어있지 않다 ? --> 등록한 이미지가 있음.

			if (!sellImageList.isEmpty()) {

				int result = sellDao.insertSellImgList(sqlSession, sellImageList);

				if (result == sellImageList.size()) { // 삽입된 행의 갯수와, 업로드된 이미지 수가 같은 경우

					// 서버에 이미지 저장.
					for (int i = 0; i < sellImageList.size(); i++) {

						String fileType = sellImageList.get(i).getFileType();

						try {
							list.get(i).transferTo(new File(serverFolderPath + renameList.get(i)));
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}

				} else { // 이미지 삽입 실패시
					// 강제로 예외 발생시키기.

				}
			}
		}
		return sellNo;
	}
	
	
	/**
	 * 상품 상세조회
	 */
	@Override
	public Sell selectSellDetail(Map<String, Integer> map) {
		return sellDao.selectSellDetail(map, sqlSession);
	}
	
	/**
	 * 상품 이미지 조회
	 */
	@Override
	public List<SellImg> selectSellImgList(Map<String, Integer> map) {
		return sellDao.selectSellImgList(map, sqlSession);
	}
	
	/**
	 * 상품 조회수 증가
	 */
	@Override
	public int increaseCount(int sellNo) {
		return sellDao.increaseCount(sellNo, sqlSession);
	}
	
	
	/**
	 * 최신순, 인기순, 저가순, 고가순 정렬 */
	public List<Sell> howOrderList(HashMap<String, Object> map){
		return sellDao.howOrderLIst(map, sqlSession);
	}
}
