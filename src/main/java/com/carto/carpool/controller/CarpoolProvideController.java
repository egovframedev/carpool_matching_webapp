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
import org.springframework.web.bind.annotation.RequestMapping;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolInfoDTO;
import com.carto.carpool.domain.CarpoolProvideDTO;
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		binder.registerCustomEditor(Date.class, "startDateTime", new CustomDateEditor(sdf, true));
	}
	
	@GetMapping("/provide/list")
	public String list(@ModelAttribute("cri") CarpoolCriteria cri, Model model) throws Exception {
		log.info("GET /provide/list.............");
		String view = "carpool/list_provide";		
		List<CarpoolProvideDTO> carpoolList = service.provideList(cri);
		model.addAttribute("list", carpoolList);
		//carpoolList.forEach(carpool -> log.info(carpool));
		return view;
	}
}
