package com.carto.carpool.dao;

import java.util.List;

import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolInfoDTO;

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
	public List<CarpoolInfoDTO> getList(CarpoolCriteria cri) throws Exception;
}
