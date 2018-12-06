package com.carto.carpool.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carto.carpool.dao.CarpoolDAO;
import com.carto.carpool.dao.PaymentDAO;
import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.PaymentDTO;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentDAO payDAO;
	
	@Autowired
	CarpoolDAO carpoolDAO;
	
	// 결제 정보 등록
	@Transactional
	@Override
	public int registPay(PaymentDTO payDTO) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("payno", payDTO.getPayerNo());
		paramMap.put("matchno", payDTO.getMatchno());
		payDAO.updateProgress(paramMap);
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

	// 카풀 매칭 정보 조회
	@Override
	public CarpoolMatchDTO getCPMatch(Integer matchno) throws Exception {
		log.info("getCPMatch().....호출");
		return carpoolDAO.getCPMatch(matchno);
	}
}