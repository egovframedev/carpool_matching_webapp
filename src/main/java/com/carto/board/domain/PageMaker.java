package com.carto.board.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.ToString;

@ToString
public class PageMaker {

	private int totalCount; // 전체 데이터 수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private boolean prev; // 이전 페이지 링크
	private boolean next; // 이후 페이지 링크
	
	private int displayPageNum = 10; //페이지 번호의 수

	private Criteria cri;  // 현재 페이번호(page_와 페이지당 게시글 수(perPageNum)
	
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public Criteria getCri() {
		return cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	private void calcData() {
		// 끝 페이지 번호
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum );
		
		// 시작 페이지 번호
		startPage = (endPage - displayPageNum) + 1;
		
		// 실제 끝 페이지 번호
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		// 이전 페이지 링크 여부
		prev = startPage == 1 ? false : true;
		// 다음 페이지 링크 여부
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.build();
		return uriComponents.toString();
	}
	
	public String makeSearch(int page) {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.queryParam("searchType", ((Criteria)cri).getSearchType())
					.queryParam("keyword", ((Criteria)cri).getKeyword())
					.build();
		return uriComponents.toString();
	}
	
}
