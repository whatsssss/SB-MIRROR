package org.yg.domain;

import lombok.Data;

@Data
public class CustomerVO {

	private String userid;
	private Integer day_visit, week_visit, month_visit, total_visit;
}
