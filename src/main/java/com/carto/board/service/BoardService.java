package com.carto.board.service;

import java.util.List;
import com.carto.board.domain.BoardVO;
import com.carto.board.domain.SearchCriteria;

public interface BoardService {
	
	public void regist(BoardVO board) throws Exception;
	
	public BoardVO read(Integer bno) throws Exception;
	
	public void modify(BoardVO board) throws Exception;
	
	public void remove(Integer bno) throws Exception;
	
	public List<BoardVO> list(SearchCriteria cri) throws Exception;
	
	public int listCount(SearchCriteria cri) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;	
}
