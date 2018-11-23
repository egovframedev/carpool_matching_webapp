package com.carto.member.domain;

import java.util.Date;
import lombok.Data;

@Data
public class MessageDTO {
	private Integer msgId;
	private MessageType msgType;
	private String receiver;
	private String sender;
	private String body;
	private Date openDate;
	private Date sendDate;
}
