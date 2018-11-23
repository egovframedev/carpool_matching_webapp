package com.carto.board.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("attachfileDTO")
public class AttachfileDTO {

	private Integer bno;
	private Integer fno;
	private String filename;
	private String uploadpath;
	private String uuid;
	private boolean image;
	private boolean fileType;
	
}
