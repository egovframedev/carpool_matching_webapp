package com.carto.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carto.admin.dao.AdminDAO;
import com.carto.board.domain.Criteria;
import com.carto.member.domain.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;

	// 회원관리 목록
	@Override
	public Object memberList() throws Exception {
		return adminDAO.memberList();
	}

	// 페이징
	@Override
	public int listCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.listCount(cri);
	}
	
	@Override
	public MemberDTO selectMember(Integer mno) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.selectMember(mno);
	}
}
