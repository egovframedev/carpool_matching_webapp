package com.carto.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Integer bno;     // 글 번호
	private String title;    // 글 제목
	private String content;  // 글 내용
	private String writer;   // 작성자
	private Date regDate;    // 작성일
	private int hit;         // 조회수
	
	private int replycnt;    // 댓글 갯수
	private String[] files;  // 첨부 파일
}
