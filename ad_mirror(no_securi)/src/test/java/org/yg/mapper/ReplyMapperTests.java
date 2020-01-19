package org.yg.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.yg.domain.ReplyVO;
import org.yg.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Autowired
	private ReplyMapper mapper;
	
	private int[] bnoArr = {1,2,3,4,5};
	
	@Test
	public void testList() {
		
		mapper.list(2041).forEach(vo -> log.info(vo));
		
	}
	
	@Test
	public void testInsert() {
		
		IntStream.rangeClosed(1,10).forEach(i -> {
			
			ReplyVO vo = new ReplyVO();
			vo.setBno(bnoArr[i%5]);
			vo.setReply("reply test" + i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
		});
		
	}
	
	@Test
	public void testDelete() {
		
		IntStream.rangeClosed(1,10).forEach(i -> {
			
			int rno = mapper.delete(i);
			
		});
		
	}
}
