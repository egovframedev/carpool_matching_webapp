package com.carto.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.carto.board.domain.AttachfileDTO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class FileController {
	@GetMapping("/uploadForm")
	public String upload() {
		log.info("upload form ...");
		return "upload/uploadForm";
	}
	
	@PostMapping("/uploadFormAction")
	public String uploadFormPost(MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "D:\\upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			log.info("Uplaod File Type: " + multipartFile.getContentType());
			
			// 업로드 폴더, 원본파일이름을 인자로 파일 생성
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for
		return "upload/uploadAction";
	} 
	
	// Ajax를 이용하는 파일 업로드
	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		log.info("upload ajax ...");
		return "upload/uploadAjax";
	}
	
	@PostMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachfileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("upload ajax post ..........");
		List<AttachfileDTO> list = new ArrayList<>();	
		String uploadFolder = "D:\\upload";
		
		String uploadFolderPath = getFolder(); // 년/월/일 폴더생성
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		// log.info("upload path: " + uploadPath);
		
		if(uploadPath.exists() == false) { // 해당 폴더 경로가 없으면..
			uploadPath.mkdirs(); // yyyy/MM/dd 형식으로 폴더 생성
		} 
				
		for (MultipartFile multipartFile : uploadFile) {
			AttachfileDTO attachDTO = new AttachfileDTO();
			log.info("-----------------------------------------------");
			//log.info("Upload File Name: " + multipartFile.getOriginalFileName());
			//log.info("Upload File Size: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE 경우 파일 경로
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFilename(uploadFileName);
			
			// 중복 방지를 위한 UUID 적용
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
					
			//File saveFile = new File(uploadFolder, uploadFileName);		
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				log.info("saveFile name : "+ saveFile);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadpath(uploadFolderPath);
				
				// 업로드된 파일이 이미지 종류의 파일인지 확인
				if(checkImageType(saveFile)) {
					attachDTO.setImage(true);
					// 이미지 파일의 경우 섬네일 이미지 생성 및 저장
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				// add to list
				list.add(attachDTO);
			} catch (Exception e) {
				//log.error(e.getMessage());
				e.printStackTrace();
			} // end catch
		} // end for
		return new ResponseEntity<List<AttachfileDTO>>(list, HttpStatus.OK);
	}
	
	// 년/월/일 폴더의 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	// 이미지 파일 판단
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath()); // 컨텐츠 타입 가져오기
			return contentType.startsWith("image");
		} catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// 섬네일 이미지 보여주기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(@RequestParam("filename") String FileName) {
		log.info("display ... filaname: " + FileName);
		File file = new File("D:\\upload\\" + FileName);
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
	
	// 첨부파일의 다운로드
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(
			@RequestHeader("User-Agent") String  userAgent,@RequestParam("filename") String FileName) {
		log.info("download file: " + FileName);
		Resource resource = new FileSystemResource("d:\\upload\\" + FileName);
		log.info("resource: " + resource);
		
		if(resource.exists() == false) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		// UUID 제거
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			
			if(userAgent.contains("Trident")) {
				log.info("IE Browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			} else if(userAgent.contains("Edge")) {
				log.info("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else {
				log.info("Chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
			}
			log.info("downloadName: " + downloadName);
			
			headers.add("Content-Disposition", "attachment; FileName=" + downloadName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

	// 첨부파일의 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(@RequestParam("filename") String FileName, String type) {
		log.info("deleteFile: " + FileName);
		File file = null;
		try {
			file = new File("d:\\upload\\" + URLDecoder.decode(FileName, "UTF-8"));
			file.delete();
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName: " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}