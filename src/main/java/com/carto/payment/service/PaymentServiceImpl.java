package com.carto.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carto.payment.dao.PaymentDAO;
import com.carto.payment.domain.PaymentDTO;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentDAO payDAO;
	@Override
	public Integer insertOne(PaymentDTO payDTO) {
		System.out.println("insert service");
		return payDAO.insertOne(payDTO);
		
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
	public List<PaymentDTO> selectList() {
		return payDAO.selectList();
	}

}
