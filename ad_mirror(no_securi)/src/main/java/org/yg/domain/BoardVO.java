package org.yg.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Integer bno;
	private String title, content, writer;
	private Date regdate;
	private int replycnt;
	private List<BoardAttachVO> attachList;
	private boolean secret;
	private boolean filecheck;

}
