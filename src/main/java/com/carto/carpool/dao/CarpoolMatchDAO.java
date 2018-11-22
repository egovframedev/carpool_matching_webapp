package com.carto.carpool.dao;

import java.util.ArrayList;
import java.util.List;

import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.payment.domain.PaymentDTO;

public interface CarpoolMatchDAO {
	public Integer insertOne(CarpoolMatchDTO cmDTO);
	public Object selectOne(int num);
	public Object selectDriver(int num);
	public List<CarpoolMatchDTO> selectList();
	public Integer removeOne(int num);
	public Object selectMatInfo(int num);
}
