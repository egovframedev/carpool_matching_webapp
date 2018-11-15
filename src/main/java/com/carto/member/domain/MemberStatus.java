package com.carto.member.domain;

public enum MemberStatus {
	DISABLE("사용불가"), OFFLINE("오프라인"), ONLINE("온라인");
	
	private String desc;
	
	private MemberStatus(String description) {
		this.desc = description;
	}
	
	public String getDesc() {
		return desc;
	}
}