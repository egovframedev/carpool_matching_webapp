package com.carto.member.domain;

import java.util.Date;

import lombok.Data;

/**
 * 회원 DTO 클래스
 * @author 원형재
 * @since 2018-11-12
 */
@Data
public class MemberDTO {
	private Integer mno;
	private MemberType mtype;
	// private MemberStatus mstate;
	private String name;
	private String id;
	private String pw;
	private String birth;
	private String email;
	private String tel;
	private Gender gender;
	private String cardco;
	private String cardno;
	private String validity;
	private int authchk;
	private String authno;
	private Date reg_date;
	private Date login_date;
	private Date pw_date;
	private String photo;
	
}
