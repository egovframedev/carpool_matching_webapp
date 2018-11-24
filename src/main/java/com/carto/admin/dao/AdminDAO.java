package com.carto.admin.dao;

import org.springframework.stereotype.Repository;

import com.carto.board.domain.Criteria;

@Repository
public interface AdminDAO {

	// 회원관리 목록
	public Object memberList() throws Exception; // 회원관리 목록

	public int listCount(Criteria cri) throws Exception; //페이징

}
