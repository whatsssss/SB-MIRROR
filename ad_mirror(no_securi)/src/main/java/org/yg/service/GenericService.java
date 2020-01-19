package org.yg.service;

import java.util.List;

import org.yg.domain.Criteria;

public interface GenericService<VO, K> {

	public Integer register(VO vo);

	public VO get(K key);

	public int modify(VO vo);

	public int remove(K key);
	
	public List<VO> getList(Criteria cri);
	
	public int getListCount(Criteria cri);

}
