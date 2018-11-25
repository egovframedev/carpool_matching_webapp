package com.carto.carpool.service;

import java.util.List;

import com.carto.carpool.domain.CPMatchingDTO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolInfoDTO;

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
	public List<CarpoolInfoDTO> list(CarpoolCriteria cri) throws Exception;
	
	/**
	 * 카풀 내용 보기
	 * @param cpno
	 * @return
	 * @throws Exception
	 */
	public CarpoolInfoDTO detail(Integer cpno) throws Exception;
	
	/**
	 * 카풀 매칭 목록
	 * @param cpno
	 * @return
	 * @throws Exception
	 */
	public List<CPMatchingDTO> matchingList(Integer cpno) throws Exception;
}
