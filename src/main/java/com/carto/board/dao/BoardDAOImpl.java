package com.carto.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.carto.board.domain.BoardDTO;
import lombok.Setter;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private final String MAPPER = "com.carto.mappers.BoardMapper";
	
	@Setter(onMethod_ = @Autowired)
	private SqlSession session;
	

	@Override
	public void create(BoardDTO dto) throws Exception {
		session.insert(MAPPER + ".create", dto);
	}

	@Override
	public BoardDTO read(Integer bno) throws Exception {
		return null;
	}

	@Override
	public List<BoardDTO> list() throws Exception {
		return session.selectList(MAPPER + ".list");
	}

	@Override
	public void update(BoardDTO dto) throws Exception {
		
	}

	@Override
	public void delete(Integer bno) throws Exception {
		
	}

	@Override
	public void addCount(Integer bno) throws Exception {
		
	}

}
