package com.carto.member.domain;

import lombok.Data;

@Data
public class MessageCriteria {
	private int page;         // 페이지 번호
	private int perPageNum;   // 한 페이지 당 메세지 수
	private String senderId;  // 보내는 회원 아이디
	private String targetId;  // 받는 회원 아이디
	private MessageType type; // 메세지 구분 : NORMAL("일반"), NOTICE("알림"), MATCHING("카풀매칭"), MEMERGENCY("긴급");
	
	
	private MessageCriteria() {
		page = 1;
		perPageNum = 10;
	}
	
}
