package com.carto.member.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.carto.member.domain.MemberDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberDAO dao;
	
	@Test
	public void testRead() {
		log.info("testRead() ....1");
		MemberDTO getDto = dao.readById("cartoadmin");
		
		log.info(getDto);
		log.info("testRead() ....2");
		getDto.getAuthList().forEach(authDTO -> log.info(authDTO));
	}

}
