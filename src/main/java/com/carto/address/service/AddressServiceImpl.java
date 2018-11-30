package com.carto.address.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carto.address.dao.AddressDao;
import com.carto.address.domain.AddressDTO;

@Service
public class AddressServiceImpl implements AddressService {

	@Inject
	AddressDao addressDAO;

	@Override
	public List<AddressDTO> adressListService(long mno) throws Exception {
		// 목록
		return addressDAO.adressListService(mno);
	}

	@Override
	public int addressUpdateService(AddressDTO address) throws Exception {
		// 수정
		return 0;
	}

	@Transactional
	@Override
	public int addressInsertService(AddressDTO address) throws Exception {
		// 등록
		if (address.getAddr_type().getCount() <= addressDAO.getCount(address)) {
			System.out.println("초과할때==============>");
			System.out.println("주소 입력 가능 갯수: " + address.getAddr_type().getCount());
			System.out.println("타입갯수 :" + addressDAO.getCount(address));
			return addressDAO.addressUpdate(address);
		} else {
			System.out.println("입력가능==============>");
			System.out.println("타입갯수 :" + addressDAO.getCount(address));
			return addressDAO.addressInsert(address);
		}

	}
	
	@Override
	public void addressNameUpdate(AddressDTO address) {
		// 주소 이름 편집
		addressDAO.addressNameUpdate(address);
	}

	@Override
	public void addressDeleteService(ArrayList<Integer> deleteArray) throws Exception {
		// 삭제
		addressDAO.addressDelete(deleteArray);
	}

}
