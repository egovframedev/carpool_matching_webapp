package com.carto.carpool.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.carto.carpool.domain.CarpoolMatchDTO;
import com.carto.carpool.domain.PaymentDTO;
import com.carto.carpool.service.CarpoolMatchService;
import com.carto.carpool.service.PaymentService;
import com.carto.member.domain.MemberDTO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class PaymentController {
	@Autowired
	PaymentService payService;
	@Autowired
	CarpoolMatchService cmService;
	
	// 결제 화면
	@RequestMapping(value="/pay/payment", method=RequestMethod.POST)
	public String paymentForm(HttpSession session,
			@RequestParam("driver") Integer driverNo, 
			@RequestParam("matchno") Integer matchno, Model model) {
		log.info("POST /pay/payment ...... " + driverNo + " - " + matchno);
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		MemberDTO driver = (MemberDTO)cmService.SelectDriver(driverNo);
		log.info(driver);
		CarpoolMatchDTO cpjoin = (CarpoolMatchDTO)cmService.selectMatInfo((int)member.getMno(), matchno);
		model.addAttribute("cpjoin",cpjoin);
		model.addAttribute("driver", driver);
		log.info(cpjoin);
		model.addAttribute("member",member);
		return "pay/paytest";
	}
	
	// 결제 처리
	@RequestMapping(value="pay/insertReg", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> insertReg(@RequestBody PaymentDTO paymentDTO, HttpSession session) {
		log.info("pay/insertReg............." + paymentDTO);
		
		int res = payService.insertOne(paymentDTO);
		if(res > 0) {
			log.info("paymentDTO Payno: " + paymentDTO.getPayno());
			cmService.updateCom(paymentDTO.getPayno(), paymentDTO.getMatchno());
			return new ResponseEntity<String>("SUCESS", HttpStatus.OK);
		}
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	// 결제 완료 화면
	@GetMapping("pay/complete") 
	public String complete(@RequestParam("id") String payno, Model model,HttpSession session) {
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		int mno= (int)member.getMno();
		CarpoolMatchDTO cpjoin = (CarpoolMatchDTO) cmService.selectMatInfoByPayno(payno, mno);
		System.out.println(cpjoin.toString());
		model.addAttribute(cpjoin);
		log.info("cpjoin getmno:" + cpjoin.getMno());
		log.info("cpjoin toString:" + cpjoin.toString());
		log.info("model toString:" + model.toString());		
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
	
}