package com.carto.carpool.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.dao.CarpoolMatchDAO;

@Service
public class CarpoolMatchServiceImpl implements CarpoolMatchService {
	
	@Autowired
	CarpoolMatchDAO cmDAO;
	@Override
	public Integer insertOne(CarpoolMatchDTO cmDTO) {
		System.out.println("insert service");
		return cmDAO.insertOne(cmDTO);
		
	}

	@Override
	public Object SelectOne(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer RemoveOne(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CarpoolMatchDTO> selectList() {
		return cmDAO.selectList();
	}

	@Override
	public Object SelectDriver(int num) {
		// TODO Auto-generated method stub
		return cmDAO.selectDriver(num);
	}

	@Override
	public Object selectMatInfo(Integer num) {
		// TODO Auto-generated method stub
		return cmDAO.selectMatInfoByMno(num);
	}

	@Override
	public Object selectMatInfoByPayno(String num) {
		// TODO Auto-generated method stub
		return cmDAO.selectMatInfoByPayno(num);
	}

}
