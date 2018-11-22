package com.carto.carpool.service;

import java.util.List;

import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.payment.domain.PaymentDTO;


public interface CarpoolMatchService {
	public Integer insertOne(CarpoolMatchDTO cmDTO);
	public Object SelectOne(int num);
	public Object SelectDriver(int num);
	public Integer RemoveOne(int num);
	public List<CarpoolMatchDTO> selectList();
	public Object selectMatInfo(int num);
}
