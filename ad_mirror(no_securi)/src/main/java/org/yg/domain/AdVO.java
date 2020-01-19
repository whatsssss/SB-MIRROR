package org.yg.domain;

import lombok.Data;

@Data
public class AdVO {

	private String userid;
	private String adname;
	private Integer todayview, totalview, viewlate;
	}
