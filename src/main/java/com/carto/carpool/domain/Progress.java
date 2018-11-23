package com.carto.carpool.domain;

public enum Progress {
	WAIT("대기"), CONFIRM("수락"), COMPLETE("완료"), CANCLE("취소");
	
	private String status;
	
	private Progress(String status) {
		this.status = status;
	}
	
	public String getStatus() {
		return this.status;
	}
}