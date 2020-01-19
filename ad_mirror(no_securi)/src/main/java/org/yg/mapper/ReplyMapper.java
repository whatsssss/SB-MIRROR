package org.yg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.yg.domain.ReplyVO;

public interface ReplyMapper {
	
	@Insert("insert into tbl_reply (bno, reply, replyer, secret) values (#{bno},#{reply},#{replyer},#{secret})")
	public int insert(ReplyVO vo);
	
	@Select("select * from tbl_reply where bno = #{bno} order by rno asc")
	public List<ReplyVO> list(@Param("bno")Integer bno);
	
	@Select("select * from tbl_reply where rno = #{rno}")
	public ReplyVO select(@Param("rno")Integer rno);
	
	@Delete("delete from tbl_reply where rno = #{rno}")
	public int delete(@Param("rno")Integer rno);
	
	@Update("update tbl_reply set reply = #{reply}, secret = #{secret}, updatedate = now() where rno = #{rno}")
	public int update(ReplyVO vo);

	@Select("select max(rno) from tbl_reply")
	public int getMax();
}
