package com.carto.carpool.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.PaymentDTO;
import com.carto.carpool.domain.ReviewDTO;

@Repository
public class PaymentDAOImpl implements  PaymentDAO {
	private final String NAMESAPCE  = "com.carto.mappers.PayMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	// 결제 등록 하기
	@Override
	public int insertPayment(PaymentDTO dto) {
		return sqlsession.insert(NAMESAPCE + ".insertPayment", dto);
	}
	
	// 결제정보 가져오기
	@Override
	public PaymentDTO selectPayment(String payno) {
		return sqlsession.selectOne(NAMESAPCE + ".selectPayment", payno);
	}
	
	// 결제 리스트 가져오기
	@Override
	public List<PaymentDTO> selectPayList() {
		return sqlsession.selectList(NAMESAPCE + ".selectPayList");
	}
	
	// 결제 정보 삭제
	@Override
	public int deletePayment(String payno) {
		return sqlsession.delete(NAMESAPCE + ".deletePayment", payno);
	}

	@Override
	public int insertReview(ReviewDTO dto) {
		return sqlsession.insert(NAMESAPCE + ".insertReview", dto);
	}		
}