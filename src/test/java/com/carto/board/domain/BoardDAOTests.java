package com.carto.board.domain;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carto.board.dao.BoardDAO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDAOTests {
	@Setter(onMethod_ = @Autowired)
	private BoardDAO dao;
	
	@Test
	public void testCreate() throws Exception {
		log.info("testCreate()......"); 
		BoardDTO dto = new BoardDTO();
		dto.setTitle("새로운 글을 넣습니다.");
		dto.setContent("새로운 글 내용을 넣습니다.");
		dto.setWriter("cartoadmin");
		dto.setPwd("1234");
		dao.create(dto);
	}
	
	@Test
	public void testList() throws Exception {
		log.info("testList() ....");
		List<BoardDTO> dtoList = dao.list();
		for(BoardDTO dto: dtoList) {
			log.info(dto);
		}
	}

}
