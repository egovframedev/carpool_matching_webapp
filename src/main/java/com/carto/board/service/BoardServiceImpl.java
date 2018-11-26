package com.carto.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.carto.board.dao.AttachDAO;
import com.carto.board.dao.BoardDAO;
import com.carto.board.domain.AttachfileDTO;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.Criteria;

//@Transactional // 에러 발생되면 자동 rollback 시킴
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Autowired
	AttachDAO attachDAO;

	@Override
	public void regist(BoardDTO dto) throws Exception {
		boardDAO.regist(dto); // 게시글 생성
		
		if (dto.getAttachList() == null || dto.getAttachList().size() <= 0) {
			return;
		}

		for (AttachfileDTO attach : dto.getAttachList()) {
			attach.setBno(dto.getBno());
			attachDAO.insert(attach);
		}
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardDTO detail(Integer bno) throws Exception {
		boardDAO.updateViewCnt(bno); // 조회수 증가
		
		return boardDAO.detail(bno); // 해당 게시글 가져오기
	}

	@Transactional
	@Override
	public void modify(BoardDTO dto) throws Exception {

		boardDAO.modify(dto); // 게시글 업데이트

		if (dto.getAttachList().size() > 0) {
			for (AttachfileDTO attach : dto.getAttachList()) {
				attach.setBno(dto.getBno());
				attachDAO.insert(attach);
			}
		}
	}

	@Transactional
	@Override
	public void delete(Integer bno) throws Exception {
		attachDAO.deleteAll(bno);  // 첨부파일 삭제
		boardDAO.delete(bno); // 해당 게시글 삭제
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
	public List<AttachfileDTO> getAttach(Integer bno) throws Exception {
		return boardDAO.getAttach(bno);
	}

	// 답글 작성 부분
	@Override
	public void reply(BoardDTO dto) throws Exception {
		boardDAO.addreply(dto);
		boardDAO.reply(dto);
	}

}
