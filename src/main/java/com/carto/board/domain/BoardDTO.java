package com.carto.board.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardDTO {
	private Integer bno;     // 글 번호
	private BoardType bType; // 게시판 구분
	private String title;    // 글 제목
	private String content;  // 글 내용
	private String writer;   // 작성자
	private String pwd;      // 비공개시 암호
	private Date regDate;   // 작성일
	private int grpNo;       // 답변그룹
	private int step;        // 답변순서
	private int depth;       // 답변깊이
	private int hit;         // 조회수
	
	private List<AttachFileDTO> attachList; // 첨부파일들
}
