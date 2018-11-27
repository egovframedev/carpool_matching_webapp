package com.carto.member.domain;

import lombok.Data;

@Data
public class DriverDTO {
	private Integer mno;              // 회원 번호
	private String license_no;        // 운전면허번호
	private String car_no;            // 차량 번호
	private String car_prod;          // 차량 제조사
	private String car_model;         // 차량 모델명
	private String car_color;         // 차량 색상
	private String car_year;          // 차량 연식
	private String insurance;         // 보험 종류
	private String license_photo;     // 운전면허증
	private boolean license_chk;      // 운전면허증
	private String insurance_photo;   // 보험증서
	private boolean insurance_chk;    // 보험증서 체크
	private String car_photo;         // 차량 사진
	private boolean car_photo_chk;    // 차량 사진 체크
	private String carReg_photo;      // 차량 등록증 
	private boolean carReg_photo_chk; // 차량 등록증 체크
	private String post_date;         // 승인날짜 
	private int post_state;           // 승인상태
}
