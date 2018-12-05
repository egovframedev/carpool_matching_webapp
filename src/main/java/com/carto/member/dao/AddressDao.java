package com.carto.member.dao;

import java.util.ArrayList;
import java.util.List;

import com.carto.member.domain.AddressDTO;

public interface AddressDao {

	// 목록
	public List<AddressDTO> adressListService(long mno) throws Exception;

	// 등록
	public int addressInsert(AddressDTO address) throws Exception;

	// 수정
	public int addressUpdate(AddressDTO address) throws Exception;

	// 삭제
	public void addressDelete(ArrayList<Integer> deleteArray) throws Exception;
	
	//타입 갯수 출력
	public int getCount(AddressDTO address) throws Exception;
	
	//주소 이름 편집
	public void addressNameUpdate(AddressDTO address);
	    
}
