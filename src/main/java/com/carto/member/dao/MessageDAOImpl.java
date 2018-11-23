package com.carto.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carto.member.domain.MessageCriteria;
import com.carto.member.domain.MessageDTO;

@Repository
public class MessageDAOImpl implements MessageDAO  {
	private final String NAMESPACE = "com.carto.mappers.MessageMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertMsg(MessageDTO dto) throws Exception {
		return session.insert(NAMESPACE + ".insertMsg", dto);
	}

	@Override
	public MessageDTO selectMsg(Integer msgId) throws Exception {
		return session.selectOne(NAMESPACE + ".selectMsg", msgId);
	}

	@Override
	public List<MessageDTO> selectMsgList(MessageCriteria cri) throws Exception {
		return session.selectList(NAMESPACE + ".selectMsgList", cri);
	}

	@Override
	public int deleteMsg(Integer msgId) throws Exception {
		return session.delete(NAMESPACE + ".deleteMsg", msgId);
	}

}
