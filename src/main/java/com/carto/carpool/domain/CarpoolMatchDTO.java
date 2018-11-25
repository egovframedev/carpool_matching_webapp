package com.carto.carpool.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.carto.member.domain.MemberDTO;
import lombok.Data;

@Data
public class CarpoolMatchDTO {
	private Integer matchno;
	private Integer mno;
	private Integer cpno;
	private Date matchDate;
	private Progress progress;
	private String payno;
	private boolean driverChk;
	private CarpoolDTO carpool;
	
	public String getMatchDateFmt() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(matchDate);
	}
}
 