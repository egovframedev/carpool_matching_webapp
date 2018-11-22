package com.carto.carpool.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Cp_joinVO {
	private Integer cpno;
	private String start_point;
	private String end_point;
	private String start_loc;
	private String end_loc;
	private byte seat_num;
	private int charge;
	private byte seat_opt;
	private byte drive_opt;
	private byte trunk_use;
	private byte smoke_use;
	private String req_msg;
	private int mno;
	private Date reg_date;
	private Integer matchno;
	private String match_date;
	private Progress progress;
	private String payno;
	private byte isdriver;
}
