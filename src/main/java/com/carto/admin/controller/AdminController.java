package com.carto.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.carto.admin.service.AdminService;
import com.carto.board.domain.Criteria;
import com.carto.board.domain.PageMaker;
import com.carto.member.domain.MemberDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {

	@Autowired
	AdminService adminservice;

	// 회원관리 목록
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String memberlist(@ModelAttribute("cri") Criteria cri, MemberDTO dto, Model model) throws Exception {
		log.info("member/list--------------------------");

		Object obj = adminservice.memberList(cri);
		System.out.println(obj);
		model.addAttribute("list", obj);

		// 페이징 처리 부분
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(adminservice.listCount(cri));
		model.addAttribute("pageMaker", pageMaker);

		return "admin/memberList";
	}

	// 회원 정보 수정
	@RequestMapping(value = "/member/modify", method = RequestMethod.POST)
	public String membermodifyPOST(MemberDTO dto, Model model) throws Exception {
		log.info("member/modify-----------------------");
		adminservice.modifyMember(dto);

		return "redirect:/admin/member/list";
	}

	// 회원 정보 삭제 처리 (mstate DISABLE 상태로 바꿔줌)
	@RequestMapping(value = "/member/delete", method = RequestMethod.POST)
	public String memberdelete(MemberDTO dto, Model model) throws Exception {
		log.info("member/delete-----------------------");
		int mno = (int) dto.getMno();
		adminservice.deleteMember(mno);

		return "redirect:/admin/member/list";
	}

	// 결제 내역 리스트
	@RequestMapping(value = "/pay/list", method = RequestMethod.GET)
	public String paylist(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("pay/list----------------------------------");
		log.info(cri);
		Object obj = adminservice.payAllList(cri);
		System.out.println(obj);
		model.addAttribute("list", obj);

		// 페이징 처리 부분
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(adminservice.paylistCount(cri));
		model.addAttribute("pageMaker", pageMaker);

		return "pay/AllHistory";
	}
	
}