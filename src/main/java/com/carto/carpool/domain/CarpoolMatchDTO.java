package com.carto.carpool.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class CarpoolMatchDTO {
	private Integer matchno;
	private Integer mno;
	private Integer cpno;
	private Date match_date;
	private Progress progress;
	private String payno;
	private byte isdriver;
	private CarpoolInfoDTO cp_infoDTO;

}
