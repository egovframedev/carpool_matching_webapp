package com.carto.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.board.domain.Criteria;
import com.carto.member.domain.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSessionTemplate session;
	static String namespace = "com.carto.mappers.AdminMapper";

	// 회원관리 목록
	@Override
	public Object memberList() throws Exception {
		return session.selectList(namespace + ".memberList");
	}

	// 페이징
	@Override
	public int listCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".listCount", cri);
	}

	// 회원 한명 불러오기
	@Override
	public MemberDTO selectMember(Integer mno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectMember", mno);
	}

	// 회원 정보 수정(member table)
	@Override
	public void modifyMember(MemberDTO dto) throws Exception {
		session.update(namespace + ".modifyMember", dto);
	}

	// 회원 삭제처리
	@Override
	public void deleteMember(Integer mno) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".deleteMember", mno);
	}

}
