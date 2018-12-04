package com.carto.carpool.dao;

import java.util.List;

import com.carto.carpool.domain.CPMatchingDTO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolLogDTO;
import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.CarpoolProvideDTO;
import com.carto.carpool.domain.CarpoolRequestDTO;
import com.carto.member.domain.DriverDTO;

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
	// 사용자에 따른 매칭 정보 -> 카풀 정보
	public List<CarpoolMatchDTO> getMatchToCarpoolListByMno(Integer mno) throws Exception;
	// 사용자에 따른 카풀 정보 -> 매칭 정보
	public List<CarpoolMatchDTO> getCarpoolToMatchListByMno(Integer mno) throws Exception;
	
	/**
	 * 리스트 카운트
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public int countList(CarpoolCriteria cri) throws Exception;
	
	public int insertMatching(CPMatchingDTO dto) throws Exception;
	
	/**
	 * 드라이버 정보 가져오기
	 * @param mno
	 * @return
	 * @throws Exception
	 */
	public DriverDTO getDriver(Integer mno) throws Exception;
	
	/**
	 * 카풀 매칭 수락 처리
	 * @param matchno
	 * @throws Exception
	 */
	public int confirmMatching(Integer matchno) throws Exception;
	
	/**
	 * 카풀 매칭 삭제 처리
	 * @param matchno
	 * @throws Exception
	 */
	public void deleteMatching(Integer matchno) throws Exception;
	
	/**
	 * 카풀 매칭 가져오기
	 * @param matchno
	 * @return
	 * @throws Exception
	 */
	public CarpoolMatchDTO getCPMatch(Integer matchno) throws Exception;
	
	/**
	 * 카풀 내역 가져오기
	 * @param payer
	 * @return
	 * @throws Exception
	 */
	public List<CarpoolLogDTO> getCPLogListByPayer(Integer payer) throws Exception;
	public List<CarpoolLogDTO> getCPLogListByDriver(Integer driver) throws Exception;
}
