package com.carto.board.service;

import java.util.List;

import com.carto.board.domain.BoardAttachDTO;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.Criteria;

public interface BoardService {
	
	public void write(BoardDTO board) throws Exception;
	
	public BoardDTO detail(Integer bno) throws Exception;
	
	public void modify(BoardDTO board) throws Exception;
	
	public void remove(Integer bno) throws Exception;
	
	public List<BoardDTO> list(Criteria cri) throws Exception;
	
	public int listCount(Criteria cri) throws Exception;
	
	public List<BoardAttachDTO> getAttachList(Integer bno) throws Exception;
	
}
