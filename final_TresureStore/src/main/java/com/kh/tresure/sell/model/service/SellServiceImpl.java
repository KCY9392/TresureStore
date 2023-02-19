package com.kh.tresure.sell.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tresure.common.Image;
import com.kh.tresure.review.model.vo.Review;
import com.kh.tresure.sell.controller.SellController;
import com.kh.tresure.sell.model.dao.SellDao;
import com.kh.tresure.sell.model.vo.Category;
import com.kh.tresure.sell.model.vo.Sell;
import com.kh.tresure.sell.model.vo.SellImg;

@Service
public class SellServiceImpl implements SellService {

	private SellDao sellDao;
	private SqlSession sqlSession;
	private Logger logger = LoggerFactory.getLogger(SellController.class);

	// 기본생성자
	public SellServiceImpl() {

	}

	@Autowired
	public SellServiceImpl(SellDao sellDao, SqlSession sqlSession) {
		this.sellDao = sellDao;
		this.sqlSession = sqlSession;
	}

	/**
	 * 판매목록 더보기
	 */
	@Override
	public List<Sell> sellListTheBogi(int lastSellNo) {

		int lastSNo = lastSellNo + 39;
		logger.info("fistSellNo : " + lastSellNo);
		logger.info("lastSellNo : " + lastSNo);

		HashMap<String, Object> map = new HashMap<>();
		map.put("lastSellNo", lastSNo);
		map.put("firstSellNo", lastSellNo);

		return sellDao.sellListTheBogi(sqlSession, map);
	}

	/**
	 * 제일 마지막 Sell 번호 조회
	 */
	public int finishSellNo() {
		return sellDao.finishSellNo(sqlSession);
	}

	/**
	 * 판매목록 조회(메인페이지)
	 */
	@Override
	public List<Sell> sellListselect() {
		return sellDao.sellListselect(sqlSession);
	}

	/**
	 * 상품 검색
	 */
	@Override
	public List<Sell> sellListsearch(String keyword) {
		return sellDao.sellListsearch(keyword, sqlSession);
	}

	/**
	 * 최근거래성공한 5개 상품가격
	 */
	public List<Sell> successfive(String keyword) {
		return sellDao.successfive(keyword, sqlSession);
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
	 * 최신순, 인기순, 저가순, 고가순 정렬
	 */
	public List<Sell> howOrderList(HashMap<String, Object> map) {
		return sellDao.howOrderLIst(map, sqlSession);
	}

	@Override
	public List<Sell> sellList(int userNo) {
		return sellDao.sellList(sqlSession, userNo);
	}

	@Override
	public List<Review> reviewList(int userNo) {
		return sellDao.reviewList(sqlSession, userNo);
	}

	@Override
	public Map<String, Object> sellerDetail(Map<String, Integer> map) {
		return sellDao.sellerDetail(sqlSession, map);
	}

	@Override
	public List<Category> cateList() {
		return sellDao.cateList(sqlSession);
	}

	@Override
	public List<SellImg> selectSellUpImgList(Map<String, Integer> map) {
		return sellDao.selectSellUpImgList(map, sqlSession);
	}

	@Override
	public int updateSell(Sell s, List<MultipartFile> list, String webPath, String serverFolderPath) {
		//int sellNo = sellDao.getSellNo(sqlSession);
		int result = sellDao.updateSell(sqlSession, s);

		// 파일 객체 선언
		File file = null;

		// 대표이미지가 없다는 가정하에 mainImage 변수와 false 값
		boolean mainImage = false;

		// Sell 테이블 UPDATE가 성공하면
		if (result > 0) {
			// list에서 담겨있는 파일 중 실제로 업로드된 파일만 분류하기.
			// Sell의 imgList가 null이 아니라면
			if (s.getImgList() != null) {
				// Sell의 imgList를 for문으로 돌린다.
				for (SellImg img : s.getImgList()) {
					// 반복하는 SellImg의 fileType이 대표이미지 "T"라면
					if (img.getFileType().equals("T")) {
						// Sell 테이블의 대표이미지를 해당 SFILE_NO로 업데이트 시켜주고
						sellDao.updateSellImg(sqlSession, img);
						// mainImage을 true로 변경해준다.
						mainImage = true;
					}

					// SellImg의 fileType이 "D"라면 삭제이므로
					if (img.getStatus().equals("D")) {
						// serverPath와 SellImg의 changeName을 붙여서 새로운 파일을 만들고
						file = new File(savePath + img.getChangeName());
						// 파일이 존재하면서 실제로 파일이라면?
						if (file.exists() && file.isFile()) {
							// 파일을 삭제한다.
							file.delete();
						}
						// SFILE 테이블에서 해당 파일 데이터를 삭제한다.
						sellDao.deleteSellImg(sqlSession, img);
					}
				}
			}

			// 업로드 한 이미지 리스트가 비어있지 않다면
			if (!imgList.isEmpty()) {
				// 만약 mainImage이 false라면... 즉 대표이미지가 아직 없다면
				if (!mainImage) {
					// 업로드 된 이미지 중 첫번째의 fileType을 "T"로 변경한다.
					imgList.get(0).setFileType("T");
				}
				// 3) 업로드된 이미지만 분류하는 작업 수행.
				sellDao.insertSellImgList(sqlSession, imgList);
			}

			// SELL 테이블의 대표이미지를 SFILE의 FILE_TYPE = "T"인 것으로 변경한다.
			sellDao.updateSellFile(sqlSession, s);
		}
		// 너무빡세다...
		return result;
	}

	@Override
	public int sellDelete(Sell s) {

		return sellDao.deleteSell(sqlSession, s);
	}

	/**
	* 로그인 하지 않은 상태에서 상점명 검색시 */
	@Override
	public Object searchsellerDetail(int searchSeller) {
		return sellDao.searchsellerDetail(sqlSession, searchSeller);
	}

}
