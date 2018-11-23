package com.carto.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.carto.member.domain.MessageDTO;
import com.carto.member.service.MessageService;

@RestController
@RequestMapping("/messages/*")
public class MessageController {
	@Autowired
	private MessageService service;
	
	/**
	 * ResponseEntity : HTTP상태코드 + 데이터 전달
	 * @RequestBody   : 클라이언트 -> 서버(json 데이터가 입력될 때)
	 * @ResponseBody  : 서버 -> 클라이언트 (json) @RestController 에서는 생략 가능
	 */
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> sendMessage(@RequestBody MessageDTO dto) {
		ResponseEntity<String> entity = null;
		try {
			service.sendMessage(dto);
			// new ResponseEntity<자료형>(리턴값, HTTP상태코드);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
