package com.carto.address.domain;

import lombok.Data;

@Data
public class AddressDTO {
	
	private long mno;
	private int addr_no;
	private String addr_name;
	private AddressType addr_type;
	private String address1;
	private String address2;
	private String address3;
	private String location_x;
	private String location_y;
	
	
}
