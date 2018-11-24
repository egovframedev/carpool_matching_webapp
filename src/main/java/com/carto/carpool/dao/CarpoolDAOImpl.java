package com.carto.carpool.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolInfoDTO;

@Repository
public class CarpoolDAOImpl implements CarpoolDAO {
	private final String NAMESPACE = "com.carto.mappers.CarpoolMapper";
	
	@Autowired
	private SqlSession session;
	
	// 카풀 등록
	@Override
	public int insertCarpool(CarpoolDTO dto) throws Exception {
		return session.insert(NAMESPACE + ".insertCarpool", dto);
	}

	@Override
	public List<CarpoolInfoDTO> getList(CarpoolCriteria cri) throws Exception {
		return session.selectList(NAMESPACE + ".getList", cri);
	}

}
