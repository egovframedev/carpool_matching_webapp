package com.carto.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.board.domain.AttachfileDTO;
import com.carto.member.domain.DriverDTO;
import com.carto.member.domain.LoginDTO;
import com.carto.member.domain.MemberDTO;

@Repository
public class DriverDAO {
	private final String NAMESPACE = "com.carto.mappers.DriverMapper";

	@Autowired
	SqlSession sqlsession = null;


	public int insertDriver(DriverDTO dto) {
		return sqlsession.insert(NAMESPACE + ".insertDriver", dto);
	}

	// 드라이버 등록 서류 확인
	public int UpdateDriverVerti(DriverDTO dto) {
		return sqlsession.update(NAMESPACE + ".updateDriverVertify", dto);
	}

	public DriverDTO getDriver(int mno) {
		return sqlsession.selectOne(NAMESPACE + ".getDriver", mno);
	}
	public int UpdateDriver(DriverDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.update(NAMESPACE + ".updateDriver", dto);
	}
	public List<DriverDTO> getAttach(Integer mno) throws Exception {
		return sqlsession.selectList(NAMESPACE + ".getAttach", mno);
	}
	
	public int updateRole(String userid) {
		return sqlsession.update(NAMESPACE+".updateRole",userid);
	}

}
