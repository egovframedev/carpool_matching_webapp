package com.carto.board.dao;

import java.util.List;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.Criteria;

public interface BoardDAO {
	
	/**
	 * 게시글 목록
	 * @param cri 페이지, 검색 기준 정보
	 * @return
	 * @throws Exception
	 */
	public List<BoardDTO> list(Criteria cri) throws Exception;
	
	/**
	 * 게시글 총 갯수 반환
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public int listCount(Criteria cri) throws Exception; // 검색에 따른 데이터 갯수 반환
	
	/**
	 * 게시글 생성
	 * @param dto BoardDTO 게시글 객체
	 * @throws Exception
	 */
	public void create(BoardDTO dto) throws Exception;

	/**
	 * 게시글 읽기
	 * @param bno 게시글 번호
	 * @return
	 * @throws Exception
	 */
	public BoardDTO read(Integer bno) throws Exception;
	
	/**
	 * 게시글 수정
	 * @param dto BoardDTO
	 * @throws Exception
	 */
	public void update(BoardDTO dto) throws Exception;  
	
	/**
	 * 게시글 삭제
	 * @param bno 게시글 번호
	 * @throws Exception
	 */
	public void delete(Integer bno) throws Exception;
	
	
	/**
	 * 조회수 카운트 (증가)
	 * @param bno
	 * @throws Exception
	 */
	public void updateViewCnt(Integer bno) throws Exception; // 조회수 카운트
	
	/**
	 * 댓글 수 갱신
	 * @param bno
	 * @param amount
	 * @throws Exception
	 */
	public void updateReplyCnt(Integer bno, int amount) throws Exception; 
	
}
