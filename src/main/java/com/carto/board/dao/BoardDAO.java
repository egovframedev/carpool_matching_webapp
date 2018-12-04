package com.carto.board.dao;

import java.util.List;

import com.carto.board.domain.AttachfileDTO;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.Criteria;

public interface BoardDAO {

	public void regist(BoardDTO dto) throws Exception; // 게시글 생성

	public BoardDTO detail(Integer bno) throws Exception; // 게시글 읽기

	public void modify(BoardDTO dto) throws Exception; // 게시글 수정

	public void delete(Integer bno) throws Exception; // 게시글 삭제

	public List<BoardDTO> list(Criteria cri, BoardDTO dto) throws Exception; // 검색에 따른 게시글 목록

	public int listCount(Criteria cri) throws Exception; // 검색에 따른 데이터 갯수 반환

	public void updateViewCnt(Integer bno) throws Exception; // 조회수 카운트

	public void addAttach(String filename, Integer bno) throws Exception; // 첨부 파일 추가

	public List<AttachfileDTO> getAttach(Integer bno) throws Exception; // 첨부 파일 목록 가져오기

	public void deleteAttach(Integer bno) throws Exception; // 첨부 파일 삭제

	public void replaceAttach(String filename, Integer bno) throws Exception; // 첨부 파일 수정

	public void reply(BoardDTO dto) throws Exception; // 답글 생성

	public void addreply(BoardDTO dto) throws Exception;

	public List<BoardDTO> mainCenterList(Criteria cri) throws Exception; //main page에 board 불러오는 거

}
