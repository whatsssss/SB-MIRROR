package org.yg.service;

import java.util.List;

import org.yg.domain.BoardAttachVO;
import org.yg.domain.BoardVO;
import org.yg.domain.Criteria;

public interface BoardService extends GenericService<BoardVO, Integer> {
	
	public List<BoardVO> listAll();
	
	public List<BoardAttachVO> getAttachList(Integer bno);
	
	public List<BoardVO> getList1(Criteria cri);
}
