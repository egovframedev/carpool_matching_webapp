package com.carto.carpool.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carto.board.dao.BoardDAO;
import com.carto.board.domain.BoardType;
import com.carto.board.domain.Criteria;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	
	@Autowired
	BoardDAO dao;
	
	@ModelAttribute("notice")
	Object notice(@ModelAttribute("cri") Criteria cri) throws Exception {
		cri.setBtype(BoardType.NOTICE);
		Object res = dao.mainCenterList(cri);
		System.out.println("res:"+res);
		return res;
	}
	
	@ModelAttribute("faq")
	Object faq(@ModelAttribute("cri") Criteria cri) throws Exception {
		cri.setBtype(BoardType.FAQ);
		Object res = dao.mainCenterList(cri);
		System.out.println("res:"+res);
		return res;
	}
	
	@ModelAttribute("qna")
	Object qna(@ModelAttribute("cri") Criteria cri) throws Exception {
		cri.setBtype(BoardType.QNA);
		Object res = dao.mainCenterList(cri);
		System.out.println("res:"+res);
		return res;
	}

	@RequestMapping({"/", "/main"})
	public String main() throws Exception {
		log.info("MainPage------------------------");
		
		return "main";
	}
	
	@RequestMapping("/introduction")
	public String serviceIntro() {
		
		return "serviceIntro";
	}
}
