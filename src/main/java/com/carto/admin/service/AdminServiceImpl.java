package com.carto.admin.service;

import java.util.HashMap;

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

	// 회원 한명 정보 가져오기
	@Override
	public MemberDTO selectMember(Integer mno) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.selectMember(mno);
	}

	// 회원 정보 수정
	@Override
	public void modifyMember(MemberDTO dto) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("approval_status", dto.isApproval_status());
		map.put("authority", dto.getAuthority());
		map.put("mno", dto.getMno());
		map.put("userid", dto.getUserid());
		adminDAO.modifyMember(map);

	}

	// 회원 삭제 처리
	@Override
	public void deleteMember(Integer mno) throws Exception {
		// TODO Auto-generated method stub
		adminDAO.deleteMember(mno);
	}
}
