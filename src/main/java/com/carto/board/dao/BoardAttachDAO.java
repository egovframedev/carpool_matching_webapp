package com.carto.board.dao;

import java.util.List;

import com.carto.board.domain.BoardAttachDTO;

public interface BoardAttachDAO {
	/**
	 * 첨부파일 등록
	 * @param dto
	 */
	public void insert(BoardAttachDTO dto);
	
	/**
	 * 첨부파일 삭제
	 * @param uuid
	 */
	public void delete(String uuid);
	
	/**
	 * 게시글의 첨부파일 목록
	 * @param bno
	 * @return
	 */
	public List<BoardAttachDTO> findByBno(Integer bno);
	
	/**
	 * 게시글의 첨부파일 삭제
	 * @param bno
	 */
	public void deleteAll(Integer bno);
	
	public List<BoardAttachDTO> getOldFiles();
}
