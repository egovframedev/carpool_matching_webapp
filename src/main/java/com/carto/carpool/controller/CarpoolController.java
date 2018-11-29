package com.carto.carpool.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.carto.carpool.domain.CPMatchingDTO;
import com.carto.carpool.domain.CarpoolCriteria;
import com.carto.carpool.domain.CarpoolDTO;
import com.carto.carpool.domain.CarpoolProvideDTO;
import com.carto.carpool.domain.CarpoolRequestDTO;
import com.carto.carpool.domain.MyCarpoolDTO;
import com.carto.carpool.domain.Paging;
import com.carto.carpool.service.CarpoolService;
import com.carto.member.domain.MemberDTO;

import lombok.extern.log4j.Log4j;

/**
 * 카풀 요청 컨트롤러
 * @author CodingBear
 * @since 2018.11.22
 */
@Log4j
@Controller
@RequestMapping("/carpool")
public class CarpoolController {
	@Autowired
	private CarpoolService service;
	
	@InitBinder
	public void initDateTime(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd - a KK:mm");
		binder.registerCustomEditor(Date.class, "startDateTime", new CustomDateEditor(sdf, true));
	}
	
	private String carpoolType(String uri) {
		if(uri.indexOf("/carpool/request") > -1) {
			return "request";
		} else if(uri.indexOf("/carpool/provide") > -1) {
			return "provide";
		}
		return null;
	}
	
	// 카풀 요청 리스트
	@GetMapping("/request/list") 
	public String requestList(CarpoolCriteria cri, Model model) throws Exception {
		log.info("GET /request/list.............");
		
		Paging paging = new Paging();
		
		cri.setCarpoolType(CarpoolDTO.REQUEST);
		paging.setCri(cri);
		paging.setTotalCount(service.countList(cri));
		model.addAttribute("list", service.requestList(cri));
		model.addAttribute("paging", paging);
		//log.info(paging);
		return "carpool/list_request";
	}
	
	// 카풀 제공 리스트
	@GetMapping("/provide/list")
	public String provideList(CarpoolCriteria cri, Model model) throws Exception {
		log.info("GET /provide/list.............");
		
		Paging paging = new Paging();
		cri.setCarpoolType(CarpoolDTO.PROVIDE);
		paging.setCri(cri);
		paging.setTotalCount(service.countList(cri));
		model.addAttribute("list", service.provideList(cri));
		model.addAttribute("paging", paging);		
		return "carpool/list_provide";
	}
	
	// 카풀 정보 등록 폼
	@GetMapping({"/request/regist", "/provide/regist"})
	public String registForm(HttpServletRequest request) {
		String cpType = carpoolType(request.getRequestURI());
		log.info("GET /"+ cpType + "/regist.............");
	
		return "carpool/regist_" + cpType;
	}
	
	// 카풀 정보 등록 처리
	@PostMapping({"/request/regist", "/provide/regist"})
	public String registPost(CarpoolDTO dto, RedirectAttributes rttr, 
			Model model, HttpServletRequest request) throws Exception {
		String cpType = carpoolType(request.getRequestURI());
		log.info("POST /" + cpType + "/regist.............");
		log.info(dto);
		if(service.regist(dto) > 0) {
			rttr.addAttribute("result", "SUCCESS");
			rttr.addAttribute("msg", "카풀 정보를 등록하였습니다.");
			return "redirect:/carpool/" + cpType + "/list";
		} else {
			model.addAttribute("result", "FAILE");
			return "carpool/regist_" + cpType;
		}
	}
	
	// 카풀 정보 보기
	@GetMapping({"/request/detail","/provide/detail"})
	public String detail(@RequestParam("cpno") Integer cpno, 
			@ModelAttribute("cri") CarpoolCriteria cri, 
			Model model, HttpServletRequest request) throws Exception {
		String cpType = carpoolType(request.getRequestURI());
		log.info("GET /" + cpType +"/detail.............cpno:" + cpno);
		if(cpType.equals("provide")) {
			model.addAttribute("cpinfo", (CarpoolProvideDTO)service.detail(cpno, cpType));
		} else {
			model.addAttribute("cpinfo", service.detail(cpno, cpType));			
		}
		return "carpool/detail_" + cpType;
	}
	
	// 카풀 매칭 서비스
	@GetMapping({"/request/getMatching", "/provide/getMatching"})
	public String getMatching(@RequestParam("cpno") Integer cpno, 
			Model model, HttpServletRequest request) throws Exception {
		String cpType = carpoolType(request.getRequestURI());
		log.info("GET /request/getMatching.............cpno:" + cpno);
		CarpoolDTO carpool = service.detail(cpno, "request");
		List<CPMatchingDTO> matchList = service.matchingList(cpno);
		matchList.forEach(match -> log.info(match));
		model.addAttribute("carpool", carpool);
		model.addAttribute("matchList", matchList);
		return "carpool/matching_request";
	}
	
	// AJAX 카풀
	@PostMapping({"/request/requestMatching", "/provide/requestMatching"})
	@ResponseBody
	public ResponseEntity<String> requestMatching(@RequestBody CPMatchingDTO dto, 
			HttpServletRequest request) throws Exception {
		String cpType = carpoolType(request.getRequestURI());
		log.info("AJAX /"+ cpType + "/requestMatching......");
		HttpSession session =  request.getSession();

		if(session.getAttribute("login") != null) {
			MemberDTO member = (MemberDTO) session.getAttribute("login");
			dto.setMno((int) member.getMno());
			dto.setDriverChk(cpType.equals("request"));
			dto.calcPaysum(); // 결제금액 계산
			log.info(dto);
			if( service.registCpMatch(dto) > 0 )
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	// 카풀 동승
	@GetMapping("/riding")
	public String ridingView(HttpSession session, Model model) throws Exception {
		log.info("GET /carpool/ridingView ...... ");
		if(session.getAttribute("login") != null) {
			MemberDTO member = (MemberDTO) session.getAttribute("login");
			List<MyCarpoolDTO> list = service.getMyCarpoolList((int)member.getMno());
			// list.forEach(carpool -> log.info(carpool));
			model.addAttribute("list", list);
		}
		return "carpool/riding_view";
	}
	
	@PostMapping("/confirmMatching")
	@ResponseBody
	public ResponseEntity<String> confirmMatching(@RequestBody CPMatchingDTO dto, 
			HttpSession session) throws Exception {
		log.info("AJAX /confirmMatching......");

		if(session.getAttribute("login") != null) {
			service.confirmMatching(dto.getMatchno());			
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
}
