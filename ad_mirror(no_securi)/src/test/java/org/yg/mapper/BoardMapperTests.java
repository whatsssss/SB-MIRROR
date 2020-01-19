package org.yg.mapper;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.yg.domain.BoardVO;
import org.yg.domain.Criteria;
import org.yg.domain.PageMaker;
import org.yg.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	BoardMapper mapper;
	
	@Test
	public void testMap() {
		
		String type = "TCW";
		String keyword ="Hi";
		
		if(type == null|| type.trim().length() == 0) {
			//return null;
		}
		
		//T,C,W
		String[] arr = type.split("");
		
		log.info(Arrays.toString(arr));
		
		Map<String, String> map = new HashMap<>();
		
		for(String word: arr){
			map.put(word, keyword);
		}
		log.info(map);
	}
	
	@Test
	public void testSearch() {
		Map<String, String> map = new HashMap<>();
		map.put("T","pick");
		map.put("C","me");
		map.put("W","user00");
		mapper.search(map);
	}
	
	@Test
	public void testPageMaker() {
		
		Criteria cri = new Criteria();
		cri.setPage(11);
		PageMaker pm = new PageMaker(cri,201);
		
		log.info(pm);
		
		log.info(pm.getLink("/board/list", 3));
		
	}
	
	@Test
	public void testPaging() {
		
		// 1page, 10 
		Criteria cri = new Criteria();
		cri.setAmount(50);
		cri.setType("W");
		cri.setKeyword("user00");
		
		mapper.selectPage(cri).forEach(vo -> log.info(vo));
		
	}
	
	@Test
	public void testDelete() {
		
		int count = mapper.delete(6);
		
		log.info("delete count: " + count);
		
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO vo = mapper.select(5);
		vo.setTitle("Hello");
		vo.setContent("sydeny");
		
		int count = mapper.update(vo);
		
		log.info("update count: " + count);
		
	}
	
	@Test
	public void testSelect() {
		
		BoardVO vo = mapper.select(5);		
		log.info(vo);		
	}
	

	@Test
	public void testInsert() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("Hello");
		vo.setContent("sydeny");
		vo.setWriter("user01");
		mapper.insert(vo);
		
	}
	
	
}





