package com.carto.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.carto.board.domain.BoardAttachDTO;

import lombok.Setter;

@Repository
public class BoardAttachDAOImpl implements BoardAttachDAO {
	private final String namespace = "com.carto.mappers.BoardAttachMapper";
	
	@Setter(onMethod_ = @Autowired)
	private SqlSession session;

	@Override
	public void insert(BoardAttachDTO dto) {
		session.insert(namespace +  ".insert", dto);
		
	}

	@Override
	public void delete(String uuid) {
		session.delete(namespace + ".delete", uuid);
	}

	@Override
	public List<BoardAttachDTO> findByBno(Integer bno) {
		return session.selectList(namespace + ".findByBno", bno);
	}

	@Override
	public void deleteAll(Integer bno) {
		session.delete(namespace + ".deleteAll", bno);
	}

	@Override
	public List<BoardAttachDTO> getOldFiles() {
		return session.selectList(namespace + ".getOldFiles");
	}

	
	
	
}
