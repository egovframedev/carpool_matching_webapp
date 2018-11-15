package com.carto.member.domain;

import lombok.Data;

/**
 * 회원 권한 DTO 클래스
 * @author CodingBear
 * @since 2018.11.14
 */
@Data
public class AuthDTO {
	private String userid;
	private String authority;
}
