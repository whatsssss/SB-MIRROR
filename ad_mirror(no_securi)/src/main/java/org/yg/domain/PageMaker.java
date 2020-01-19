package org.yg.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class PageMaker {

	private Criteria cri;
	private boolean prev, next;
	private int totalcount;
	private int current, start, end;
	
	public PageMaker(Criteria cri, int totalcount) {
		this.cri = cri;
		this.current = cri.getPage();
		this.totalcount = totalcount;
		int tempEnd = (int)Math.ceil(current/10.0)*10;
		start = tempEnd -9;
		prev = start!= 1;
		int tempTotal = tempEnd*cri.getAmount();
		if (tempTotal > totalcount) {
			end = (int)Math.ceil(totalcount/(double)cri.getAmount());
		}else {
			end = tempEnd;
		}
		next = tempTotal < totalcount;
	}
	
	public String getLink(String path, int pageNum) {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath(path)
				.queryParam("page", pageNum)
				.queryParam("amount", cri.getAmount());
		return builder.toUriString();
	}
}
