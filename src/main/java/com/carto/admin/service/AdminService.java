package com.carto.admin.service;

import com.carto.board.domain.Criteria;
import com.carto.member.domain.MemberDTO;

public interface AdminService {

	public Object memberList(Criteria cri) throws Exception; // 회원목록 불러오기

	public int listCount(Criteria cri) throws Exception; // 페이징

	public MemberDTO selectMember(Integer mno) throws Exception; // 회원 한명 불러오기

	public void modifyMember(MemberDTO dto) throws Exception; // 회원 정보 수정

	public void deleteMember(Integer mno) throws Exception; // 회원 삭제처리

}
