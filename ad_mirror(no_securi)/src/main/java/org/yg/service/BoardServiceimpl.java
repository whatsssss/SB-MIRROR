package org.yg.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yg.domain.BoardAttachVO;
import org.yg.domain.BoardVO;
import org.yg.domain.Criteria;
import org.yg.mapper.BoardAttachMapper;
import org.yg.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardServiceimpl implements BoardService {

	private BoardMapper mapper;
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public Integer register(BoardVO vo) {
		if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			mapper.insert(vo);
			log.info("vo: " + vo);
			return mapper.getMax();
		}
		vo.setFilecheck(true);
		mapper.insert(vo);
		log.info("vo: " + vo);
		vo.getAttachList().forEach(attach -> {
			attach.setBno(mapper.getMax());
			attachMapper.insert(attach);
		});
		return mapper.getMax();
	}

	@Override
	public BoardVO get(Integer key) {
		return mapper.select(key);
	}

	@Transactional
	@Override
	public int modify(BoardVO vo) {
		log.info("modify/" + vo.getBno());
		attachMapper.deleteAll(vo.getBno());
		boolean modifyResult = mapper.update(vo) == 1;
		if (modifyResult && vo.getAttachList() != null && vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(atttach -> {
				atttach.setBno(vo.getBno());
				attachMapper.insert(atttach);
			});
		}
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Integer key) {
		log.info("remove/" + key);
		attachMapper.deleteAll(key);
		return mapper.delete(key);
	}

	@Override
	public List<BoardVO> listAll() {
		return mapper.selectAll();
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.selectPage(cri);
	}

	@Override
	public List<BoardVO> getList1(Criteria cri) {
		return mapper.selectPage1(cri);
	}
	
	@Override
	public int getListCount(Criteria cri) {
		return mapper.selectPageCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Integer bno) {
		log.info("GetAttachList by bno : " + bno);
		return attachMapper.findByBno(bno);
	}

}
