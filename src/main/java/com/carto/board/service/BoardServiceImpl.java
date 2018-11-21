package com.carto.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.carto.board.dao.BoardAttachDAO;
import com.carto.board.dao.BoardDAO;
import com.carto.board.domain.BoardAttachDTO;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardDAO boardDAO;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachDAO attachDAO;
	
	
	@Transactional
	@Override
	public void write(BoardDTO board) throws Exception {
		log.info("register..... " + board);
		
		boardDAO.create(board); // 게시글 생성
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachDAO.insert(attach);
		});
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardDTO detail(Integer bno) throws Exception {
		boardDAO.updateViewCnt(bno); // 조회수 증가
		return boardDAO.read(bno); // 해당 게시글 가져오기
	}

	@Transactional
	@Override
	public void modify(BoardDTO board) throws Exception {
		log.info("modify........." + board);
		
		attachDAO.deleteAll(board.getBno());
		
		boardDAO.update(board); // 게시글 업데이트
		
		if(board.getAttachList().size() > 0 ) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachDAO.insert(attach);
			});
		}
	}

	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		log.info("remove...." + bno);
		attachDAO.deleteAll(bno);  // 첨부파일 삭제
		boardDAO.delete(bno);      // 해당 게시글 삭제
	}

	@Override
	public List<BoardDTO> list(Criteria cri) throws Exception {
		return boardDAO.list(cri);
	}
	
	@Override
	public int listCount(Criteria cri) throws Exception {
		return boardDAO.listCount(cri);
	}
	
	@Override
	public List<BoardAttachDTO> getAttachList(Integer bno) throws Exception {
		log.info("get Attach list by bno " + bno);
		return attachDAO.findByBno(bno);
	}
}
