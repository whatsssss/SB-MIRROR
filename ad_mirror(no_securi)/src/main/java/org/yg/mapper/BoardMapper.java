package org.yg.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.yg.domain.BoardVO;
import org.yg.domain.Criteria;

public interface BoardMapper {

	public void insert(BoardVO vo);

	public BoardVO select(Integer bno);

	public int update(BoardVO vo);

	@Delete("delete from tbl_board where bno = #{bno}")
	public int delete(Integer bno);

	public List<BoardVO> selectAll();

	@Select("select max(bno) from tbl_board ")
	public int getMax();

	public List<BoardVO> selectPage(Criteria cri);
	
	public List<BoardVO> selectPage1(Criteria cri);

	public int selectPageCount(Criteria cri);

	public List<BoardVO> search(@Param("map") Map<String, String> map);
	
	@Update("update tbl_board set replycnt = replycnt + #{amount} where bno = #{bno}")
	public void updateReplycnt(@Param("bno") Integer bno, @Param("amount") int amount);

}
