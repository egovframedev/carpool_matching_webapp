package com.carto.board.dao;

import java.util.List;

import com.carto.board.domain.BoardDTO;

public interface BoardDAO {
	
	/**
	 * 게시글 생성
	 * @param dto
	 * @throws Exception
	 */
	public void create(BoardDTO dto) throws Exception;
	
	/**
	 * 게시글 읽기
	 * @param bno
	 * @return
	 * @throws Exception
	 */
	public BoardDTO read(Integer bno) throws Exception;
	
	/**
	 * 게시글 목록
	 * @return
	 * @throws Exception
	 */
	public List<BoardDTO> list() throws Exception;
	
	
	/**
	 * 게시글 수정
	 * @param dto
	 * @throws Exception
	 */
	public void update(BoardDTO dto) throws Exception;
	
	/**
	 * 게시글 삭제
	 * @param bno
	 * @throws Exceptipn
	 */
	public void delete(Integer bno) throws Exception;
	
	/**
	 * 조회수 카우트
	 * @param bno
	 * @throws Exception
	 */
	public void addCount(Integer bno) throws Exception;
	
	
}
