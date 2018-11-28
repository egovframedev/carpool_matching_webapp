package com.carto.admin.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("payHistory")
public class PayHistory {

	private Integer mno;
	private String dname;
	private String rname;
	private Integer cpno; // 카풀번호
	private String start_point; // 출발지 주소
	private String end_point; // 도착지 주소
	private String start_datetime; // 출발 일자/시간
	private int amount; // 금액
	private int seat_num; // 카풀 인원
	private Integer matchno;
	private Integer progress; // 진행상황(대기 0, 승인 1, 완료 2, 취소 3)
	private String payno; // 결제번호
	private String pay_date; // 결제날짜
	//private boolean driverChk; // 드라이버 체크(드라이버1, 동승자0)
	private int isdriver;

}
