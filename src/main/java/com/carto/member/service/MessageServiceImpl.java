package com.carto.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carto.member.dao.MessageDAO;
import com.carto.member.domain.MessageDTO;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDAO dao;
	
	@Override
	public void sendMessage(MessageDTO dto) throws Exception {
		// 공통 업무 - 로그인 확인
		// 핵심 업무 - 메시지 저장,
		// 메시지를 테이블에 저장
		dao.insertMsg(dto);
	}

	@Override
	public MessageDTO readMessage(String userid, Integer msgId) throws Exception {
		
		// 메시지 가져오기
		return dao.selectMsg(msgId);
	}

}
