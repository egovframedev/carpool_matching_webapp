package com.carto.carpool.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.carto.carpool.domain.CPMatchingDTO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.CarpoolProvideDTO;
import com.carto.carpool.domain.CarpoolRequestDTO;
import com.carto.member.domain.DriverDTO;

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
	public List<CarpoolRequestDTO> getRequestList(CarpoolCriteria cri) throws Exception {
		return session.selectList(NAMESPACE + ".getRequestList", cri);
	}

	@Override
	public List<CarpoolProvideDTO> getProvideList(CarpoolCriteria cri) throws Exception {
		return session.selectList(NAMESPACE + ".getProvideList", cri);
	}
	
	// 카풀 정보
	@Override
	public CarpoolRequestDTO getCarpool(Integer cpno) throws Exception {
		return session.selectOne(NAMESPACE + ".getCarpool", cpno);
	}
	
	// 카풀 제공 정보
	@Override
	public CarpoolProvideDTO getCarpoolPrivide(Integer cpno) throws Exception {
		return session.selectOne(NAMESPACE + ".getCarpoolPrivide", cpno);
	}
	
	@Override
	public List<CPMatchingDTO> getMatchingList(Integer cpno) throws Exception {
		return session.selectList(NAMESPACE + ".getMatchingList", cpno);
	}
	
	@Override
	public List<CarpoolMatchDTO> getMatchToCarpoolListByMno(Integer mno) throws Exception {
		return session.selectList(NAMESPACE + ".getMatchToCarpoolListByMno", mno);
	}
	
	@Override
	public List<CarpoolMatchDTO> getCarpoolToMatchListByMno(Integer mno) throws Exception {
		return session.selectList(NAMESPACE + ".getCarpoolToMatchListByMno", mno);
	}
	
	
	// 카풀 갯수
	@Override
	public int countList(CarpoolCriteria cri) throws Exception {
		return session.selectOne(NAMESPACE + ".countList", cri);
	}

	// 카풀 동승 제의 저장
	@Override
	public int insertMatching(CPMatchingDTO dto) throws Exception {
		return session.insert(NAMESPACE + ".insertMatching", dto);
	}

	@Override
	public DriverDTO getDriver(Integer mno) throws Exception {
		return session.selectOne(NAMESPACE + ".getDriver", mno);
	}

	@Override
	public void confirmMatching(Integer matchno) throws Exception {
		session.update(NAMESPACE + ".confirmMatching", matchno);
	}

	@Override
	public void deleteMatching(Integer matchno) throws Exception {
		session.update(NAMESPACE + ".deleteMatching", matchno);
	}

}
