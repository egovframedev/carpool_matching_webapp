package com.carto.member.domain;

// 회원 구분
public enum MemberType {
	RIDER(1), DRIVER(2), ADMIN(9);
	private int typeNum;
	
	private MemberType(int typeNum) {
		this.typeNum = typeNum;
	}
	
	public int typeNum() {
		return typeNum;
	}
}
