package com.carto.carpool.domain;

import lombok.Data;

@Data
public class ReviewDTO {
	private Integer rvno;
	private Integer targetNo;
	private Integer writerNo;
	private Integer starPoint;
	private String comment;
}
