package com.carto.board.service;

import java.util.List;

import com.carto.board.domain.Criteria;
import com.carto.board.domain.ReplyVO;

public interface ReplyService {
	
	public void addReply(ReplyVO vo) throws Exception;  // 댓글 달기
	
	public List<ReplyVO> listReply(Integer bno) throws Exception; // 댓글 가져오기
	 
	public void modifyReply(ReplyVO vo) throws Exception; // 댓글 수정
	
	public void removeReply(Integer rno) throws Exception; // 댓글 삭제
	
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception; // 페이징처리한 댓글 목록
	
	public int count(Integer bno) throws Exception; // 댓글 갯수 가져오기
}
