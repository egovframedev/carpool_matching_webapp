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
	
	// 결제 정보 등록
	@Override
	public int registPay(PaymentDTO payDTO) {
		return payDAO.insertPayment(payDTO);
	}

	// 결제 정보 조회
	@Override
	public PaymentDTO getPayment(String payno) {
		return payDAO.selectPayment(payno);
	}

	// 결제 정보 리스트
	@Override
	public List<PaymentDTO> getPayList() {
		return payDAO.selectPayList();
	}

	// 결제 정보 삭제
	@Override
	public int removePay(String payno) {
		return payDAO.deletePayment(payno);
	}
 
	
}