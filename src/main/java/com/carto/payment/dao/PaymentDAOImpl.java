package com.carto.payment.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carto.payment.domain.PaymentDTO;
@Service
public class PaymentDAOImpl implements  PaymentDAO{
	@Autowired
	SqlSession sqlsession;
	@Override
	public Integer insertOne(PaymentDTO payDTO) {
		System.out.println("dao on:"+payDTO.getPayno());
		return sqlsession.insert("payment.PayMapper.insertOne",payDTO);
	}
	@Override
	public Object selectOne(int num) {
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
