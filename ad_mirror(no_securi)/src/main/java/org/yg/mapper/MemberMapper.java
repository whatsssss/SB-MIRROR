package org.yg.mapper;

import org.yg.domain.AuthVO;
import org.yg.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);
	
	public void insert(MemberVO vo);
	
	public void insert_auth(AuthVO vo);
	
	public MemberVO info(String userid);

}
