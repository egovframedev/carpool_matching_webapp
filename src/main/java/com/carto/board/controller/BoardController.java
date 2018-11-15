package com.carto.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/{service}")
public class BoardController {
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String registForm() {
		return null;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String registPost() {
		return null;
	}
 }
