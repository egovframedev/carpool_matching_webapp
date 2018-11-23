package com.carto.carpool.service;

import java.util.List;

import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;

public interface CarpoolService {
	/**
	 * 카풀 등록
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int regist(CarpoolDTO dto) throws Exception;
	
	/**
	 * 카풀 목록
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public List<CarpoolDTO> list(CarpoolCriteria cri) throws Exception;
}
