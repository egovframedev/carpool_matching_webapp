package com.carto.carpool.domain;

import java.io.Serializable;

import com.carto.member.domain.MemberDTO;
import lombok.Data;

// 카풀 제공 정보 DTO 클래스
@Data
public class CarpoolProvideDTO extends CarpoolDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	private MemberDTO user;
}
