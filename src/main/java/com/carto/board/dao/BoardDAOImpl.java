package com.carto.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.carto.board.domain.BoardVO;
import com.carto.board.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "com.carto.mappers.BoardMapper";
	
	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {		
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public List<BoardVO> list(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listCount", cri);
	}

	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateReplyCnt", paramMap);
	}
	
	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		session.update(namespace + ".updateViewCnt", bno);
	}
	
	@Override
	public void addAttach(String fullName, Integer bno) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("fullName", fullName);
		paramMap.put("bno", bno);
		session.insert(namespace + ".addAttach", paramMap);
	}
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return session.selectList(namespace + ".getAttach", bno);
	}

	@Override // 특정 게시물 번호에 속하는 모든 첨부파일을 삭제합니다.
	public void deleteAttach(Integer bno) throws Exception {
		session.delete(namespace + ".deleteAttach", bno);		
	}

	@Override // 수정된 상태의 파일과 이름과 이미 등록되어 있는 게시물의 번호가 필요함
	public void replaceAttach(String fullName, Integer bno) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);		
		session.insert(namespace + ".replaceAttach", paramMap);
	}
}
