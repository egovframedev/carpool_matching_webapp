package com.carto.member.domain;

public enum Gender {
	NONE, MALE, FEMALE;
	
	public String getString() {
		return this.name();
	}
}
