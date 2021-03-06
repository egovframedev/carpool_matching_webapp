package com.carto.carpool.service;

import java.util.List;
import java.util.Map;

import com.carto.carpool.domain.CPMatchingDTO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolLogDTO;
import com.carto.carpool.domain.CarpoolProvideDTO;
import com.carto.carpool.domain.CarpoolRequestDTO;
import com.carto.carpool.domain.MyCarpoolDTO;

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
	public List<CarpoolRequestDTO> requestList(CarpoolCriteria cri) throws Exception;
	public List<CarpoolProvideDTO> provideList(CarpoolCriteria cri) throws Exception;
	
	/**
	 * 카풀 내용 보기
	 * @param cpno
	 * @return
	 * @throws Exception
	 */
	public CarpoolDTO detail(Integer cpno, String cpType) throws Exception;
	
	/**
	 * 카풀 매칭 목록
	 * @param cpno
	 * @return
	 * @throws Exception
	 */
	public List<CPMatchingDTO> matchingList(Integer cpno) throws Exception;
	
	/**
	 * 카풀 리스트 갯수
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
	public int registCpMatch(CPMatchingDTO dto) throws Exception;
	
	
	public List<MyCarpoolDTO> getMyCarpoolList(Integer mno) throws Exception;
	
	public int confirmMatching(Integer matchno) throws Exception;
	
	public List<CarpoolLogDTO> cpLogListByPayer(Integer payer) throws Exception;
	public List<CarpoolLogDTO> cpLogListByDriver(Integer driver) throws Exception;
}
