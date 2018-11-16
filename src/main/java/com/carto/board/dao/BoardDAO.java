package com.carto.board.dao;

import java.util.List;
import com.carto.board.domain.BoardVO;
import com.carto.board.domain.SearchCriteria;

public interface BoardDAO {
	
	public void create(BoardVO vo) throws Exception;   // 게시글 생성

	public BoardVO read(Integer bno) throws Exception; // 게시글 읽기
	
	public void update(BoardVO vo) throws Exception;   // 게시글 수정
	
	public void delete(Integer bno) throws Exception;  // 게시글 삭제
	
	public List<BoardVO> list(SearchCriteria cri) throws Exception; // 검색에 따른 게시글 목록
	
	public int listCount(SearchCriteria cri) throws Exception; // 검색에 따른 데이터 갯수 반환
	
	public void updateReplyCnt(Integer bno, int amount) throws Exception; // 댓글 수 갱신
	
	public void updateViewCnt(Integer bno) throws Exception; // 조회수 카운트
	
	public void addAttach(String fullName, Integer bno) throws Exception;  // 첨부 파일 추가
	
	public List<String> getAttach(Integer bno) throws Exception; // 첨부 파일 목록 가져오기 
	
	public void deleteAttach(Integer bno) throws Exception; // 첨부 파일 삭제
	 
	public void replaceAttach(String fullName, Integer bno) throws Exception; // 첨부 파일 수정
}
