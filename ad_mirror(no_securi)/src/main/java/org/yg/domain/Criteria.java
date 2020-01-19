package org.yg.domain;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Criteria {

	private int page;
	private int amount;
	private Integer bno;
	private String type;
	private String keyword;
	
	public Criteria() {
		this.page = 1;
		this.amount = 10;
	}

	public void setPage(int page) {
		this.page = page <= 0? 1:page;
	}

	public void setAmount(int amount) {
		this.amount = amount <= 10? 10:amount;
	}

	public int getSkip() {
		return (this.page-1)*this.amount;
	}
	public String getLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("page", page)
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		return builder.toUriString();
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public Map<String, String> getMap(){//ê²??ƒ‰ ì¡°ê±´?— ?—¬?Ÿ¬ê°œê? ì¶”ê??•  ?•Œ ?‚¬?š©
		if (type == null || type.trim().length() == 0) {
			return null;
		}
		//T,C,Wë¡? ìª¼ê°œì§„ë‹¤.
		String[] arr = type.split("");
//		log.info(Arrays.toString(arr));
		Map<String, String> map = new HashMap<>();
		for (String word : arr) {
			map.put(word, keyword);
		}
//		log.info(map);
		return map;
	}

}
