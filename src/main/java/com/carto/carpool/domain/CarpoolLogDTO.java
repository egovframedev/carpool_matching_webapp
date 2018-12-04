package com.carto.carpool.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CarpoolLogDTO {
	private String payno;       // 결제 번호
	private Integer matchno;    // 매칭 번호
	private Integer cpno;       // 카풀 번호
	private Integer riderNo;    // 탑승자 번호
	private String riderName;  // 탑승자 이름
	private Integer driverNo;   // 운전자 번호
	private String driverName; // 운전자 이름
	private int cpnum;          // 탑승인원
	private int amount;         // 결제금액
	private Date payDate;       // 결제일자
	private String startPoint;  // 출발지
	private String endPoint;    //  도착지
	private Date startDatetime; // 출발시간
	private int progress;       // 진행상황(대기 0, 승인 1, 완료 2, 취소 3)
}
