package com.carto.board.controller;

import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.carto.board.domain.BoardVO;
import com.carto.board.domain.PageMaker;
import com.carto.board.domain.SearchCriteria;
import com.carto.board.service.BoardService;

@Controller
@RequestMapping("/board/{btype}/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	// 목록 보기 
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@PathVariable("btype") String btype,
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		cri.setBtype(btype);
		
		logger.info(cri.toString());		
		model.addAttribute("list", service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listCount(cri));		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
	}
	
	// 상세 보기
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read(@PathVariable("btype") String btype, 
			@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		cri.setBtype(btype);
		
		model.addAttribute(service.read(bno));
		return "board/read";
	}
	
	// 새글 작성
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String registGET(@PathVariable("btype") String btype, Model model) throws Exception {
		logger.info("write get .............................");
		SearchCriteria cri = new SearchCriteria();
		cri.setBtype(btype);
		model.addAttribute("cri", cri);
		return "board/write";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("write get .............................");
		logger.info(board.toString());
		
		service.regist(board);
		
		rttr.addFlashAttribute("msg", "SUCCESS"); // 성공 메세지 설정
		
		return "redirect:/board/list";
	}
	
	// 게시물 수정 처리
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyPageGET(@PathVariable("btype") String btype, int bno, 
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		cri.setBtype(btype);
		model.addAttribute(service.read(bno));
		return "board/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPagePOST( @PathVariable("btype") String btype,
			BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		cri.setBtype(btype);
		logger.info(cri.toString());
		
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS"); // 성공 메세지 설정
		
		logger.info(rttr.toString());
		
		return "redirect:/board/list";
	}
	
	
	@RequestMapping("/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno") Integer bno) throws Exception {
		return service.getAttach(bno);
	}	
}
