package com.carto.carpool.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carto.carpool.dao.CarpoolDAO;
import com.carto.carpool.domain.CPMatchingDTO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.CarpoolProvideDTO;
import com.carto.carpool.domain.CarpoolRequestDTO;
import com.carto.carpool.domain.MyCarpoolDTO;
import com.carto.member.domain.DriverDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CarpoolServiceImpl implements CarpoolService {

	@Autowired
	CarpoolDAO carpoolDAO;
	
	// 카풀 등록 서비스
	@Override
	public int regist(CarpoolDTO dto) throws Exception {
		return carpoolDAO.insertCarpool(dto);
	}

	// 카풀 목록 서비스
	@Override
	public List<CarpoolRequestDTO> requestList(CarpoolCriteria cri) throws Exception {
		return carpoolDAO.getRequestList(cri);
	}
	
	// 카풀 제공 목록 서비스
	@Override
	public List<CarpoolProvideDTO> provideList(CarpoolCriteria cri) throws Exception {
		return  carpoolDAO.getProvideList(cri);
	}

	// 카풀 내용 서비스
	@Override
	public CarpoolDTO detail(Integer cpno, String cpType) throws Exception {
		if(cpType.equals("provide")) {
			return carpoolDAO.getCarpoolPrivide(cpno);
		} else {
			return carpoolDAO.getCarpool(cpno);			
		}
	}

	// 카풀 매칭 목록 서비스
	@Override
	public List<CPMatchingDTO> matchingList(Integer cpno) throws Exception {
		return carpoolDAO.getMatchingList(cpno);
	}
	
	// 카풀 목록 갯수
	@Override
	public int countList(CarpoolCriteria cri) throws Exception {
		return carpoolDAO.countList(cri);
	}

	@Override
	public int registCpMatch(CPMatchingDTO dto) throws Exception {
		return carpoolDAO.insertMatching(dto);
	}

	@Transactional
	@Override
	public List<MyCarpoolDTO> getMyCarpoolList(Integer mno) throws Exception {
		List<MyCarpoolDTO> resList = new ArrayList<>();
		List<CarpoolMatchDTO> list1 = carpoolDAO.getMatchToCarpoolListByMno(mno);
		for(CarpoolMatchDTO dto: list1) {
			log.info(dto);
			MyCarpoolDTO myCarpool = new MyCarpoolDTO();
			// 운전자 정보 가져오기
			DriverDTO driver = null;
			if(dto.getCarpool().getCptype() == 2) { // 카풀 타입이 카풀 제공(2)이면 카풀의 mno가 드라이버임
 				driver = carpoolDAO.getDriver(dto.getCarpool().getMno());
			} else if(dto.isDriverChk()) { // 카풀 매칭에 isDriver 가 true 이면 매칭의 mno가 드라이버임
				driver = carpoolDAO.getDriver(dto.getMno());
			}
			myCarpool.setCpMatch(dto);
			myCarpool.setDriver(driver);
			resList.add(myCarpool);
		}
		
		List<CarpoolMatchDTO> list2 = carpoolDAO.getCarpoolToMatchListByMno(mno);
		for(CarpoolMatchDTO dto: list2) {
			MyCarpoolDTO myCarpool = new MyCarpoolDTO();
			// 운전자 정보 가져오기
			DriverDTO driver = null;
			if(dto.getCarpool().getCptype() == 2) { // 카풀 타입이 카풀 제공(2)이면 카풀의 mno가 드라이버임
 				driver = carpoolDAO.getDriver(dto.getCarpool().getMno());
			} else if(dto.isDriverChk()) { // 카풀 매칭에 isDriver 가 true 이면 매칭의 mno가 드라이버임
				driver = carpoolDAO.getDriver(dto.getMno());
			}
			myCarpool.setCpMatch(dto);
			myCarpool.setDriver(driver);
			resList.add(myCarpool);
		}
		
		return resList;
	}

	@Override
	public int confirmMatching(Integer matchno) throws Exception {
		return carpoolDAO.confirmMatching(matchno);
	}

}
