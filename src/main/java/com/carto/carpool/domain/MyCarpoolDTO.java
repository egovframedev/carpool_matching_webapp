package com.carto.carpool.domain;

import com.carto.member.domain.DriverDTO;
import lombok.Data;

@Data
public class MyCarpoolDTO {
	private CarpoolMatchDTO cpMatch;
	private DriverDTO driver;
}
