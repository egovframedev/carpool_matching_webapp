package com.carto.carpool.dao;

import java.util.List;

import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.PaymentDTO;

public interface PaymentDAO {
	public Integer insertOne(PaymentDTO payDTO); // 결제 등록
	public CarpoolMatchDTO selectOne(int num);            // 결제 정보 가져오기
	public List<PaymentDTO> selectList();        // 결제 목록
	public Integer removeOne(int num);           // 결제 삭제
}