package com.carto.board.domain;

import lombok.ToString;

@ToString
public class Criteria {
	private int page;       // 현재 페이지 번호
	private int perPageNum; // 페이지 당 보여질 게시글 수 
	
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
}
