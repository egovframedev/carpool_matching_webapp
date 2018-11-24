package com.carto.carpool.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.member.domain.MemberDTO;

import lombok.extern.log4j.Log4j;

import com.carto.carpool.dao.CarpoolMatchDAO;
@Log4j
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
	public Object selectMatInfoByPayno(String num, int mno) {
		HashMap<String, Object> map = new HashMap();
		map.put("mno", Integer.valueOf(mno));
		map.put("payno", num);
		return cmDAO.selectMatInfoByPayno(map);
	}

	@Override
	public Object updateCom(String num,HttpSession session) {
		HashMap<String,Object> map = new HashMap();
		MemberDTO member= (MemberDTO)session.getAttribute("login");
		log.info("updateCOM.member:"+member.toString());
		map.put("progress",2);
		map.put("payno",num);
		map.put("mno",member.getMno());
		return cmDAO.updateCom(map);
	}

}