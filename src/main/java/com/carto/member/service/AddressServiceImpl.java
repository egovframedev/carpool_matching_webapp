package com.carto.member.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carto.member.dao.AddressDao;
import com.carto.member.domain.AddressDTO;

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
	public void addressInsertService(HttpServletResponse response, AddressDTO address) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 주소 5개 초과
		if (addressDAO.getCount(address) >= 5) {
			out.close();
		}else {
			addressDAO.addressInsert(address);
		}
	}

	@Override
	public void addressNameUpdate(AddressDTO address) {
		// 주소 이름 편집
		addressDAO.addressNameUpdate(address);
	}

	@Transactional
	@Override
	public void addressDeleteService(ArrayList<Integer> deleteArray) throws Exception {
		// 삭제
		addressDAO.addressDelete(deleteArray);
	}

}
