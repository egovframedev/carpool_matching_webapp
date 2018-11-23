package com.carto.member.domain;

import lombok.Data;

@Data
public class MessageCriteria {
	private int page;         // 페이지 번호
	private int perPageNum;   // 한 페이지 당 메세지 수
	private String senderId;  // 보내는 회원 아이디
	private String targetId;  // 받는 회원 아이디
	private MessageType type; // 메세지 구분 : NORMAL("일반"), NOTICE("알림"), MATCHING("카풀매칭"), MEMERGENCY("긴급");
	
	public MessageCriteria() {
		page = 1;
		perPageNum = 10;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
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
	
	public String getTypeStr() {
		return type.getDesc();
	}
}
