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
	public Object memberList() throws Exception  {
		return session.selectList(namespace + ".memberList");
	}
	
	// 페이징
	@Override
	public int listCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".listCount", cri);
	}

	@Override
	public MemberDTO selectMember(Integer mno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectMember" ,mno);
	}
}
