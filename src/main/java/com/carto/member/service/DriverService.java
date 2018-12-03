package com.carto.member.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.carto.member.domain.DriverDTO;
import com.carto.member.domain.LoginDTO;
import com.carto.member.domain.MemberDTO;

public interface DriverService {
	// 드라이버 만들기
	public int insertDriver(DriverDTO dto);

	public int UpdateDriverVerti(DriverDTO dto);

	public DriverDTO getDriver(int mno);
	

	public int UpdateDriver(DriverDTO dto);
	
	public List<DriverDTO> getAttach(Integer mno) throws Exception;
}
