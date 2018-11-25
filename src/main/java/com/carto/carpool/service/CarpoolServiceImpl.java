package com.carto.carpool.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.carto.carpool.dao.CarpoolDAO;
import com.carto.carpool.domain.CPMatchingDTO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolInfoDTO;

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
	public List<CarpoolInfoDTO> list(CarpoolCriteria cri) throws Exception {
		return carpoolDAO.getList(cri);
	}

	// 카풀 내용 서비스
	@Override
	public CarpoolInfoDTO detail(Integer cpno) throws Exception {
		return carpoolDAO.getCarpool(cpno);
	}

	// 카풀 매칭 목록 서비스
	@Override
	public List<CPMatchingDTO> matchingList(Integer cpno) throws Exception {
		return carpoolDAO.getMatchingList(cpno);
	}
}
