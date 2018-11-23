package com.carto.member.domain;

import java.util.Date;
import lombok.Data;

@Data
public class MemberDTO {
	private long mno;
	private MemberStatus mstate;
	private String userid;
	private String userpw;
	private String name;
	private String birth;
	private String email;
	private String phone;
	private Gender gender;
	private boolean approval_status;
	private String approval_key;
	private Date regdate;
	private Date pwdate;
	private Date logdate;
	private String photo;
	private boolean enabled;
	private String authority;
	
	//비밀번호 확인
	public boolean matchPassword(String userpw) {
        return this.userpw.equals(userpw);
    }

}
