package com.carto.carpool.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.carto.carpool.domain.PaymentDTO;
import com.carto.carpool.service.PaymentService;
import com.carto.member.domain.MemberDTO;

@Controller
public class PaymentController {
	@Autowired
	PaymentService payService;
	@Autowired
	CarpoolMatchService cmService;
	
	@GetMapping("pay/payment")
	public String payment(final HttpSession session,Model model) {
		/*Final Member session =(Member)session.getAttribute("member");*/
		/* int num= member.mno*/
		int num=1;
		MemberDTO driver= (MemberDTO)cmService.SelectDriver(num);
		Cp_joinVO cpjoin =(Cp_joinVO)cmService.selectMatInfo(num);
		/*MemberDTO member = MemberService.viewMemeber(session);*/
		
		model.addAttribute("driver",driver);
		model.addAttribute("cpjoin",cpjoin);
		//model.addAttribute("member",member);
		
		return "pay/paytest";
	}
	@RequestMapping(value="pay/insertReg",method={RequestMethod.POST})
	@ResponseBody
	public String insertReg(@RequestBody PaymentDTO paymentDTO) {
		System.out.println(paymentDTO);
		int res=payService.insertOne(paymentDTO);
		System.out.println("res :"+res);
		return "pay/paymentTemp"; 
		
	}
	@GetMapping("pay/complete") 
	public String complete(String no,Model model) {
		System.out.println(no);
		Cp_joinVO cpjoin =(Cp_joinVO)cmService.selectMatInfoByPayno(no);
		System.out.println(cpjoin.toString());
		model.addAttribute(cpjoin);
		
		return "pay/payComplete";
	}
	
	@GetMapping("pay/view3")
	public String view3(Model model) {
		List<PaymentDTO> listview = payService.selectList();
		model.addAttribute("listview",listview);
	}
	@GetMapping("pay/view4")
	public String view4() {
		return "pay/paytest";
	}
}