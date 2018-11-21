package com.carto.board.domain;

import org.springframework.web.util.UriComponentsBuilder;
import lombok.ToString;

@ToString
public class Criteria {
	private int page;          // 현재 페이지 번호
	private int perPageNum;    // 페이지 당 보여질 게시글 수 
	private String searchType; // 검색 유형
	private String keyword;    // 검색 키워드
	private String btype;      // 게시 유형
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	// method form Mybatis SQL Mapper
	public int getPage() {
		return page;
	}
	
	// method form Mybatis SQL Mapper
	public int getPageStart() {
		// 시작 데이터 번호 = ( 페이지번호 - 1) * 페이지 당 보여지는 게시글 수
		return (this.page - 1) * perPageNum;
	}
	
	// method form Mybatis SQL Mapper
	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 100) {
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

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}
	
	public String getBtitle() {
		switch(btype.toLowerCase()) {
		case "notice": return "공지사항";
		case "faq":    return "자주하는질문";
		case "qna":    return "묻고답하기";
		default: return "일반게시판";
		}
	}
	
	public String[] getSearchTypeArr() {
		return searchType == null ? new String[] {} : searchType.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("page", this.page)
				.queryParam("perPageNum", this.perPageNum)
				.queryParam("searchType", this.searchType)
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
}
