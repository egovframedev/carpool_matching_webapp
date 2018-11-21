package com.carto.board.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import lombok.Data;

@Data
public class BoardDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer bno;     // 글 번호
	private String title;    // 글 제목
	private String content;  // 글 내용
	private String writer;   // 작성자
	private Date regdate;    // 작성일
	private int viewcnt;     // 조회수
	private int replycnt;    // 댓글 갯수
	private int grpno;       // 답변 그룹
	private int step = 0;    // 답변 순서
	private int detph = 0;   // 답변 깊이(단계)
	private boolean ropen;   // 내용공개여부
	private String pwd;      // 비공개시 암호
	private BoardType btype = BoardType.NORMAL; // 게시판 유형
	
	private List<BoardAttachDTO> attachList;	
	
	public void setBtype(BoardType btype) {
		this.btype = btype;
	}
	
	public void setBtype(String btype) {
		this.btype = BoardType.valueOf(btype.toUpperCase());
	}
}