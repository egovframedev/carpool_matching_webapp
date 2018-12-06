package com.carto.member.util;

import lombok.Data;

@Data
public class RegisterRequest {
	
	private String name;
	private String userid;
	private String userpw;
	private String pw2;
	private String checkPw;
	private String email;
	private String phone;
	private String gender;
}
