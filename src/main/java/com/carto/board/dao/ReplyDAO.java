package com.carto.board.dao;

import java.util.List;
import com.carto.board.domain.Criteria;
import com.carto.board.domain.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> list(Integer bno) throws Exception; // 게시글 번호에 따른 댓글 리스트
	
	public void create(ReplyVO vo) throws Exception;         // 새 댓글 작성
	
	public void update(ReplyVO vo) throws Exception;         // 댓글 수정
	
	public void delete(Integer rno)  throws Exception;       // 댓글 삭제
	
	public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception; // 페이징 처리한 댓글 리스트
	
	public int count(Integer bno) throws Exception;          // 댓글 데이터 갯수 반환
	
	public int getBno(Integer rno) throws Exception;        //  댓글의 원 게시글 번호 
}
