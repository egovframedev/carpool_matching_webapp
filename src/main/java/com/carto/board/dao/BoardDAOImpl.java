package com.carto.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.board.domain.AttachfileDTO;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSessionTemplate session;
	static String namespace = "com.carto.mappers.BoardMapper";

	
	@Override
	public void regist(BoardDTO dto) throws Exception {
		session.insert(namespace + ".regist", dto);
	}

	@Override
	public BoardDTO detail(Integer bno) throws Exception {		
		return session.selectOne(namespace + ".detail", bno);
	}

	@Override
	public void modify(BoardDTO dto) throws Exception {
		session.update(namespace + ".modify", dto);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public List<BoardDTO> list(Criteria cri) throws Exception {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public int listCount(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".listCount", cri);
	}

	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		session.update(namespace + ".updateViewCnt", bno);
	}
	
	@Override
	public void addAttach(String filename, Integer bno) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("filename", filename);
		paramMap.put("bno", bno);
		session.insert(namespace + ".addAttach", paramMap);
	}
	
	@Override
	public List<AttachfileDTO> getAttach(Integer bno) throws Exception {
		return session.selectList(namespace + ".getAttach", bno);
	}

	@Override // 특정 게시물 번호에 속하는 모든 첨부파일을 삭제합니다.
	public void deleteAttach(Integer bno) throws Exception {
		session.delete(namespace + ".deleteAttach", bno);		
	}

	@Override // 수정된 상태의 파일과 이름과 이미 등록되어 있는 게시물의 번호가 필요함
	public void replaceAttach(String filename, Integer bno) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("filename", filename);		
		session.insert(namespace + ".replaceAttach", paramMap);
	}
	
	// 답글 등록
	@Override
	public void reply(BoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".reply", dto);
	}
	
	@Override
	public void addreply(BoardDTO dto) throws Exception {
		session.insert(namespace + ".addreply", dto);
	}

}