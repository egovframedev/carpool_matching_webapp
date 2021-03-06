package com.carto.member.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.carto.board.domain.AttachfileDTO;
import com.carto.board.service.BoardService;
import com.carto.member.domain.DriverDTO;
import com.carto.member.domain.MemberDTO;
import com.carto.member.service.DriverService;
import com.carto.member.service.MemberService;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
public class DriverController {
	@Autowired
	MemberService ms;
	@Autowired
	DriverService ds;
	
	// 회원 서류 체크
	@RequestMapping(value = "/member/driver/certify", method = RequestMethod.GET)
	public String certify1(HttpSession session,Model model) throws Exception {
		log.info("member/certify1-----------------------");
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		
		DriverDTO driver=ds.getDriver((int)member.getMno());
		model.addAttribute("driver",driver);

		return "member/driver_certify1";
	}
	
	@RequestMapping(value = "/member/driver/certify2", method = RequestMethod.POST)
	public String certify2(@ModelAttribute("driver") DriverDTO driver,HttpSession session,Model model ) throws Exception {
		log.info("member/certify2-----------------------");
		MemberDTO member =(MemberDTO)session.getAttribute("login");
		driver.setMno((int)member.getMno());
		System.out.println(driver);
		model.addAttribute("driver",driver);
		return "member/driver_certify2";
		
		
	}
	
	@RequestMapping(value="/member/uploadAction", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public  ResponseEntity<String> uploadAction(MultipartFile[] uploadFile, String item, String userid) {
		List<String> list = new ArrayList<>();
		String uploadFolder = "c:\\upload\\driver\\";
		log.info("/member/uploadAction........." + item + ": " + userid);
		for (MultipartFile multipartFile : uploadFile) {
			//log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			//log.info("Upload File Size: " + multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename(); // 원본 이미지
			
			// IE 경우 파일 경로
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			String extName = uploadFileName.substring(uploadFileName.lastIndexOf("."));
			String newFileName = userid + "_" + item + extName;
			try {
				File saveFile = new File(uploadFolder, newFileName);
				multipartFile.transferTo(saveFile);
			} catch(Exception e) {
				return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			return new ResponseEntity<String>(newFileName, HttpStatus.OK);
		}
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping(value="/member/display", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> getFile(@RequestParam("filename") String FileName) {
		log.info("display ... filaname: " + FileName);
		File file = new File("c:\\upload\\driver\\" + FileName);
		log.info("file: " + file);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type",  Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(
						FileCopyUtils.copyToByteArray(file), 
						header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value="/member/driver/cetiryOk", method= RequestMethod.POST)
	public String cetiryOk(DriverDTO dto,HttpSession session ,Model model) {
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		log.info(member);
		DriverDTO driver=ds.getDriver(dto.getMno());
		if(driver != null) {
			ds.UpdateDriver(dto);
		}
		else 
			ds.insertDriver(dto);
		driver=ds.getDriver((int)member.getMno());
		model.addAttribute("driver",driver);
		
		return "member/driver_certify3";
	}
	
	@RequestMapping(value="/member/driver/vertify", method= RequestMethod.POST)
	public String verify(@RequestParam("mno")int mno,Model model) {
		DriverDTO driver = ds.getDriver(mno);
		System.out.println(driver);
		model.addAttribute("driver",driver);
		
		return "member/driver_vertify";
		
	}
	@RequestMapping(value="/member/driver/verifyOk", method= RequestMethod.POST)
	public String verifyOk(Model model,DriverDTO driver) {
		log.info("verifyOk------"+driver);
		ds.UpdateDriverVerti(driver);
		MemberDTO member= ms.getMember(driver.getMno());
		log.info("verify--------------------------------"+driver.getCar_photo_chk() + driver.getCarReg_photo_chk() + driver.getInsurance_chk() + driver.getLicense_chk());
		if(driver.getCar_photo_chk() + driver.getCarReg_photo_chk() + driver.getInsurance_chk() + driver.getLicense_chk() == 8) {
			log.info("updateROLE--------------------"+member.getUserid());
			ds.updateRole(member.getUserid());
		}
		/*model.addAttribute("driver",ds.getDriver(mno));*/
		return "redirect:/admin/member/list";
	}
	
	@RequestMapping("/getAttachList")
	@ResponseBody
	public List<DriverDTO> getAttach(@RequestParam("mno") Integer mno) throws Exception {
		return ds.getAttach(mno);
	}
}
