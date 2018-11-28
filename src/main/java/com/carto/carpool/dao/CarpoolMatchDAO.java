package com.carto.carpool.dao;

import java.util.HashMap;
import java.util.List;
import com.carto.carpool.domain.CarpoolMatchDTO;

public interface CarpoolMatchDAO {
	public Integer insertOne(CarpoolMatchDTO cmDTO);
	public Object selectOne(int num);
	public Object selectDriver(int num);
	public List<CarpoolMatchDTO> selectList();
	public Integer removeOne(int num);
	public Object selectMatInfoByMno(Integer num);
	public Object selectMatInfoByMatchNo(Integer matchno);
	public Object selectMatInfoByPayno(HashMap<String, Object> map);
	public Object updateCom(HashMap<String, Object> map);
}
 