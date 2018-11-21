package com.carto.board.domain;

public enum BoardType {
	NORMAL("일반게시판"), NOTICE("공지사항"), FAQ("자주하는질문"), QNA("묻고답하기");
	
	private String desc;
	
	private BoardType(String description) {
		this.desc = description;
	}
	
	public String getDesc() {
		return desc;
	}
}
