package com.carto.carpool.domain;

import java.util.Date;
import lombok.Data;

@Data
public class CarpoolDTO {
	public static final int REQUEST = 1;
	public static final int PROVIDE = 2;
	private Integer cpno;         // 카풀번호
	private int cptype;           // 카풀구분 요청 1, 제공 2
	private String startPoint;    // 출발지 주소
	private String startLong;     // 출발지 경도
	private String startLat;      // 출발지 위도
	private String endPoint;      // 도착지 주소
	private String endLong;       // 도착지 경도
	private String endLat;        // 도착지 위도
	private Date startDateTime;   // 출발 일자/시간
	
	private int mno;              // 작성자 회원번호
	private Date regDate;         // 작성일자
		
	private int charge;           // 금액
	private int seatNum;          // 카풀 인원
	
	private int seatOpt;          // 자리설정 (운전자와 함께 앞자리, 편안한 뒷자리)
	private int driveOpt;         // 운행조건 (대화형 카풀, 조용한 카풀,  음악들으면 카풀, 정주행)
	private boolean trunkUse;     // 트렁크사용여부 
	private boolean smokeUse;     // 비흡연/ 흡연	
	private String reqMsg;        // 요구사항
} 
