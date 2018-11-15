package com.carto.board.domain;

import lombok.ToString;

@ToString
public class Criteria {
	private int page;           // 현재 페이지 번호
	private int perPageNum;     // 한 페이지 당 보여질 게시글 수
	private String searchType;  // 검색 유형
	private String keyword;     // 검색 키워드
	
	// 생성자 - page, perPageNum 초기설정
	public Criteria() {
		this.page = 1; 
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) { // 페이지 번호가 0 이면 1 로 변경
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	// 시작 페이지 번호
	public int getPageStart() {
		// (페이지번호 - 1) * 페이지당 보여지는 게시글수
		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) { // 페이지당글수 제한(100개 이내)
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}
