package com.carto.board.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private Integer fileNo;          // 파일번호
	private Integer bno;          // 게시글 번호
	private String fileName;      // 파일이름
	private String originalName;  // 원본파일이름
	private String uploadPath;    // 업로드위치
	private String extension;     // 확장자
	private int downloadCnt;      // 다운로드 수
}
