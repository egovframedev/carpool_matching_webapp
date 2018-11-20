package com.carto.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.carto.payment.domain.PaymentDTO;
import com.carto.payment.service.PaymentService;

import lombok.Data;


@Controller
public class PaymentController {
	@Autowired
	PaymentService payService;
	
	@GetMapping("pay/payment")
	public String payment(final HttpSession session) {
		/*Final Member member =(Member)session.getAttribute("member");*/
		/*member*/
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
	@GetMapping("pay/payComplete")
	public String view2() {
		return "pay/payComplete";
	}
	
	@GetMapping("pay/view3")
	public String view3(Model model) {
		List<PaymentDTO> listview = payService.selectList();
		model.addAttribute("listview",listview);
		return "pay/myhistory";
	}
	@GetMapping("pay/view4")
	public String view4() {
		return "pay/paytest";
	}
	
	
	/*@RequestMapping(value="pay/insertReg", method=RequestMethod.GET)
	public void insertRegGet(@RequestBody PaymentDTO paymentDTO) {
		System.out.println("GET pay/insertReg.............");
		System.out.println(paymentDTO.toString());
		int res=payService.insertOne(paymentDTO);
		
		// return res; 
		
	}*/
	
	/*@RequestMapping(value="pay/input", method=RequestMethod.PUT)
	@ResponseBody
	public ResponseEntity<DumyDTO> inputTest(@RequestBody DumyDTO dto) {
		ResponseEntity<DumyDTO> resultMap = null;
		try {
		if(dto.getName().isEmpty()) throw new RuntimeException("�옒紐삳맂 �엯�젰媛믪엯�땲�떎.");
		resultMap = new ResponseEntity<>(dto, HttpStatus.OK);
		} catch(Exception e) {
			resultMap = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return resultMap;
	}*/
}