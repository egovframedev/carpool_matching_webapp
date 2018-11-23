package com.carto.carpool.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.PaymentDTO;

@Repository
public class PaymentDAOImpl implements  PaymentDAO {
	@Autowired
	SqlSession sqlsession;
	@Override
	public Integer insertOne(PaymentDTO payDTO) {
		System.out.println("dao on:"+payDTO.getPayno());
		return sqlsession.insert("payment.PayMapper.insertOne",payDTO);
	}
	@Override
	public CarpoolMatchDTO selectOne(int num) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PaymentDTO> selectList() {
		return sqlsession.selectList("payment.PayMapper.selectList");
	}

	@Override
	public Integer removeOne(int num) {
		// TODO Auto-generated method stub
		return null;
	}
}