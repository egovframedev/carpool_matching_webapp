package com.carto.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.carto.board.dao.BoardDAO;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.Criteria;

//@Transactional // 에러 발생되면 자동 rollback 시킴
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;

	@Override
	public void regist(BoardDTO dto) throws Exception {
		dao.regist(dto); // 게시글 생성

		String[] files = dto.getFiles();

		if (files == null) {
			return;
		}

		for (String filename : files) {
			dao.addAttach(filename, dto.getBno()); // 해당 게시글 관련 첨부 목록 데이터 추가
		}
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardDTO detail(Integer bno) throws Exception {
		dao.updateViewCnt(bno); // 조회수 증가
		return dao.detail(bno); // 해당 게시글 가져오기
	}

	@Transactional
	@Override
	public void modify(BoardDTO dto) throws Exception {
		dao.modify(dto);

		Integer bno = dto.getBno();

		dao.deleteAttach(bno); // 해당 게시글 관련 첨부파일 테이블에서 데이터 삭제

		/*
		 * String[] files = dto.getFiles(); // 수정된 첨부파일 데이터 가져와서
		 * 
		 * if (files == null) { return; }
		 * 
		 * for (String filename : files) { dao.replaceAttach(filename, bno); // 다시 해당
		 * 게시글 관련 첨부파일 데이터 추가 }
		 */
	}

	@Transactional
	@Override
	public void delete(Integer bno) throws Exception {
		// dao.deleteAttach(bno); // 해당 게시글 관련 첨부파일 테이블에서 데이터 삭제
		dao.delete(bno); // 해당 게시글 삭제
	}

	@Override
	public List<BoardDTO> list(Criteria cri) throws Exception {
		return dao.list(cri);
	}

	@Override
	public int listCount(Criteria cri) throws Exception {
		return dao.listCount(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return dao.getAttach(bno);
	}

	@Override
	public void reply(BoardDTO dto) throws Exception {
		dao.addreply(dto);
		dao.reply(dto);
	}

}
