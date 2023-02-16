package com.kh.tresure.common.template;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.tresure.common.model.dto.PageInfo;

@Component
public class Pagination {

		private PageInfo pageInfo;
		
		public Pagination() {}
		
		@Autowired
		public Pagination(PageInfo pageInfo) {
			this.pageInfo = pageInfo;
		}
		
		public PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int viewLimit) {
			
			int maxPage = (int)Math.ceil((double)listCount/viewLimit);
			int startPage = ((currentPage - 1) / pageLimit * pageLimit) + 1;
			int endPage = startPage + pageLimit - 1;
			endPage = endPage > maxPage ? maxPage : endPage;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			pageInfo.setViewLimit(viewLimit);
			pageInfo.setCurrentPage(currentPage);
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPageLimit(pageLimit);
			pageInfo.setStartPage(startPage);
			
			return pageInfo;
		}
}
