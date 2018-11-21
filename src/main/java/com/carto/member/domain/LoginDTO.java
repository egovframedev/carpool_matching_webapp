package com.carto.member.domain;

import lombok.Data;

@Data
public class LoginDTO {
	private String userid;
	private String userpw;
	private boolean useCookie;
}
