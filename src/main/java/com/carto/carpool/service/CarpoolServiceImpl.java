package com.carto.carpool.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.carto.carpool.dao.CarpoolDAO;
import com.carto.carpool.domain.CPMatchingDTO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolProvideDTO;
import com.carto.carpool.domain.CarpoolRequestDTO;

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
}
