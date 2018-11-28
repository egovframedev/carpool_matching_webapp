package com.carto.carpool.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class CarpoolMatchDTO {
	private Integer matchno;   // 카풀매칭번호
	private Integer mno;       // 동승제의자 회원 번호
	private Integer cpno;      // 카풀 번호
	private Date matchDate;    // 매칭 날짜
	private Progress progress; // 진행 상태
	private String payno;      // 결제 번호
	private boolean driverChk; // 드라이버 체크
	private int cpnum;         // 동승인원
	private int paysum;        // 결제금액
	
	private CarpoolDTO carpool; // 카풀정보
	
	public String getMatchDateFmt() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(matchDate);
	}
}
 