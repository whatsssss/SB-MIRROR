package org.yg.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yg.domain.Criteria;
import org.yg.domain.ReplyVO;
import org.yg.mapper.BoardMapper;
import org.yg.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	private ReplyMapper mapper;
	private BoardMapper boardmapper;
	
	@Transactional
	@Override
	public Integer register(ReplyVO vo) {
		log.info("vo : "+vo);	
		boardmapper.updateReplycnt(vo.getBno(), 1);
		mapper.insert(vo);
		 return mapper.getMax();
	}

	@Override
	public ReplyVO get(Integer key) {
		return mapper.select(key);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Integer rno) {
		ReplyVO vo = mapper.select(rno);
		boardmapper.updateReplycnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri) {
		return null;
	}

	@Override
	public int getListCount(Criteria cri) {
		return 0;
	}

	@Override
	public List<ReplyVO> getSimpleList(Integer bno) {
		return mapper.list(bno);
	}

}

