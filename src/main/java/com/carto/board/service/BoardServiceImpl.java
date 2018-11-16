package com.carto.board.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import com.carto.board.dao.BoardDAO;
import com.carto.board.domain.BoardVO;
import com.carto.board.domain.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	@Transactional
	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board); // 게시글 생성
		
		String[] files = board.getFiles();
		
		if(files == null) { return; }
		
		for(String fileName : files) { 
			dao.addAttach(fileName, board.getBno()); // 해당 게시글 관련 첨부 목록  데이터 추가
		}
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer bno) throws Exception {
		dao.updateViewCnt(bno); // 조회수 증가
		return dao.read(bno); // 해당 게시글 가져오기
	}

	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
		
		Integer bno = board.getBno();
		
		dao.deleteAttach(bno); // 해당 게시글 관련 첨부파일 테이블에서 데이터 삭제
		
		String[] files = board.getFiles(); // 수정된 첨부파일 데이터 가져와서
		
		if(files == null) { return; }
		
		for(String fileName : files) {
			dao.replaceAttach(fileName, bno); // 다시 해당 게시글 관련 첨부파일 데이터 추가
		}
	}

	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteAttach(bno); // 해당 게시글 관련 첨부파일 테이블에서 데이터 삭제
		dao.delete(bno); // 해당 게시글 삭제
	}

	@Override
	public List<BoardVO> list(SearchCriteria cri) throws Exception {
		return dao.list(cri);
	}
	
	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		return dao.listCount(cri);
	}
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return dao.getAttach(bno);
	}
}
