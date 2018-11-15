package com.carto.member.dao;

import com.carto.member.domain.MemberDTO;

/**
 * 회원 DAO 인터페이스
 * @author CodingBear
 * @since 2018.11.14
 */
public interface MemberDAO {
	/**
	 * 회원 정보 
	 * @param dto
	 * @return
	 */
	public MemberDTO read(MemberDTO dto);
	public MemberDTO readById(String userid);
}
