package com.carto.carpool.controller;

import java.util.List;
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
import com.carto.carpool.domain.ReviewDTO;
import com.carto.carpool.service.CarpoolMatchService;
import com.carto.carpool.service.PaymentService;
import com.carto.member.domain.MemberDTO;
import com.carto.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class PaymentController {
	@Autowired
	PaymentService payService;
	
	@Autowired
	CarpoolMatchService cmService;
	
	@Autowired
	MemberService memService;
	
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
		return "carpool/pay_start";
	}
	
	// 결제 처리
	@RequestMapping(value="pay/insertReg", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> insertReg(@RequestBody PaymentDTO payDTO, HttpSession session) {
		log.info("POST pay/insertReg............." + payDTO);
		
		int res = payService.registPay(payDTO);
		if(res > 0) {
			log.info("paymentDTO Payno: " + payDTO.getPayno());
			cmService.updateCom(payDTO.getPayno(), payDTO.getMatchno());
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	// 결제 완료 화면
	@GetMapping("pay/complete") 
	public String complete(@RequestParam("id") String payno, Model model, 
			HttpSession session) throws Exception {
		log.info("GET pay/complete..........");
		if(session.getAttribute("login") == null) {
			// TODO : 로그인이 되어 있지 않으면 처리
		}
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		// 결제 정보 가져오기
		PaymentDTO payDTO = payService.getPayment(payno);
		log.info("paymentDTO....." + payDTO);
//		if(payDTO.getPayerNo() != (int)member.getMno()) {
//			// TODO : 결제자와 로그인한 회원번호와 비교하여 같지 않으면 처리.
//		}
		//log.info(payDTO.getMatchno());
		CarpoolMatchDTO cpjoin = payService.getCPMatch(payDTO.getMatchno());
		log.info("CarpoolMatchDTO : " + cpjoin);
		model.addAttribute("payDTO", payDTO);
		model.addAttribute("cpjoin", cpjoin);
		log.info(cpjoin);
		
		return "carpool/pay_result";
	}
	
	@GetMapping("pay/reviewPost")
	public String complet(ReviewDTO dto, HttpSession session) throws Exception {
		if(session.getAttribute("login") == null) {
			// TODO : 로그인이 되어 있지 않으면 처리
		}
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		
		return "redirect:/carpool/riding";
	}
}