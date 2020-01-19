package org.yg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.yg.domain.AdVO;
import org.yg.domain.CustomerVO;

public interface DashMapper {
	
	@Select("select * from tbl_ad where userid = #{userid}")
	public AdVO select(String userid);

	@Select("select * from tbl_ad where userid = #{userid}")
	public List<AdVO> list(@Param("userid")String userid);
	
	@Select("select * from tbl_customer where userid = #{userid}")
	public CustomerVO collect(String userid);
}
