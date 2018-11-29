package com.carto.address.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpSession;

import com.carto.address.domain.AddressDTO;

public interface AddressService {
    
	//목록
	public List<AddressDTO> adressListService(long mno) throws Exception;
    //수정
    public int addressUpdateService(AddressDTO address) throws Exception;
    //삭제
    public void addressDeleteService(ArrayList<Integer> deleteArray) throws Exception;
    //등록
	public int addressInsertService(AddressDTO addressdto) throws Exception;
	//주소 이름 편집
	public void addressNameUpdate(AddressDTO address);
	
	
	

}
