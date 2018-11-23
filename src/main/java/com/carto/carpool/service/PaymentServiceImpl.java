package com.carto.carpool.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.carto.carpool.dao.PaymentDAO;
import com.carto.carpool.domain.PaymentDTO;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentDAO payDAO;
	
	// 결제 등록
	@Override
	public Integer insertOne(PaymentDTO payDTO) {
		System.out.println("insert service");
		return payDAO.insertOne(payDTO);
		
	}

	// 결제 정보 보기
	@Override
	public Object SelectOne(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	// 결제 삭제
	@Override
	public Integer RemoveOne(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	// 결제 내역 목록
	@Override
	public List<PaymentDTO> selectList() {
		return payDAO.selectList();
	}
 
	
}