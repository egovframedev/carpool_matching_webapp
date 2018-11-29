package com.carto.address.domain;

public enum AddressType {
	  HOME("집", 1)
	, OFFICE("회사", 1)
	, FAVORITES("즐겨찾기", 3);
	
	private String type;
	private int count;
	
	private AddressType(String type, int count) {
		this.type = type;
		this.count = count;
	}
	public String getType() {
		return type;
	}
	
	public int getCount() {
		return count;
	}
}
