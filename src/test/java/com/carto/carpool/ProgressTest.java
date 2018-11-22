package com.carto.carpool;

import static org.junit.Assert.*;

import org.junit.Test;

import com.carto.carpool.domain.Progress;

import lombok.extern.log4j.Log4j;

@Log4j
public class ProgressTest {

	@Test
	public void test() {
		Progress pros = Progress.CONFIRM;
		
		log.info("이름: " + pros.name());
		log.info("상태: " + pros.getStatus());
		log.info("번호: " + pros.ordinal());
		
	}

}
