package com.carto.member.service;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carto.board.domain.AttachfileDTO;
import com.carto.member.dao.DriverDAO;
import com.carto.member.dao.MemberDAO;
import com.carto.member.domain.DriverDTO;
import com.carto.member.domain.LoginDTO;
import com.carto.member.domain.MemberDTO;
import com.carto.member.domain.NotAuthorizedUserException;
import com.mysql.jdbc.log.Log;

@Service
public class DriverServiceImpl implements DriverService {

	@Inject
	private DriverDAO manager;


	@Override
	public int insertDriver(DriverDTO dto) {
		return manager.insertDriver(dto);
	}

	@Override
	public int UpdateDriverVerti(DriverDTO dto) {
		if(dto.getCar_photo_chk() ==2 && dto.getCarReg_photo_chk() ==2
				&& dto.getLicense_chk()==2 && dto.getInsurance_chk()==2){
			dto.setPost_state(2);
		}
		else{
			dto.setPost_state(0);
		}
		return manager.UpdateDriverVerti(dto);
	}

	@Override
	public DriverDTO getDriver(int mno) {
		return manager.getDriver(mno);
	}

	@Override
	public int UpdateDriver(DriverDTO dto) {
		return manager.UpdateDriver(dto);
	}



	@Override
	public List<DriverDTO> getAttach(Integer mno) throws Exception {
		// TODO Auto-generated method stub
		return manager.getAttach(mno);
	}
}
