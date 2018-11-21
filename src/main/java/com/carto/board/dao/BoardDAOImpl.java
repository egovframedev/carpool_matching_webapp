package com.carto.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private final String namespace = "com.carto.mappers.BoardMapper";

	@Inject
	private SqlSession session;
	
	// 글 생성
	@Override
	public void create(BoardDTO dto) throws Exception {
		session.insert(namespace + ".create", dto);
	}

	// 글 보기
	@Override
	public BoardDTO read(Integer bno) throws Exception {		
		return session.selectOne(namespace + ".read", bno);
	}

	// 글 수정
	@Override
	public void update(BoardDTO dto) throws Exception {
		session.update(namespace + ".update", dto);
	}

	// 글 삭제
	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	// 글 목록
	@Override
	public List<BoardDTO> list(Criteria cri) throws Exception {
		return session.selectList(namespace + ".list", cri);
	}

	// 글 갯수
	@Override
	public int listCount(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".listCount", cri);
	}

	// 댓글 갯수 갱신
	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateReplyCnt", paramMap);
	}
	
	// 조회수 증가
	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		session.update(namespace + ".updateViewCnt", bno);
	}
	
}
