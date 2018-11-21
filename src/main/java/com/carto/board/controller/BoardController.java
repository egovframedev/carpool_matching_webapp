package com.carto.board.controller;

import java.beans.PropertyEditorSupport;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.carto.board.domain.BoardAttachDTO;
import com.carto.board.domain.BoardDTO;
import com.carto.board.domain.BoardType;
import com.carto.board.domain.Criteria;
import com.carto.board.domain.PageDTO;
import com.carto.board.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/{btype}/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@InitBinder
	public void initBTypeBinder(WebDataBinder binder) {
		binder.registerCustomEditor(BoardType.class, "btype", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				String capitalized = text.toUpperCase();
				BoardType btype = BoardType.valueOf(capitalized);
				setValue(btype);
			}
		});
	}
	
	// 게시글 목록 보기 
	@GetMapping("/list")
	public String list(@PathVariable("btype") String btype,
			Criteria cri, Model model) throws Exception {
		cri.setBtype(btype); // 게시판 유형 설정
		log.info("list.... " + cri);
		String viewRes = "board/list_" + btype; // 뷰 경로 설정
		
		model.addAttribute("list", service.list(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		log.info("list....end...........................................");
		return viewRes;
	}
	
	// 게시글 작성 폼
	@GetMapping("/write")
	public String registForm(@PathVariable("btype") String btype, Model model) throws Exception {
		String viewRes = "board/write_" + btype;
		log.info( btype + "- regist form .............................");
		Criteria cri = new Criteria();
		cri.setBtype(btype.toUpperCase()); // 게시판 유형 설정
		model.addAttribute("cri", cri);
		return viewRes;
	}
	

	// 게시글 등록 처리
	@PostMapping(value="/write")
	public String registPOST(@PathVariable("btype") String btype,
			BoardDTO board, RedirectAttributes rttr) throws Exception {
		log.info(btype + "- regist post .............................");
		log.info(board.toString());
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("....................................................");
		service.write(board); // 게시글 생성
		
		rttr.addFlashAttribute("result", board.getBno()); // 성공 메세지 설정
		return "redirect:/board/" + btype + "/list"; 
	}
	
	// 게시글 조회
	@GetMapping("/read")
	public String read(@PathVariable("btype") String btype,
			@RequestParam("bno") Integer bno, 
			@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info(btype + "- read get .............................");
		String viewRes = "board/read_" + btype;
		cri.setBtype(btype);
		
		model.addAttribute("board", service.detail(bno));
		
		return viewRes;
	}
	
	// 게시글 수정 폼
	@GetMapping("/modify")
	public String modifyForm(@PathVariable("btype") String btype,
			@RequestParam("bno") Integer bno, 
			@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info(btype + "- modify get .............................");
		String viewRes = "board/modify_" + btype;
		cri.setBtype(btype);
		
		model.addAttribute("board", service.detail(bno));
		
		return viewRes;
	}
	
	@PostMapping("/modify")
	public String modifyPOST(@PathVariable("btype") String btype,
			BoardDTO board, Criteria cri, RedirectAttributes rttr) throws Exception {
		cri.setBtype(btype);
		log.info(btype + "- modify post ........................." + cri.toString());
		log.info(board);
		
		service.modify(board);
		
//		rttr.addAttribute("page", cri.getPage());
//		rttr.addAttribute("perPageNum", cri.getPerPageNum());
//		if(!cri.getKeyword().isEmpty()) {
//			rttr.addAttribute("searchType", cri.getSearchType());
//			rttr.addAttribute("keyword", cri.getKeyword());
//		}
//		
		rttr.addFlashAttribute("result", "글을 수정 하였습니다."); // 성공 메세지 설정
		
		log.info(rttr.toString());
		
		return "redirect:/board/" + btype + "/list" + cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String removePost(@PathVariable("btype") String btype, Criteria cri, 
			@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		log.info(btype + "- remove post ........................" + bno);
		
		List<BoardAttachDTO> attachList = service.getAttachList(bno);
		
		service.remove(bno);
		
		// delete Attach Files
		if(!attachList.isEmpty())
			deleteFiles(attachList);
		
		rttr.addFlashAttribute("result", "글을 삭제 하였습니다.");
		return "redirect:/board/" + btype + "/list" + cri.getListLink();
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachDTO>> getAttachList(Integer bno) throws Exception {
		log.info("getAttachList " + bno);
		return new ResponseEntity<List<BoardAttachDTO>>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<BoardAttachDTO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach files.....................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("D:\\upload\\" + attach.getUploadPath() 
					+ "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("D:\\upload\\" + attach.getUploadPath() + 
							"\\s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);		
				}
			} catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		}); // end foreach
	}
	
}
