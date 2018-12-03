package com.carto.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.member.domain.DriverDTO;
import com.carto.member.domain.LoginDTO;
import com.carto.member.domain.MemberDTO;

@Repository
public class MemberDAO {
	private final String NAMESPACE = "com.carto.mappers.MemberMapper";

	@Autowired
	SqlSession sqlsession = null;

	// 아이디 중복 검사
	public int check_id(String userid) throws Exception {
		return sqlsession.selectOne(NAMESPACE + ".check_id", userid);
	}

	// 이메일 중복 검사
	public int check_email(String email) throws Exception {
		return sqlsession.selectOne(NAMESPACE + ".check_email", email);
	}

	// 회원가입
	public int join_member(MemberDTO member) throws Exception {
		return sqlsession.insert(NAMESPACE + ".join_member", member);
	}

	public void insertRole(String userid, String authority) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userid", userid);
		paramMap.put("authority", authority);
		sqlsession.insert(NAMESPACE + ".insertRole", paramMap);
	}

	// 이메일 인증
	public int approval_member(MemberDTO member) throws Exception {
		return sqlsession.update(NAMESPACE + ".approval_member", member);
	}

	// 로그인 접속일자 변경
	public int update_log(String userid) throws Exception {
		return sqlsession.update(NAMESPACE + ".update_log", userid);
	}

	// 로그인 체크
	public MemberDTO login(LoginDTO loginDTO) throws Exception {
		return sqlsession.selectOne(NAMESPACE + ".login", loginDTO);
	}

	// 로그인 유지
	public void keepLogin(String userid, String sessionId, Date next) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userid", userid);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		sqlsession.update(NAMESPACE + ".keepLogin", paramMap);
	}

	// 로그인 세션키 체크
	public MemberDTO checkUserWithSessionKey(String value) {
		return sqlsession.selectOne(NAMESPACE + ".checkUserWithSessionKey", value);
	}

	// 회원 로그인 정보
	public MemberDTO viewMember(MemberDTO memberdto) {
		return sqlsession.selectOne(NAMESPACE + ".viewMember", memberdto);
	}

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

	// 회원 정보 가져오기
	public MemberDTO selectMember(String userid) {
		return sqlsession.selectOne(NAMESPACE + ".selectMember", userid);
	}

	public MemberDTO getMember(int mno) {
		return sqlsession.selectOne(NAMESPACE + ".getMember", mno);
	}

	public int UpdateDriver(DriverDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.update(NAMESPACE + ".updateDriver", dto);
	}

	// 회원 아이디 찾기
	public String findId(MemberDTO member) throws Exception {
		return sqlsession.selectOne(NAMESPACE + ".findId", member);
	}

	// 회원 비밀번호 찾기(비밀번호 변경)
	public int findPw(MemberDTO member) throws Exception {
		return sqlsession.update(NAMESPACE + ".findPw", member);
	}

	public int updateProfile(MemberDTO member) throws Exception {
		return sqlsession.update(NAMESPACE + ".updateProfile", member);
	}

	// 이메일 변경시에만 사용. 이메일 인증 false, 인증키 업데이트
	public void approval_status(MemberDTO member) {
		sqlsession.update(NAMESPACE + ".approval_status", member);
	}

}
