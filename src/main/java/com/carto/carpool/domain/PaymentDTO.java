package com.carto.carpool.domain;

import java.util.Date;
import lombok.Data;

@Data
public class PaymentDTO {
	private String payno;     // 결제 번호
	private String apply_num; // 결제 인증 번호
	private Date pay_date;    // 결제 일자
	private int amount;       // 결제 금액
	private int matchno;      // 카풀매칭번호
	private int payerNo;      // 결제자 회원 번호
	private int driverNo;     // 운전자 회원 번호
	
	/*
	public Date getPay_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date= new Date(pay_date);
		sdf.format(date);
		return date;
	}
	*/
}
