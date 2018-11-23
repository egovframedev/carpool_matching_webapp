package com.carto.carpool.dao;

import java.util.List;

import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;

public interface CarpoolDAO {
	/**
	 * 카풀 등록
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int insertCarpool(CarpoolDTO dto) throws Exception;
	
	/**
	 * 카풀 목록
	 * @return
	 * @throws Exception
	 */
	public List<CarpoolDTO> getList(CarpoolCriteria cri) throws Exception;
}
