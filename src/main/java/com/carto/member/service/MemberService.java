package com.carto.member.service;

import java.util.Date;
import javax.servlet.http.HttpServletResponse;

import com.carto.member.domain.DriverDTO;
import com.carto.member.domain.LoginDTO;
import com.carto.member.domain.MemberDTO;

public interface MemberService {
	
	public void check_id(String id, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;

	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception;
	
	public String approval_key() throws Exception;
	
	public void sendmail(MemberDTO member) throws Exception; 
	
	public void approval_member(MemberDTO member, HttpServletResponse response) throws Exception;
	
	//로그인 처리
	public MemberDTO login(LoginDTO dto) throws Exception;
	
	// 로그인 유지
	public void keepLogin(String userid, String sessionId, Date next) throws Exception;
	
	// 세션키로 로그인 체크
	public MemberDTO checkLoginBefore(String value);
	
	//회원 로그인 정보
	public MemberDTO viewMember(MemberDTO memberdto) throws Exception;
	
	//드라이버 만들기
	public int insertDriver(DriverDTO dto,int mno);
	
	public int UpdateDriverVerti(DriverDTO dto);
	
	public DriverDTO getDriver(int mno);

}
