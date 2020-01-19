package org.yg.service;

import java.util.List;

import org.yg.domain.AdVO;
import org.yg.domain.CustomerVO;

public interface DashService{
	public List<AdVO> getList(String userid);
	
	public CustomerVO collect(String userid);
}