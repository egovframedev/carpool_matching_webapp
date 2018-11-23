package com.carto.member;

import javax.mail.Message;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carto.member.dao.MessageDAO;
import com.carto.member.domain.MessageCriteria;
import com.carto.member.domain.MessageDTO;
import com.carto.member.domain.MessageType;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-test-context.xml"
})
@Log4j
public class MessageDAOTests {
	@Autowired
	private MessageDAO dao;
	
	@Test
	public void testInsertMessage() throws Exception {
		MessageDTO dto = new MessageDTO();
		dto.setMsgType(MessageType.NORMAL);
		dto.setSender("rider01");
		dto.setReceiver("driver01");
		dto.setBody("테스트 메세지입니다.");
		
		dao.insertMsg(dto);	
	}
	
	@Test
	public void testGetMessage() throws Exception {
		MessageDTO dto = dao.selectMsg(5);
		
		log.info(dto);
	}
	
	@Test
	public void testDeleteMessage() throws Exception {
		dao.deleteMsg(3);
	}
	
	@Test
	public void testGetMessageList() throws Exception {
		MessageCriteria cri = new MessageCriteria();
		cri.setType(MessageType.NORMAL);
		dao.selectMsgList(cri).forEach(message -> log.info(message));
	}
}
