package com.carto.carpool.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.carto.board.domain.Criteria;

public class Paging {
	private int totalCount; // 전체 데이터 수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private boolean prev; // 이전 페이지 링크
	private boolean next; // 이후 페이지 링크
	
	private int displayPageNum = 10; //페이지 번호의 수
	
	private CarpoolCriteria cri;
	
	public void setCri(CarpoolCriteria cri) {
		this.cri = cri;
	}
	
	public CarpoolCriteria getCri() {
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
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("page", Integer.toString(page));
		if(!cri.getSearchStart().isEmpty()) 
			params.add("searchStart", cri.getSearchStart());
		if(!cri.getSearchEnd().isEmpty()) 
			params.add("searchEnd", cri.getSearchEnd());
		if(!cri.getSearchDate().isEmpty())
			params.add("searchDate", cri.getSearchDate());	
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
									.queryParams(params).build();
		return uriComponents.toString();
	}
}
