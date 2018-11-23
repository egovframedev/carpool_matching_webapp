package com.carto.member.domain;

public enum MessageType {
	NORMAL("일반"), NOTICE("알림"), MATCHING("카풀매칭"), MEMERGENCY("긴급");
	
	private String desc;
	
	private MessageType(String desc) {
		this.desc = desc;
	}
	
	public String getDesc() {
		return this.desc;
	}
}
