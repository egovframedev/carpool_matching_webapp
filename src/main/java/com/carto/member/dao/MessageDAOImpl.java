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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MessageDTO selectMsg(Integer msgId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MessageDTO> selectMsgList(MessageCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMsg(Integer msgId) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
