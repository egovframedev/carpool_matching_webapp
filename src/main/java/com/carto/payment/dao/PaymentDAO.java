package com.carto.payment.dao;

import java.util.ArrayList;
import java.util.List;

import com.carto.payment.domain.PaymentDTO;

public interface PaymentDAO {
	public Integer insertOne(PaymentDTO payDTO);
	public Object selectOne(int num);
	public List<PaymentDTO> selectList();
	public Integer removeOne(int num);
}
