package com.carto.carpool.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.carto.carpool.domain.CarpoolMatchDTO;

@Repository
public class CarpoolMatchDAOImpl implements  CarpoolMatchDAO{
	@Autowired
	SqlSession sqlsession;
	final String namespace="com.carto.mappers.carpoolMapper.";
	
	@Override
	public Integer insertOne(CarpoolMatchDTO cmDTO) {
		System.out.println("dao on:"+cmDTO.getPayno());
		ModelAndView aaa= new ModelAndView();
		return sqlsession.insert(namespace+"insertOne",cmDTO);
	}
	
	@Override
	public Object selectDriver(int num) {
		return sqlsession.selectOne(namespace+"selectDriver",num);
	}
	
	@Override
	public Object selectOne(int num) {
		return null;
	}
	@Override
	public List<CarpoolMatchDTO> selectList() {
		return sqlsession.selectList("payment.PayMapper.selectList");
	}

	@Override
	public Integer removeOne(int num) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Object selectMatInfoByMno(Integer num) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+"selectMatInfo",num);
	}
	@Override
	public Object selectMatInfoByPayno(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+"selectMatInfoByPayno",map);
	}

	@Override
	public Object updateCom(HashMap<String, Object> map) {
		return sqlsession.update(namespace+"updateCom",map);
	}

}
