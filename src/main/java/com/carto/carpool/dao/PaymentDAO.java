package com.carto.carpool.dao;

import java.util.List;
import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.PaymentDTO;

public interface PaymentDAO {
	public int insertPayment(PaymentDTO dto);       // 결제 정보 등록
	public PaymentDTO selectPayment(String payno);  // 결제 정보 가져오기
	public List<PaymentDTO> selectPayList();        // 결제 정보 리스트
	public int deletePayment(String payno);         // 결제 정보 삭제
	
	public CarpoolMatchDTO selectOne(int num);    // 결제 정보 가져오기
	
}