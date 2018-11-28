package com.carto.admin.dao;

import org.springframework.stereotype.Repository;

import com.carto.board.domain.Criteria;
import com.carto.member.domain.MemberDTO;

@Repository
public interface AdminDAO {

	// 회원관리 목록
	public Object memberList(Criteria cri) throws Exception; // 회원관리 목록

	public int listCount(Criteria cri) throws Exception; // 페이징

	public int paylistCount(Criteria cri) throws Exception;

	public MemberDTO selectMember(Integer mno) throws Exception; // 회원 한명 불러오기

	public void modifyMember(MemberDTO dto) throws Exception; // 회원 정보 수정

	public void deleteMember(Integer mno) throws Exception; // 회원 삭제처리

	public Object payAllList(Criteria cri) throws Exception; // 전체 결제 내역

}