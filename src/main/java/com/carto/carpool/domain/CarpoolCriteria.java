package com.carto.carpool.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import lombok.Data;
import lombok.ToString;

@Data
public class CarpoolCriteria {
	private int page;
	private int perPageNum;
	private int carpoolType;
	private String searchStart;
	private String searchEnd;
	private String searchDate;
	
	public CarpoolCriteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
		
	public Date getStartDateTime() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd - a KK:mm");
		if(searchDate.isEmpty()) return null;
		String sDate = searchDate;  
		return sdf.parse(sDate);
	}
}