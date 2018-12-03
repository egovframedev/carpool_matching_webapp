package com.carto.address.controller;

import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.carto.address.domain.AddressDTO;
import com.carto.address.service.AddressService;
import com.carto.member.domain.MemberDTO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AddressController {

	@Inject
	private AddressService addressService;

	// 주소목록
	@RequestMapping(value = "/address", produces = "application/json; charset=utf8")
	@ResponseBody
	public ModelAndView adresslist(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
		if (member != null) {
			List<AddressDTO> addressList = addressService.adressListService(member.getMno());
			mav.setViewName("/address/address");
			mav.addObject("list", addressList);
			log.info("mno값 ================>>>" + member.getMno());
			return mav;
		}
		log.info("세션 없이 주소등록에 접근 불가 _ 비인가 사용자입니다.");
		response.sendRedirect(request.getContextPath() + "/login");
		return null;
	}

	// 주소 저장(AJAX)
	@RequestMapping(value = "/addressSave")
	@ResponseBody
	public int addressSave(AddressDTO address, HttpSession session) throws Exception {
		return addressService.addressInsertService(address);
	}

	// 주소 이름 편집
	@RequestMapping(value = "/addrNameEdit")
	public void addressNameEdit(AddressDTO address) throws Exception {
		addressService.addressNameUpdate(address);
	}

	// 주소 삭제
	@RequestMapping(value = "/deleteAddress", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteAddress(@RequestParam(value = "checkArray[]") List<Integer> deleteList, @ModelAttribute("AddressDTO") AddressDTO addressdto, ModelMap model) throws Exception {
		ArrayList<Integer> deleteArray = new ArrayList<>();
		for (int i = 0; i < deleteList.size(); i++) {
			deleteArray.add(deleteList.get(i));
			System.out.println(deleteArray.size());
		}
		addressService.addressDeleteService(deleteArray);
		return "redirect:/address";
	}
}
