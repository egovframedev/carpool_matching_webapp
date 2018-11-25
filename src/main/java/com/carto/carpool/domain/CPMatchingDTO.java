package com.carto.carpool.domain;

import java.util.Date;
import lombok.Data;

@Data
public class CPMatchingDTO {
	private Integer matchno;
	private Integer cpno;
	private Date matchDate;
	private Progress progress;
	private Integer mno;
	private String userid;
	private String username;
}