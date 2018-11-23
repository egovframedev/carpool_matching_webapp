package com.carto.member.service;

import com.carto.member.domain.MessageDTO;

public interface MessageService {
	public void sendMessage(MessageDTO dto) throws Exception; // 메세지 보내기
	public MessageDTO readMessage(String userid, Integer msgId) throws Exception; // 메세지 열람
}
