package com.carto.carpool.service;

import java.util.List;

import com.carto.carpool.domain.PaymentDTO;

public interface PaymentService {
	public Integer insertOne(PaymentDTO payDTO);
	public Object SelectOne(int num);
	public Integer RemoveOne(int num);
	public List<PaymentDTO> selectList();
}