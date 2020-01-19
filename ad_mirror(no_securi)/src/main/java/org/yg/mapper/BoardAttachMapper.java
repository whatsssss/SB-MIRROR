package org.yg.mapper;

import java.util.List;

import org.yg.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);

	public List<BoardAttachVO> findByBno(Integer bno);

	public void deleteAll(Integer bno);
}
