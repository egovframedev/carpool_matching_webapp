package com.carto.carpool.domain;

import java.io.Serializable;
import com.carto.member.domain.MemberDTO;
import lombok.Data;

@Data
public class CarpoolRequestDTO extends CarpoolDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	private MemberDTO user;
}
