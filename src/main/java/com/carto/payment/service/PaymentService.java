package com.carto.payment.service;

import java.util.List;

import com.carto.payment.domain.PaymentDTO;


public interface PaymentService {
	public Integer insertOne(PaymentDTO payDTO);
	public Object SelectOne(int num);
	public Integer RemoveOne(int num);
	public List<PaymentDTO> selectList();
}
