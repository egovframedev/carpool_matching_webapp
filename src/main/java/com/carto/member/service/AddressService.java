package com.carto.member.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.carto.member.domain.AddressDTO;

public interface AddressService {
    
	//목록
	public List<AddressDTO> adressListService(long mno) throws Exception;
    //수정
    public int addressUpdateService(AddressDTO address) throws Exception;
    //삭제
    public void addressDeleteService(ArrayList<Integer> deleteArray) throws Exception;
    //등록
	public void addressInsertService(HttpServletResponse response, AddressDTO addressdto) throws Exception;
	//주소 이름 편집
	public void addressNameUpdate(AddressDTO address);
	
	
	

}
