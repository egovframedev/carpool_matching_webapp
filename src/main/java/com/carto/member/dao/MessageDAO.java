package com.carto.member.dao;

import java.util.List;
import com.carto.member.domain.MessageCriteria;
import com.carto.member.domain.MessageDTO;

// 메세지 DAO 인터페이스
public interface MessageDAO {
	
	public int insertMsg(MessageDTO dto) throws Exception; // 메세지 저장
	
	public MessageDTO selectMsg(Integer msgId) throws Exception; // 메세지 읽기
	
	public List<MessageDTO> selectMsgList(MessageCriteria cri) throws Exception; //  메세지 조회
	
	public int deleteMsg(Integer msgId) throws Exception; // 메세지 삭제
}
