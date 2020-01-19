package org.yg.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.yg.domain.AdVO;
import org.yg.domain.CustomerVO;
import org.yg.mapper.DashMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class DashServiceImpl implements DashService {
	
	private DashMapper dashmapper;
	
	@Override
	public List<AdVO> getList(String userid) {
		log.info("userid : "+userid);
		return dashmapper.list(userid);
	}

	@Override
	public CustomerVO collect(String userid) {
		log.info("userid : "+userid);
		return dashmapper.collect(userid);
	}

}
