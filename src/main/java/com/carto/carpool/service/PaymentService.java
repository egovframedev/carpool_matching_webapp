package com.carto.carpool.service;

import java.util.List;
import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.PaymentDTO;

public interface PaymentService {
	public int registPay(PaymentDTO payDTO);     // 결제 등록
	public PaymentDTO getPayment(String payno);  // 결제 정보
	public List<PaymentDTO> getPayList();        // 결제 목록
	public int removePay(String payno);          // 결제 삭제
	
	public CarpoolMatchDTO getCPMatch(Integer matchno) throws Exception; // 카풀 매칭 정보
} 