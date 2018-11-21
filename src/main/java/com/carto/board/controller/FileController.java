/*package com.carto.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;
import javax.annotation.Resource;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.carto.common.util.MediaUtils;
import com.carto.common.util.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FileController {

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {

	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {
		log.info("originalName: " + file.getOriginalFilename());
		log.info("size: " + file.getSize());
		log.info("contentType: " + file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);

		return "uploadResult";
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);

		return savedName;
	}

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {

	}

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8") // 한글을
																												// 정상적으로
																												// 전송하기
																												// 위한 설정
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		log.info("originalName: " + file.getOriginalFilename());
//		log.info("size: " + file.getSize());
//		log.info("contentType: " + file.getContentType());

		// return new ResponseEntity<>(file.getOriginalFilename(), HttpStatus.CREATED);
		// HttpStatus.CREATED 원하는 리소스가 정상적으로 생성되었다는 상태 코드입니다.
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}

	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		log.info("FILE NAME: " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); // 확장자 추출
			MediaType mType = MediaUtils.getMediaType(formatName); // 이미지 타입 MIME 타입으로 생성
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			if (mType != null) { // 이미지 타입 MIME 인지 확인
				headers.setContentType(mType);
			} else { // 이미지 타입이 아니면
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); // MIME 타입을 다운용으로 사용
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\""); // 파일이름
																													// 한글
																													// 처리를
																													// 해서
																													// 전송
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), // 실제 데이터를 읽는 부분
					headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		log.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {
		log.info("delete all files: " + files);

		if (files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

		for (String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			if (mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
			}
			// 파일 삭제 방법
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
*/