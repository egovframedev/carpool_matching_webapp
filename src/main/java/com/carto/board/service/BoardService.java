package com.carto.board.service;

import java.util.List;

import com.carto.board.domain.AttachfileDTO;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.Criteria;

public interface BoardService {

	public void regist(BoardDTO dto) throws Exception; // 글 작성

	public BoardDTO detail(Integer bno) throws Exception; // 글 상세보기

	public void modify(BoardDTO dto) throws Exception; // 글 수정

	public void delete(Integer bno) throws Exception; // 글 삭제

	public List<BoardDTO> list(Criteria cri) throws Exception; // 글 목록

	public int listCount(Criteria cri) throws Exception;

	public List<AttachfileDTO> getAttach(Integer bno) throws Exception;
	
	public void reply(BoardDTO dto) throws Exception;   // 답글 생성

	public List<AttachfileDTO> findBno(Integer bno) throws Exception; //첨부파일 불러오기
	
}
