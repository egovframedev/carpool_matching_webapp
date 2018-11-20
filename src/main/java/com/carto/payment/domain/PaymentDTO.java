package com.carto.payment.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;


import lombok.Data;

@Data
@Alias("PaymentDTO")
public class PaymentDTO {
	private int amount;
	private String payno;
	private String apply_num;
	private Date pay_date;
}
