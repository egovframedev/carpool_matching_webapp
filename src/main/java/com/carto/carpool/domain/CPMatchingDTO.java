package com.carto.carpool.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class CPMatchingDTO {
	private Integer matchno;
	private Integer cpno;
	private Date matchDate;
	private Progress progress;
	private boolean driverChk;
	private int cpnum;
	private int charge;
	private int paysum;
	private Integer mno;
	private String userid;
	private String username;
	
	public void calcPaysum() {
		paysum = charge * cpnum; 
	}
	
	public String getMatchDateStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a KK:mm");
		return sdf.format(matchDate);
	}
}