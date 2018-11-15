package com.carto.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.member.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	private final String namespace = "com.carto.mappers.MemberMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public MemberDTO read(MemberDTO dto) {
		return session.selectOne(namespace + ".read", dto);
	}

	@Override
	public MemberDTO readById(String userid) {
//		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("userid", userid);		
		return session.selectOne(namespace + ".readById", userid);
	}

}
