package com.carto.carpool.domain;

import java.util.List;
import com.carto.member.domain.MemberDTO;
import lombok.Data;

@Data
public class MyDrivingDTO {
	private CarpoolMatchDTO cpMatch;
	private List<MemberDTO> riderList;
}
