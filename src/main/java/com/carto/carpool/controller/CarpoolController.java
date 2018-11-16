package com.carto.carpool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/carpool/*")
public class CarpoolController {
	
	@GetMapping("/list/{svctype}")
	public String list(@PathVariable("svctype") String svctype) {
		String view = "carpool/list_"+ svctype;
		return view;
	}
	
	// 카플 상세보기
	@GetMapping("/detail/{svctype}/{id}")
	public String detail(@PathVariable("svctype") String svctype, 
			@PathVariable("id") Integer id) throws Exception{
		String view = "carpool/detail_" + svctype;
		return view;
	}
	
	// 카플 등록 폼
	@GetMapping("/regist/{svctype}")
	public String registForm(@PathVariable("svctype") String svctype) {
		String view = "carpool/regist_" + svctype;
		return view;
	}
	
	// 카플 등록 처리
	@PostMapping("/regist/{svctype}")
	public String registPost(@PathVariable("svctype") String svctype) {
		String view = "carpool/regist_" + svctype;
		return view;
	}
	
	// 카플 수정 폼
	@GetMapping("/modify/{svctype}/{id}")
	public String modifyForm(@PathVariable("svctype") String svctype, @PathVariable("id") Integer id) {
		String view = "carpool/regist_" + svctype;
		return view;
	}
	
	// 카플 수정 처리
	@PostMapping("/modify/{svctype}")
	public String modifyPost(@PathVariable("svctype") String svctype) {
		String view = "carpool/regist_" + svctype;
		return view;
	}
	
	// 카플 삭제 처리
	@PostMapping("/remove/{svctype}/{id}")
	public String removePost(@PathVariable("svctype") String svctype, @PathVariable("id") Integer id) {
		String view = "carpool/regist_" + svctype;
		return view;
	}
	// 카플 요청
	// 카플 동승
	// 탑승 내역
	
}
