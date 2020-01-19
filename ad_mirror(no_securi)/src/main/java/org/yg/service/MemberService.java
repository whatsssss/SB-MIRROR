package org.yg.service;

import org.yg.domain.AuthVO;
import org.yg.domain.MemberVO;

public interface MemberService {

	public void signUp(MemberVO vo);
	
	public void Auth(AuthVO VO);
}
