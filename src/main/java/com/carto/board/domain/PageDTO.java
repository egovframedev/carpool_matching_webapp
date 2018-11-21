package com.carto.board.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;      // 시작 페이지 번호
	private int endPage;        // 끝 페이지 번호
	private boolean prev, next; // 이전, 다음 페이지 여부
	
	private int total;          // 전체 게시글 수
	private Criteria cri;       // 현재 페이번호(page_와 페이지당 게시글 수(perPageNum)
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
	
		this.endPage = (int) (Math.ceil(cri.getPage() / 10.0) * 10);
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getPerPageNum()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	
}
