package com.carto.board.domain;

import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {
	private Integer bno;     // 글 번호
	private String title;    // 글 제목
	private String content;  // 글 내용
	private String writer;   // 작성자
	private Date regdate;    // 작성일
	private int viewcnt;     // 조회수
	private int replycnt;    // 댓글 갯수
	private int grpNo;       // 답변 그룹
	private int step = 0;    // 답변 순서
	private int detph = 0;   // 답변 깊이(단계)
	private int btype = 0;   // 게시판 유형
	private String[] files;  // 첨부 파일	
}