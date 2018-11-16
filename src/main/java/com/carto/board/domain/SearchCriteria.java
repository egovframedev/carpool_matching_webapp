package com.carto.board.domain;

import lombok.ToString;

// 게시판 검색에 필요한 데이터 클래스
@ToString
public class SearchCriteria extends Criteria {
	private String searchType;  // 검색 유형
	private String keyword;     // 검색 키워드
	private String btype;       // 게시 유형
	
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

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}
	
	public String getTitle() {
		switch (btype.toLowerCase()) {
		case "notice": return "공지사항";
		case "faq":    return "자주하는질문";
		case "qna":    return "묻고답하기";
		default:       return "일반게시판";
		}
	}
}
