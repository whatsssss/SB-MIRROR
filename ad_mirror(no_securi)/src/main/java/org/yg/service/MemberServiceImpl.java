package org.yg.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yg.domain.AuthVO;
import org.yg.domain.MemberVO;
import org.yg.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	@Transactional
	@Override
	public void signUp(MemberVO vo) {
		mapper.insert(vo);

	}
	@Transactional
	@Override
	public void Auth(AuthVO VO) {
		mapper.insert_auth(VO);
		
	}

}
