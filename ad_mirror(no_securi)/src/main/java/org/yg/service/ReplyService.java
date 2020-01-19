package org.yg.service;

import java.util.List;

import org.yg.domain.ReplyVO;

public interface ReplyService extends GenericService<ReplyVO, Integer>{
	
	public List<ReplyVO> getSimpleList(Integer bno);
}
