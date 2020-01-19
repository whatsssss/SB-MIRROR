package org.yg.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Integer rno;
	private Integer bno;
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
	private boolean secret;
	
}
