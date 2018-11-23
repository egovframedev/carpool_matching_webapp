package com.carto.board.domain;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("boardDTO")
public class BoardDTO {

	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private String pwd;
	private Date reg_date;
	private Integer hit;
	private Integer grpno;
	private Integer step;
	private Integer depth;
	private BoardType btype;
	
	//private String[] files;  // 첨부 파일	
	private List<AttachfileDTO> attachList;

}
