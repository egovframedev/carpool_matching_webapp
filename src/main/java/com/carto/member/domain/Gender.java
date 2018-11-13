package com.carto.member.domain;

public enum Gender {
	MALE(1), FEMALE(2);
	
	private int number;
	
	private Gender(int number) {
		this.number = number;
	}
	
	public int number() {
		return number;
	}
}
