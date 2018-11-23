package com.carto.carpool.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carto.carpool.dao.CarpoolDAO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;

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
	public List<CarpoolDTO> list(CarpoolCriteria cri) throws Exception {
		return carpoolDAO.getList(cri);
	}

	
}
