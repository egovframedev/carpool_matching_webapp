package com.carto.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

/* 업로드 기능 클래스
 * 1. 파일 저장 경로(uploadPath)
 * 2. 원본 파일의 이름(originalName)
 * 3. 파일 데이터(byte[])
 */
public class UploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	/**
	 * 업로드 파일 처리 메소드
	 * @param uploadPath   파일 저장 경로
	 * @param originalName 원본 파일 이름
	 * @param fileData     파일 데이터(byte[])
	 * @return String
	 * @throws Exception
	 */
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID(); // UUID를 이용한 고유한 값 생성
		String savedName = uid.toString() + "_" + originalName; // UUID와 결합한 업로드 파일 이름 생성
		 
		String savedPath = calcPath(uploadPath); // 파일이 저장될 폴더('년/월/일') 정보 생성
		
		File target = new File(uploadPath + savedPath, savedName); // 업로드 기본 경로와 '년/월/일' 폴더 생성
		
		FileCopyUtils.copy(fileData, target); // 기본경로 + 폴더 경로 + 파일이름으로 원본 파일을 저장
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1); // 확장자 
		
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null) { //  저장한 파일이 이미지 타입의 파일이면
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName); // 썸네일 이미지 생성.
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
	/**
	 * 아이콘 만들기
	 * @param uploadPath
	 * @param savedPath
	 * @param savedName
	 * @return
	 */
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	/**
	 * 업로드 폴더의 생성처리
	 * @param uploadPath 파일 저장 경로
	 * @return 생성된 업로도 폴더 경로
	 */
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR); // /2018
		String monthPath = yearPath + File.separator 
						+ new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator
						+ new DecimalFormat("00").format(cal.get(Calendar.DATE));
		// 디렉토리 생성
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	/**
	 * 디렉토리 생성 처리 메소드
	 * @param uploadPath 업로드 폴더 경로
	 * @param paths  생성할 경로명
	 */
	private static void makeDir(String uploadPath, String...paths) {
		if(new File(paths[paths.length - 1]).exists()) {
			return ;
		}
		
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(! dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	/**
	 * 썸네일 이미지 생성하기
	 * @param uploadPath
	 * @param path
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg = Scalr.resize(sourceImg, 
				Scalr.Method.AUTOMATIC,	Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // 확장자 이름
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
				
	}
}
