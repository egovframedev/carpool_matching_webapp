package com.carto.carpool.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.carto.carpool.domain.CarpoolMatchDTO;


public interface CarpoolMatchService {
	public Integer insertOne(CarpoolMatchDTO cmDTO);
	public Object SelectOne(int num);
	public Object SelectDriver(int num);
	public Integer RemoveOne(int num);
	public List<CarpoolMatchDTO> selectList();
	public Object selectMatInfo(Integer num);
	public Object selectMatInfoByPayno(String num,int mno);
	public Object updateCom(String num,HttpSession session);
}
