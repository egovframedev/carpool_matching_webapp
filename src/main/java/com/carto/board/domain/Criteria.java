package com.carto.board.domain;

import org.apache.ibatis.type.Alias;

import lombok.ToString;

@ToString
@Alias("criteria")
public class Criteria {

	private int page; // 현재 페이지 번호
	private int perPageNum; // 한 페이지당 게시글 수 (10개씩)

	private String searchType;// 제목 t, 작성자w, 내용c, 제목+내용tc
	private String keyword; // 검색어

//	private String btype; // 게시판 타입
	private BoardType btype;

	public Criteria() {
		// TODO Auto-generated constructor stub
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
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

	public BoardType getBtype() {
		return btype;
	}
	
	public int getBtypeNum() {
		return this.btype.ordinal(); 
	}
	
	public void setBtype(BoardType btype) {
		this.btype = btype;
	}

	public void strToBtype(String btype) {

		System.out.println("strToBtype(" + btype + ")");
		this.btype = BoardType.valueOf(btype.toUpperCase());
	}


}