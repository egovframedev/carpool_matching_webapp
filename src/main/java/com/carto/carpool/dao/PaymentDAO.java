package com.carto.carpool.dao;

import java.util.List;
import java.util.Map;

import com.carto.carpool.domain.PaymentDTO;
import com.carto.carpool.domain.ReviewDTO;

public interface PaymentDAO {
	public int insertPayment(PaymentDTO dto);       // 결제 정보 등록
	public PaymentDTO selectPayment(String payno);  // 결제 정보 가져오기
	public List<PaymentDTO> selectPayList();        // 결제 정보 리스트
	public int deletePayment(String payno);         // 결제 정보 삭제
	public void updateProgress(Map<String, Object> paramMap); // 결제 정보 업로드
	
	public int insertReview(ReviewDTO dto);         // 리뷰 입력
}