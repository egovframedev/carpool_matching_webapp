package com.carto.carpool.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
public class PaymentDTO {
	private int amount;
	private String payno;
	private String apply_num;
	private Date pay_date;
	private int driverNo;
	private int matchno;
	private int payerNo;
	/*public Date getPay_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date= new Date(pay_date);
		sdf.format(date);
		return date;
	}*/
}
