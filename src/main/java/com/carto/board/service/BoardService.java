package com.carto.board.service;

import java.util.List;

import com.carto.board.domain.BoardDTO;

public interface BoardService {

	public List<BoardDTO> listAll() throws Exception; 
	
	public void regist(BoardDTO board) throws Exception;
}
