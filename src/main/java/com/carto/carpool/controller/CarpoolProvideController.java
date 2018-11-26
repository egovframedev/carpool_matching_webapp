package com.carto.carpool.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolInfoDTO;
import com.carto.carpool.domain.CarpoolProvideDTO;
import com.carto.carpool.domain.CarpoolRequestDTO;
import com.carto.carpool.service.CarpoolService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/carpool")
public class CarpoolProvideController {
	@Autowired
	private CarpoolService service;
	
	@InitBinder
	public void initDateTime(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm a");
		binder.registerCustomEditor(Date.class, "startDateTime", new CustomDateEditor(sdf, true));
	}
	
	@GetMapping("/provide/list")
	public String list(@ModelAttribute("cri") CarpoolCriteria cri, Model model) throws Exception {
		log.info("GET /provide/list.............");
		log.info(cri);
		String view = "carpool/list_provide";
		List<CarpoolProvideDTO> carpoolList = service.provideList(cri);
		model.addAttribute("list", carpoolList);
		//carpoolList.forEach(carpool -> log.info(carpool));
		return view;
	}
	
	@GetMapping("/provide/regist")
	public String registForm() {
		return "carpool/regist_provide";
	}
	
	@PostMapping("/provide/regist")
	public String registPost(CarpoolDTO dto) throws Exception {
		log.info("POST /provide/regist.............");
		log.info(dto);
		if( service.regist(dto) > 0) {
			return "redirect:/carpool/provide/list";
		} else {
			return null;
		}
	}
	
	@GetMapping("/provide/detail")
	public String detail(@RequestParam("cpno") Integer cpno, Model model) throws Exception {
		log.info("GET /provide/detail.............cpno:" + cpno);
		String view = "carpool/detail_provide";
		CarpoolRequestDTO cpinfo = service.detail(cpno);
		model.addAttribute("cpinfo", cpinfo);
		return view;
	}
}
