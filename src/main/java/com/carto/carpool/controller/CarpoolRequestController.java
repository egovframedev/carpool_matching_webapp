package com.carto.carpool.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.service.CarpoolService;

import lombok.extern.log4j.Log4j;

/**
 * 카풀 요청 컨트롤러
 * @author CodingBear
 * @since 2018.11.22
 */
@Log4j
@Controller
@RequestMapping("/carpool/*")
public class CarpoolRequestController {
	@Autowired
	private CarpoolService service;
	
	@InitBinder
	public void initDateTime(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		binder.registerCustomEditor(Date.class, "startDateTime", new CustomDateEditor(sdf, true));
	}
	
	// 카풀 요청 리스트
	@GetMapping("/request/list") 
	public String list() {
		log.info("GET /request/list.............");
		String view = "carpool/list_request";
		return view;
	}
	
	@GetMapping("/request/regist")
	public String registForm() {
		log.info("GET /request/regist.............");
		String view = "carpool/regist_request";
		return view;
	}
	
	@PostMapping("/request/regist")
	public String registPost(CarpoolDTO dto) throws Exception {
		log.info("POST /request/regist.............");
		log.info(dto);
		if( service.regist(dto) > 0) {
			return "redirect:/carpool/request/list";
		} else {
			return null;
		}
	}
}
