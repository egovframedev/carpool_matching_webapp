package com.carto.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carto.board.dao.BoardDAO;
import com.carto.board.domain.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardDTO> listAll() throws Exception {
		return boardDAO.list();
	}
	
	
	@Override
	public void regist(BoardDTO board) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
