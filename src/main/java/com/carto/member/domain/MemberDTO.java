package com.carto.member.domain;

import java.util.Date;
import java.util.List;
import lombok.Data;

/**
 * 회원 DTO 클래스
 * @author 원형재
 * @since 2018-11-12
 */
@Data
public class MemberDTO {
	private Integer mno;         // 회원번호
	private MemberStatus mstate; // 회원상태
	private String userid;       // 아이디
	private String userpw;       // 비밀번호
	private String name;         // 회원이름
	private String birth;        // 생년월일
	private String email;        // 이메일
	private String phone;        // 전화번호
	private Gender gender;       // 성별
	private String authno;       // 인증번호
	private Date regDate;        // 가입일자
	private Date pwDate;         // 비밀번호
	private String photo;        // 프로필사진
	private int enabled;         // 사용여부
	private List<AuthDTO> authList; // 회원 권한 리스트
}
