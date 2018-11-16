package com.carto.board.domain;

import java.util.Date;
import lombok.Data;

@Data
public class ReplyVO {
	private Integer rno;      // 댓글 번호
	private Integer bno;      // 글 번호
	private String replytext; // 댓글 내용
	private String replyer;   // 댓글 작성자
	private Date createdate;  // 댓글 작성일
	private Date updatedate;  // 댓글 수정일
}
