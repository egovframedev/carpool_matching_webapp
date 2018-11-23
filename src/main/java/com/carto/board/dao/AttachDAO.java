package com.carto.board.dao;

import java.util.List;

import com.carto.board.domain.AttachfileDTO;

public interface AttachDAO {
	/**
	 * 첨부파일 등록
	 * @param dto
	 */
	public void insert(AttachfileDTO dto);
	
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
	public List<AttachfileDTO> findByBno(Integer bno);
	
	/**
	 * 게시글의 첨부파일 삭제
	 * @param bno
	 */
	public void deleteAll(Integer bno);
	
	public List<AttachfileDTO> getOldFiles();
}
