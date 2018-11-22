package com.carto.carpool.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CarpoolInfoDTO {
	Integer cpno;
	String start_point;
	String end_point;
	String start_loc;
	String end_loc;
	byte seat_num;
	int charge;
	byte seat_opt;
	byte drive_opt;
	byte trunk_use;
	byte smoke_use;
	String req_msg;
	int mno;
	Date reg_date;
}
