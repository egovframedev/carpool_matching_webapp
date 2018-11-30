package com.carto.board.controller;

import java.beans.PropertyEditorSupport;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.carto.board.domain.AttachfileDTO;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.BoardType;
import com.carto.board.domain.Criteria;
import com.carto.board.domain.PageMaker;
import com.carto.board.service.BoardService;
import com.carto.member.domain.MemberDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/{btype}")
@Log4j
public class BoardController {

	@Autowired
	BoardService boardservice;

	@InitBinder
	public void initBtype(WebDataBinder binder) {
		binder.registerCustomEditor(BoardType.class, "btype", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				// TODO Auto-generated method stub
				setValue(BoardType.valueOf(text.toUpperCase()));
			}
		});
	}

	// 목록 보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@PathVariable("btype") String btype, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		log.info("list-----------------------------------");

		log.info(cri.toString());
		model.addAttribute("list", boardservice.list(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(boardservice.listCount(cri));
		model.addAttribute("pageMaker", pageMaker);

		if (btype.equals("faq")) { // FAQ는 목록으로 보내줘야함
			return "board/list_" + cri.getBtype().getSmall();
		}

		return "board/list";
	}

	// 상세 보기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model, HttpSession session)
			throws Exception {
		log.info("detail---------------------------------------");
		model.addAttribute(boardservice.detail(bno));
		
		MemberDTO member=(MemberDTO)session.getAttribute("login");
		model.addAttribute("member",member);

		return "board/detail";
	}

	// 새 게시글 작성
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String registGET(@PathVariable("btype") String btype, @ModelAttribute("cri") Criteria cri, Model model, HttpSession session)
			throws Exception {
		log.info("registGET---------------------------------------");
		cri.strToBtype(btype);
		model.addAttribute("cri", cri);

		MemberDTO member=(MemberDTO)session.getAttribute("login");
		model.addAttribute("member",member);
		
		return "board/regist";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registPOST(@PathVariable("btype") String btype, @ModelAttribute("cri") Criteria cri, BoardDTO board,
			RedirectAttributes rttr) throws Exception {
		log.info("registPOST---------------------------------------");
		cri.strToBtype(btype);
		log.info(board.toString());

		boardservice.regist(board);

		rttr.addFlashAttribute("msg", "SUCCESS"); // 성공 메세지 설정

		if (btype.equals("faq")) { // FAQ는 목록으로 보내줘야함
			return "redirect:/board/" + btype + "/list";
		}

		return "redirect:/board/" + btype + "/detail?bno=" + board.getBno();
	}

	// 게시물 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyPageGET(@PathVariable("btype") String btype, int bno, @ModelAttribute("cri") Criteria cri,
			Model model) throws Exception {
		log.info("modifyGET--------------------------");
		cri.strToBtype(btype);
		model.addAttribute(boardservice.detail(bno));

		return "board/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPagePOST(@PathVariable("btype") String btype, BoardDTO board, Criteria cri,
			RedirectAttributes rttr) throws Exception {
		log.info("modifyPOST--------------------------------");
		cri.strToBtype(btype);
		log.info(cri.toString());

		boardservice.modify(board);

		rttr.addFlashAttribute("msg", "SUCCESS"); // 성공 메세지 설정

		log.info(rttr.toString());

		if (btype.equals("faq")) { // FAQ는 목록으로 보내줘야함
			return "redirect:/board/" + btype + "/list";
		}

		return "redirect:/board/" + btype + "/detail?bno=" + board.getBno();
	}

	// 게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@PathVariable("btype") String btype, @RequestParam("bno") int bno, Criteria cri)
			throws Exception {
		log.info("delete------------------------------------");
		cri.strToBtype(btype);
		boardservice.delete(bno);

		if (btype.equals("faq")) { // FAQ는 목록으로 보내줘야함
			return "redirect:/board/" + btype + "/list";
		}

		return "redirect:/board/" + btype + "/list";
	}

	// 답글 작성 QNA만 사용
	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String replyGET(@PathVariable("btype") String btype, @ModelAttribute("cri") Criteria cri, BoardDTO board,
			Model model, HttpSession session) throws Exception {
		log.info("replyGET---------------------------------------");
		cri.strToBtype(btype);
		model.addAttribute("cri", cri);
		
		MemberDTO member=(MemberDTO)session.getAttribute("login");
		model.addAttribute("member",member);
		
		return "board/reply";
	}

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String replyPOST(@PathVariable("btype") String btype, @ModelAttribute("cri") Criteria cri, BoardDTO board,
			RedirectAttributes rttr) throws Exception {
		log.info("replyPOST---------------------------------------");
		cri.strToBtype(btype);
		log.info(board.toString());

		boardservice.reply(board);
		
		rttr.addFlashAttribute("msg", "SUCCESS"); // 성공 메세지 설정

		return "redirect:/board/" + btype + "/detail?bno=" + board.getBno();
	}

	@RequestMapping("/getAttachList")
	@ResponseBody
	public List<AttachfileDTO> getAttach(@RequestParam("bno") Integer bno) throws Exception {
		return boardservice.getAttach(bno);
	}

}