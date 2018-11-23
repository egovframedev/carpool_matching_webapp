package com.carto.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.board.domain.AttachfileDTO;

@Repository
public class AttachDAOImpl implements AttachDAO {

//	@Setter(onMethod_ = @Autowired)
	@Autowired
	private SqlSessionTemplate session;
	static String namespace = "com.carto.mappers.BoardAttachMapper";

	@Override
	public void insert(AttachfileDTO dto) {
		System.out.println(dto);
		session.insert(namespace + ".insert", dto);
	}

	@Override
	public void delete(String uuid) {
		session.delete(namespace + ".delete", uuid);
	}

	@Override
	public List<AttachfileDTO> findByBno(Integer bno) {
		return session.selectList(namespace + ".findByBno", bno);
	}

	@Override
	public void deleteAll(Integer bno) {
		session.delete(namespace + ".deleteAll", bno);
	}

	@Override
	public List<AttachfileDTO> getOldFiles() {
		return session.selectList(namespace + ".getOldFiles");
	}

}
