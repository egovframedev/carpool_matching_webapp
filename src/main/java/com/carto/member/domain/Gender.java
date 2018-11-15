package com.carto.member.domain;

public enum Gender {
	NONE("모름"), MALE("남성"), FEMALE("여성");
	
	private String desc;
	
	private Gender(String description) {
		this.desc = description;
	}
	
	public String getDesc() {
		return desc;
	}
}
