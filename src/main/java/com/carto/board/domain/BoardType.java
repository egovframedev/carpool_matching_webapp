package com.carto.board.domain;

public enum BoardType {
	NOTICE("공지사항"), FAQ("자주묻는질문"), QNA("묻고답하기");
	
	private String btitle;
	
	private BoardType(String btitle) {
		this.btitle = btitle;
	}
	
	public String getBtitle() {
		return btitle;
	}
	
	public String getSmall() {
		return this.toString().toLowerCase();
	}
	

}
