package com.carto.carpool.dao;

import java.util.List;

import com.carto.carpool.domain.CPMatchingDTO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolProvideDTO;
import com.carto.carpool.domain.CarpoolRequestDTO;

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
	public List<CarpoolRequestDTO> getRequestList(CarpoolCriteria cri) throws Exception;
	public List<CarpoolProvideDTO> getProvideList(CarpoolCriteria cri) throws Exception;
	
	/**
	 * 카풀 상세 정보
	 * @param cpno
	 * @return
	 * @throws Exception
	 */
	public CarpoolRequestDTO getCarpool(Integer cpno) throws Exception; // 카풀 요청
	public CarpoolProvideDTO getCarpoolPrivide(Integer cpno) throws Exception; // 카풀 제공
	
	/**
	 * 동승 제의 목록
	 * @param cpno
	 * @return
	 * @throws Exception
	 */
	public List<CPMatchingDTO> getMatchingList(Integer cpno) throws Exception;
	
	/**
	 * 리스트 카운트
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public int countList(CarpoolCriteria cri) throws Exception;
	
	/**
	 * 동승 제의 등록
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int insertMatching(CPMatchingDTO dto) throws Exception;
	
}
