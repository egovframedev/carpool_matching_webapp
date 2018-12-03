package com.carto.member.controller;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.carto.member.domain.LoginDTO;
import com.carto.member.domain.MemberDTO;
import com.carto.member.domain.NotAuthorizedUserException;
import com.carto.member.domain.WithdrawalUserException;
import com.carto.member.service.MemberService;
import com.carto.member.service.MemberServiceImpl;
import com.carto.member.util.RegisterRequest;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	// 1. 약관
	@RequestMapping(value = "/member/join/step1")
	public String memberTerms() throws Exception {
		return "member/register/termsform";
	}

	// 2. 가입폼
	@RequestMapping("/member/join/step2")
	public ModelAndView step2(@RequestParam(value = "agree", defaultValue = "false") Boolean agree) throws Exception {
		if (!agree) {
			ModelAndView mv = new ModelAndView("member/register/termsform");
			return mv;
		}
		ModelAndView mv = new ModelAndView("member/register/joinform");
		mv.addObject("registerRequest", new RegisterRequest());
		return mv;
	}

	// 3. 회원 가입 처리
	@RequestMapping(value = "/member/join/step3", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberDTO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		rttr.addFlashAttribute("result", service.join_member(member, response));
		return "member/register/member_join";
	}

	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "/check_id", method = RequestMethod.POST)
	public void check_id(@RequestParam("userid") String id, HttpServletResponse response) throws Exception {
		service.check_id(id, response);
	}

	// 이메일 중복 검사(AJAX)
	@RequestMapping(value = "/check_email", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception {
		service.check_email(email, response);
	}

	// 회원 인증
	@RequestMapping(value = "/approval_member", method = RequestMethod.POST)
	public void approval_member(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception {
		service.approval_member(member, response);
	}

	// 로그인 폼
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(@ModelAttribute("dto") LoginDTO dto) {
		return "member/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPost(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) {
		log.info("POST /loginPost ..... " + dto);
		MemberDTO loginMember = null;
		try {
			loginMember = service.login(dto);
			log.info(loginMember);
			if (loginMember == null)
				return "redirect:/login";
			if (dto.isUseCookie()) {
				int amount = 60 * 60 * 24 * 7;
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
				service.keepLogin(loginMember.getUserid(), session.getId(), sessionLimit);
			}

			model.addAttribute("memberDTO", loginMember);

		} catch (NotAuthorizedUserException e) {
			log.info("비인가 사용자 입니다.");
			rttr.addFlashAttribute("error", "등록하신 이메일을 통하여 인증바랍니다.");
			return "redirect:/login";
		} catch (WithdrawalUserException e) {
			log.info("탈퇴한 회원 입니다.");
			rttr.addFlashAttribute("error", "존재하지 않은 계정이거나 잘못 입력하였습니다.");
			return "redirect:/login";
		} catch (NullPointerException e) {
			rttr.addFlashAttribute("error", "존재하지 않은 계정이거나 잘못 입력하였습니다.");
			return "redirect:/login";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 회원 정보 수정
	@RequestMapping(value = "/member/myprofile")
	public ModelAndView memberProfile(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		System.out.println("memberid: " + member.getUserid());
		ModelAndView mav = new ModelAndView();
		member = service.selectMember(member.getUserid());
		if (member != null) {
			mav.setViewName("member/profile");
			mav.addObject("memberlist", member);
			log.info("mno값 ================>>>" + member.getMno());
			return mav;
		}
		log.info("세션 없이 프로필에 접근 불가 _ 비인가 사용자입니다.");
		response.sendRedirect(request.getContextPath() + "/login");
		return null;
	}

	// 회원정보 수정(AJAX)
	@RequestMapping(value = "/member/myprofile/modify", method = RequestMethod.POST)
	@ResponseBody
	public void modify_profile(@ModelAttribute MemberDTO member, HttpServletResponse response, HttpSession session) throws Exception {
		log.info("프로필 수정 컨트롤러 진입");
		MemberDTO logMem = (MemberDTO) session.getAttribute("login");
		String logEmail = logMem.getEmail();
		System.out.println("로그인 이메일 : " + logMem.getEmail());
		System.out.println("수정된 이메일 : " + member.getEmail());
		service.updateProfile(response, member, logEmail);
	}

	// ID/ PW FIND FORM
	@RequestMapping(value = "/member/find/idpw")
	public String findIdPw() {
		return "/member/findidpw/idpw";
	}

	// FIND ID
	@RequestMapping(value = "/member/find/id", method = RequestMethod.POST)
	public String findId(@ModelAttribute MemberDTO member, HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
		member.setEmail(request.getParameter("id_email"));
		member.setName(request.getParameter("id_name"));
		System.out.println(member.toString());
		model.addAttribute("userfindid", service.findId(member, response));
		model.addAttribute("name", member.getName());

		return "/member/findidpw/idpw";
	}

	// FIND PASSWORD
	@RequestMapping(value = "/member/find/pw", method = RequestMethod.POST)
	@ResponseBody
	public void find_pw(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception {
		service.findpw(response, member);
	}

	// 비밀번호 변경
	@RequestMapping(value = "/member/updatePw", method = RequestMethod.POST)
	public void update_pw(@ModelAttribute MemberDTO member, @RequestParam("oldpw") String oldpw, HttpSession session, HttpServletResponse response) throws Exception {
		session.setAttribute("member", service.updatePw(member, oldpw, response));
	}

	// 회원 탈퇴
	@RequestMapping(value = "/member/withdrawal", method = RequestMethod.POST)
	public void withdrawal(@ModelAttribute MemberDTO member, HttpSession session, HttpServletResponse response) throws Exception {
		if (service.withdrawal(member, response)) {
			session.invalidate();
		}
	}

}
