package com.carto.address.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.carto.address.domain.AddressDTO;

@Repository
public class AddressDaoImpl implements AddressDao {

	private final String NAMESPACE = "com.carto.mappers.AddressMapper";

	@Inject
	SqlSessionTemplate sqlSession;

	@Override
	public List<AddressDTO> adressListService(long mno) throws Exception {
		// 목록
		return sqlSession.selectList(NAMESPACE + ".AddressList", mno);
	}

	@Override
	public int addressInsert(AddressDTO address) throws Exception {
		// 등록
		return sqlSession.insert(NAMESPACE + ".AddressInsert", address);
	}

	@Override
	public int addressUpdate(AddressDTO address) throws Exception {
		// 수정
		return sqlSession.update(NAMESPACE + ".AddressUpdate", address);
	}

	@Override
	public int getCount(AddressDTO address) throws Exception {
		// 주소 타입 갯수 가져오기
		return sqlSession.selectOne(NAMESPACE + ".CountType", address);
	}

	@Override
	public void addressNameUpdate(AddressDTO address) {
		// 주소 이름 편집
		sqlSession.update(NAMESPACE + ".AddressNameUpdate", address);
	}

	@Override
	public void addressDelete(ArrayList<Integer> deleteArray) throws Exception {
		// 삭제
		for(int i=0; i<deleteArray.size(); i++) {
			int addr_no = deleteArray.get(i);
			sqlSession.delete(NAMESPACE + ".AddressDelete", addr_no);
		}
	}

}
